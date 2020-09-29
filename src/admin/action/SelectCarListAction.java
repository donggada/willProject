package admin.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.svc.CarListService;
import admin.svc.SelectCarListService;
import admin.vo.CarBean;
import member.action.Action;
import member.vo.ActionForward;
import qna.vo.pageinfo;

public class SelectCarListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		ArrayList<CarBean> CarList=null;
		String carsearch1=request.getParameter("carsearch1");
		String carsearch2=request.getParameter("carsearch2");
		
		int page = 1; 
		int limit = 10;
		String taget="car_id";
		String table="car";
		
		switch (carsearch1) {
		case "1": carsearch1="car_num";			
		break;
		
		case "2": carsearch1="car_maker";			
		break;
		
		case "3": carsearch1="car_type";			
		break;
		
		}
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page")); 
		}
		
		
		CarListService CarListService = new CarListService();
		
		
		int listCount = CarListService.getListCount(taget,table,carsearch1,carsearch2);
		 
		
		int maxPage = (int)((double)listCount / limit + 0.95);
		
		
		int startPage = ((int)((double)page / 10 + 0.9) - 1) * 10 + 1;
		
		
		int endPage = startPage + 10 - 1;
		
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		
		pageinfo pageInfo = new pageinfo(page, maxPage, startPage, endPage, listCount);
		
		
		
		
		SelectCarListService scls=new SelectCarListService();
		CarList=scls.SelectCarList(carsearch1,carsearch2,page, limit);
		
		request.setAttribute("articlelist",CarList);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("carsearch1",carsearch1);
		request.setAttribute("carsearch2", carsearch2);
		
		forward=new ActionForward();
		forward.setPath("/Admin/AdminCarSelectList.jsp");
		
		return forward;
	}

}

package admin.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.svc.CarListService;
import admin.svc.MemberListService;
import admin.vo.CarBean;
import member.action.Action;
import member.vo.ActionForward;
import member.vo.MemberBean;
import qna.vo.pageinfo;

public class CarListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		int page = 1; 
		int limit = 10;
		String taget="car_id";
		String table="car";
		//String taget=request.getParameter("taget");
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page")); 
		}
		
		
		CarListService CarListService = new CarListService();
		
		
		int listCount = CarListService.getListCount(taget,table);
		
		
		ArrayList<CarBean> CarList = CarListService.getArticleList(page, limit);
		 
		
		
		int maxPage = (int)((double)listCount / limit + 0.95);
		
		
		int startPage = ((int)((double)page / 10 + 0.9) - 1) * 10 + 1;
		
		
		int endPage = startPage + 10 - 1;
		
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		
		pageinfo pageInfo = new pageinfo(page, maxPage, startPage, endPage, listCount);
		
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("CarList", CarList);
		
		
		forward = new ActionForward();
		forward.setPath("/Admin/AdminPage.jsp");
		forward.setRedirect(false);
		
		
		return forward;
	}

}

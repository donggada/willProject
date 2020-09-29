package admin.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.svc.CarListService;
import admin.svc.SelectCarListService;
import member.action.Action;
import member.vo.ActionForward;
import member.vo.MemberBean;
import qna.vo.pageinfo;

public class SelectMemberListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		ArrayList<MemberBean> MemberList=null;
		
		String carsearch1=request.getParameter("carearch1");
		String carsearch2=request.getParameter("carsearch2");
		
		int page = 1; 
		int limit = 10;
		String taget="member_num";
		String table="member";
		
		switch (carsearch1) {
		case "1": carsearch1="member_id";			
		break;
		
		case "2": carsearch1="member_name";			
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
		MemberList=scls.SelectMemberList(carsearch1, carsearch2, endPage, limit);
		
		request.setAttribute("articlelist",MemberList);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("carsearch1",carsearch1);
		request.setAttribute("carsearch2", carsearch2);
		
		forward=new ActionForward();
		forward.setPath("/Admin/Selectmmlistadmin.jsp");
		
		
		return forward;
	}

}

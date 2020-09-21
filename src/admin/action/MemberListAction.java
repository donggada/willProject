package admin.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.svc.MemberListService;
import member.action.Action;
import member.vo.ActionForward;
import member.vo.MemberBean;
import qna.vo.pageinfo;

public class MemberListAction extends ActionForward implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		int page = 1; 
		int limit = 10;
		String taget="member_id";
		String table="member";
		//String taget=request.getParameter("taget");
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page")); 
		}
		
		
		MemberListService MemberListService = new MemberListService();
		
		
		int listCount = MemberListService.getListCount(taget,table);
		
		
		ArrayList<MemberBean> MemberList = MemberListService.getArticleList(page, limit);
		 
		
		
		int maxPage = (int)((double)listCount / limit + 0.95);
		
		
		int startPage = ((int)((double)page / 10 + 0.9) - 1) * 10 + 1;
		
		
		int endPage = startPage + 10 - 1;
		
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		
		pageinfo pageInfo = new pageinfo(page, maxPage, startPage, endPage, listCount);
		
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("MemberList", MemberList);
		
		
		forward = new ActionForward();
		forward.setPath("/Admin/AdminPage.jsp");
		forward.setRedirect(false);
		
		
		
		
		return forward;
	}

}

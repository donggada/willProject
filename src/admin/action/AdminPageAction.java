package admin.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.svc.AdminPageService;
import book.vo.BookBean;
import member.action.Action;
import member.vo.ActionForward;

public class AdminPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward= null;
		ArrayList<BookBean> Statslist=null;
		ArrayList<BookBean> Monthlist=null;
		
		AdminPageService aps=new AdminPageService();
		Statslist=aps.statslist();
		Monthlist=aps.Monthlist();
		
		request.setAttribute("Statslist", Statslist);  //월별 
		request.setAttribute("Monthlist", Monthlist);  //이달매출액	
		
		forward=new ActionForward();
		forward.setPath("/Admin/index.jsp");
		
		return forward ;
	}

}

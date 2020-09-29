package admin.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.svc.MemberDeleteService;
import admin.svc.MemberListService;
import admin.svc.MembermodifyService;
import faq.vo.actionForward;
import member.action.Action;
import member.vo.ActionForward;
import member.vo.MemberBean;
import qna.vo.pageinfo;

public class MemberDeleteProAction extends ActionForward implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		int page = 1; 
		int limit = 10;
		//String table="member";
		String table=request.getParameter("table");
		int target=Integer.parseInt(request.getParameter("idx"));
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page")); 
		}
		
		
		MemberDeleteService MemberListService = new MemberDeleteService();
		boolean isdelete = MemberListService.delete(target,table);
		
	

		
		
		
		if(!(isdelete)) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>"); 
			out.println("alert('삭제실패')"); 
			out.println("history.back()");
			out.println("</script>"); 
			
		}else {
			forward=new ActionForward();
			forward.setRedirect(true);
			if(table.equals("member")) {
			forward.setPath("MemberList.ad?"+"&page="+page);
			
			}else if(table.equals("car")) {
			forward.setPath("CarList.ad?"+"&page="+page);
			}
		
		}
		
		
		return forward;
	}

}

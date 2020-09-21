package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.svc.MemberLoginProService;
import member.vo.ActionForward;

public class MemberLoginProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberLoginProAction");
		ActionForward forward=null;
		int isLoginsuccess=0;
		String id=request.getParameter("Member_id");
		String pass=request.getParameter("Member_pass");
		System.out.println(id);
		
		MemberLoginProService mlps=new MemberLoginProService();
		isLoginsuccess=mlps.MemberLogin(id,pass);
				
		
		if(isLoginsuccess==1) {
			request.setAttribute("Member_id", id);
			forward=new ActionForward();
			forward.setPath("index.jsp");
			forward.setRedirect(false);
			
		}else if(isLoginsuccess==0) {
			response.setContentType("text/html;charset=UTF-8"); 
			PrintWriter out = response.getWriter(); 
			out.println("<script>"); 
			out.println("alert('아이디 틀림!')"); 
			out.println("history.back()");
			out.println("</script>");
			
		}else if(isLoginsuccess==-1) {
			response.setContentType("text/html;charset=UTF-8"); 
			PrintWriter out = response.getWriter(); 
			out.println("<script>"); 
			out.println("alert('비밀번호 틀림!')"); 
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}

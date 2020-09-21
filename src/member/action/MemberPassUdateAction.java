package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.svc.MemberPassUpdateService;
import member.vo.ActionForward;

public class MemberPassUdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		boolean ispassupdate=false;
		String name=request.getParameter("Member_name");
		String license=request.getParameter("Member_license");
		String id=request.getParameter("Member_id");
		String pass=request.getParameter("Member_pass");
		String pass1=request.getParameter("Member_pass1");
		
		MemberPassUpdateService mpus=new MemberPassUpdateService();
		
		if(pass.equals(pass1)) {
			ispassupdate=mpus.passupdate(pass,name,license,id);
		}else {
			response.setContentType("text/html;charset=UTF-8"); 
			PrintWriter out = response.getWriter(); 
			out.println("<script>"); 
			out.println("alert('비밀번호가 일치하지않습니다!')"); 
			out.println("history.back()");
			out.println("</script>");
		}
		
		
		if(ispassupdate) {
			forward=new ActionForward();
			forward.setPath("Member/Member_Login.jsp");
			forward.setRedirect(false);
		}else {
			response.setContentType("text/html;charset=UTF-8"); 
			PrintWriter out = response.getWriter(); 
			out.println("<script>"); 
			out.println("alert('비밀번호 수정실패!')"); 
			out.println("history.back()");
			out.println("</script>");
		}
		
		
		return forward;
	}

}

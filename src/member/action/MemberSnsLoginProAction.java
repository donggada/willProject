package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.svc.MemberSnsLoginProService;
import member.vo.ActionForward;

public class MemberSnsLoginProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberSnsLoginProAction");
		ActionForward forward=null;
		boolean isSnsLoginsuccess=false;
		String id=request.getParameter("id");
		
		MemberSnsLoginProService mslps=new MemberSnsLoginProService();
		isSnsLoginsuccess=mslps.snsLogin(id);
		
		
		if(isSnsLoginsuccess) {
			request.setAttribute("Member_snsid",id);
			forward=new ActionForward();
			forward.setPath("index.jsp");
			forward.setRedirect(false);
		}else {
			response.setContentType("text/html;charset=UTF-8"); 
			PrintWriter out = response.getWriter(); 
			out.println("<script>"); 
			out.println("alert('로그인 실패!')"); 
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}

package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.svc.MemberIDFindProService;
import member.vo.ActionForward;

public class MemberIDFindAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberIDFindAction");
		ActionForward forword=null;
		boolean isFindID=false;
		String name=request.getParameter("Member_name");
		String license=request.getParameter("Member_license");
		
		MemberIDFindProService midps=new MemberIDFindProService();
		isFindID= midps.MemberIDFind(name,license);
		
		if(isFindID) {
			String findid=midps.lookid(name,license);
			forword=new ActionForward();
			forword.setPath("/Member/Member_id_result.jsp?findid="+findid);
			forword.setRedirect(false);
		}else {
			response.setContentType("text/html;charset=UTF-8"); 
			PrintWriter out = response.getWriter(); 
			out.println("<script>"); 
			out.println("alert('등록된 아이디가 없습니다!')"); 
			out.println("history.back()");
			out.println("</script>");
		}
		
		
		return forword;
	}

}

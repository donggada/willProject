package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.svc.MemberIDFindProService;
import member.svc.MemberPassFindProService;
import member.vo.ActionForward;

public class MemberPassFindAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		System.out.println("MemberPassFindAction");
		boolean isFindID=false;
		String name=request.getParameter("Member_name");
		String license=request.getParameter("Member_license");
		String id=request.getParameter("Member_id");
		
		MemberPassFindProService mpdps=new MemberPassFindProService();
		isFindID= mpdps.MemberPassUpdate(name,license,id);
		System.out.println(isFindID);
		
		
		if(isFindID) {
			forward=new ActionForward();
			forward.setPath("Member/Member_passUpdate.jsp");
			forward.setRedirect(false);
		}else {
			response.setContentType("text/html;charset=UTF-8"); 
			PrintWriter out = response.getWriter(); 
			out.println("<script>"); 
			out.println("alert('등록된 정보가 없습니다!')"); 
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}

package admin.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.svc.MemberListService;
import admin.svc.MembermodifyService;
import faq.vo.actionForward;
import member.action.Action;
import member.action.MemberIDFindAction;
import member.vo.ActionForward;
import member.vo.MemberBean;
import qna.vo.pageinfo;

public class MemberModifyProAction extends ActionForward implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		int page = 1; 
		int limit = 10;
		String table="member";
		String taget=request.getParameter("member_id");
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page")); 
		}
		
		
		
		MemberBean bb=new MemberBean();
		bb.setMember_name(request.getParameter("name"));
		bb.setMember_id(request.getParameter("id"));
		bb.setMember_pass(request.getParameter("pass"));
		bb.setMember_email(request.getParameter("email"));
		bb.setMember_age(request.getParameter("age"));
		bb.setMember_gender(request.getParameter("gender"));
		bb.setMember_tel(request.getParameter("tel"));
		bb.setMember_adress(request.getParameter("email"));
		bb.setMember_license(request.getParameter("license"));
		bb.setMember_smoke(request.getParameter("smoke"));
		bb.setMember_pet(request.getParameter("pet"));
		bb.setMember_boby(request.getParameter("baby"));
		bb.setMember_grade(request.getParameter("member_grade"));
		
	
	
		System.out.println(request.getParameter("member_grade"));
		
		
		
		
		MembermodifyService MemberListService = new MembermodifyService();
		
		boolean ismodify = MemberListService.mmmodify(bb);
	
		
		
		
		if(!(ismodify)) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>"); 
			out.println("alert('수정실패')"); 
			out.println("history.back()");
			out.println("</script>"); 
			
		}else {
			forward=new ActionForward();
			forward.setRedirect(true);
			forward.setPath("MemberList.ad?"+"&page="+page);
		
		}
		
		
		
		
		return forward;
	}

}

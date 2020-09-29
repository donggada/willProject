package admin.action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.action.Action;
import member.vo.ActionForward;

public class PopUpPageOnAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		System.out.println("PopUpPageOnAction");
		
		Cookie cookie=new Cookie("POPUP","PAGEOPEN");
		response.addCookie(cookie);
		
		forward=new ActionForward();
		forward.setPath("Admin/PoP-UpPage.jsp");
		
		return forward;
	}

}

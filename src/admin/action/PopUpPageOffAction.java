package admin.action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.action.Action;
import member.vo.ActionForward;

public class PopUpPageOffAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		System.out.println("PopUpPageOffAction");
		
		Cookie cookie=new Cookie("POPUP",null);
		response.addCookie(cookie);
		
		forward=new ActionForward();
		forward.setPath("Admin/PoP-UpPage.jsp");
		
		return forward;
	}

}

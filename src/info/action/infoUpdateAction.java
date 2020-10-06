package info.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import info.vo.ActionForward;

public class infoUpdateAction implements Action {

	@Override
	public ActionForward exectute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		request.setCharacterEncoding("utf-8");
		String name = (String)request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String tel = (String)request.getParameter("tel");
		
		System.out.println(name);
		System.out.println(age);
		System.out.println(tel);
		
		return forward;
	}

}


package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.action.Action;
import member.action.MemberIDFindAction;
import member.action.MemberJoinProAction;
import member.action.MemberLoginProAction;
import member.action.MemberLogoutAction;
import member.action.MemberPassFindAction;
import member.action.MemberPassUdateAction;
import member.action.MemberSnsLoginProAction;
import member.vo.ActionForward;

@WebServlet("*.me")
public class MemberFrontController extends HttpServlet {
	
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberFrontController");
		request.setCharacterEncoding("UTF-8");
		String command=request.getServletPath();
		System.out.println(command);
		Action action=null;
		ActionForward forward=null;
		
		if(command.equals("/JoinForm.me")) { //회원가입 화면 이동 
			forward=new ActionForward();
			forward.setPath("/Member/Member_Join.jsp");
		}else if(command.equals("/MemberJoinPro.me")) { //회원가입 실행 
			action=new MemberJoinProAction();
			try {
			forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/LoginForm.me")) {  // 로그인 화면 이동 
			forward=new ActionForward();
			forward.setPath("/Member/Member_Login.jsp");
		}else if (command.equals("/MemberLoginPro.me")) {  // 로그인 실행 
			action=new MemberLoginProAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/snsLogin.me")) {   //sns 로그인 실행
			action=new MemberSnsLoginProAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/findID.me")) {
			forward=new ActionForward();
			forward.setPath("/Member/Member_id_find.jsp");
		}else if(command.equals("/findPass.me")) {
			forward=new ActionForward();
			forward.setPath("/Member/Member_pass_find.jsp");
		}else if(command.equals("/findIDPro.me")) {
			action=new MemberIDFindAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/findPassPro.me")) {
			action=new MemberPassFindAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/PassupdatePro.me")) {
			action=new MemberPassUdateAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberLogout.me")) {
			action=new MemberLogoutAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
		
		if(forward!=null) {
			
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	
	}

}

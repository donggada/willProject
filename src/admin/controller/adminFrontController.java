
package admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.action.CarListAction;
import admin.action.GraphProAction;
import admin.action.MemberListAction;
import admin.action.QnABoardAction;
import member.action.Action;

import member.vo.ActionForward;

@WebServlet("*.ad")
public class adminFrontController extends HttpServlet {
	
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("adminFrontController");
		request.setCharacterEncoding("UTF-8");
		String command=request.getServletPath();
		System.out.println(command);
		Action action=null;
		ActionForward forward=null;
		
		if(command.equals("/adminpage.ad")) { //회원가입 화면 이동 
			forward=new ActionForward();
			forward.setPath("/Admin/AdminPage.jsp");
		}else if(command.equals("/MemberList.ad")) {
			action=new MemberListAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				
				e.printStackTrace();
			}
		}else if (command.equals("/CarList.ad")) {
			action=new CarListAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/GraphPro.ad")) {
			action=new GraphProAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/QnABoard.ad")) {
			action=new QnABoardAction();
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

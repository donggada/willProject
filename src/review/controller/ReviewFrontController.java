package review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.action.Action;
import review.action.BookList;
import review.action.BookListAction;
import review.action.RecoUpdateAction;
import review.action.ReviewDeleteProAction;
import review.action.ReviewDetailAction;
import review.action.ReviewListAction;
import review.action.ReviewModifyFormAction;
import review.action.ReviewModifyProAction;
import review.action.ReviewWriteProAction;
import review.vo.ActionForward;


@WebServlet("*.rw")
public class ReviewFrontController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ReviewFrontController");
		request.setCharacterEncoding("UTF-8");
		String command = request.getServletPath();
		System.out.println(command);
		Action action = null;
		ActionForward forward = null;
		
		
		if(command.equals("/ReviewWriteForm.rw")) { //리뷰글작성
			forward = new ActionForward();
			forward.setPath("/review/reviewWriteForm.jsp");
		}else if(command.equals("/ReviewWritePro.rw")) { //리뷰글 작성Pro
			action = new ReviewWriteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/ReviewList.rw")) { //리뷰글 목록
			action = new ReviewListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/ReviewDetail.rw")) { //리뷰글 상세보기
			action = new ReviewDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/ReviewModifyForm.rw")) { //리뷰글 수정
			action = new ReviewModifyFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/ReviewModifyPro.rw")) { //리뷰글 수정Pro
			action = new ReviewModifyProAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/ReviewDeleteForm.rw")) { //리뷰글 삭제
			forward = new ActionForward();
			forward.setPath("/review/reviewDeleteForm.jsp");
		}else if(command.equals("/ReviewDeletePro.rw")) { //리뷰글삭제Pro
			action = new ReviewDeleteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/ReviewRecoCheck.rw")) { //리뷰글 추천
			action = new RecoUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/BookCheck.rw")) {
			action = new BookListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/carIntro.rw")) {
			forward = new ActionForward();
			forward.setPath("/carIntro/carIntro.jsp");
		}
		
		
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
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

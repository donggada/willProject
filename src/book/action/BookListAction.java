package book.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.vo.BookBean;
import book.vo.PageInfo;

import book.svc.BookListService;
import book.vo.ActionForward;
import book.vo.BookBean;

public class BookListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		System.out.println("북 리스트 액션");

		ActionForward forward = null;
		String orderTarget = request.getParameter("orderTarget");
		String orderType = request.getParameter("orderType");
		BookListService bookListService = new BookListService();

		ArrayList<BookBean> bookList = null;

		if (orderTarget == null) {
			bookList = bookListService.getBookList();
		} else { // 파라미터가 있을 경우
			bookList = bookListService.getBookList(orderTarget, orderType);
		}

		request.setAttribute("bookList", bookList);

		forward = new ActionForward();
		forward.setPath("/book/bookList.jsp");

		System.out.println("북리스트 액션 끝단");

		return forward;
	}

}

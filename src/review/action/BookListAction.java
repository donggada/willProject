package review.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.vo.BookBean;
import review.vo.PageInfo;

import review.svc.BookListService;
import review.vo.ActionForward;
import review.vo.BookBean;

public class BookListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		
		System.out.println("북 리스트 액션");
		
		
		ActionForward forward = null;

		// 파라미터로 전달되는 항목이 하나라도 존재하면
		// getMemberList() 메서드에 파라미터를 전달하여 SELECT 구문의 조건을 설정하고
		// 파라미터가 없을 경우 SELECT 구문의 조건 설정 없이 기본 조회 수행
		String orderTarget = request.getParameter("orderTarget");
		String orderType = request.getParameter("orderType");
		
		// MemberListService 클래스의 getMemberList() 메서드를 호출하여
		// 전체 회원 목록 조회 요청 작업을 수행
		// => 파라미터 : 없음, 리턴타입 : ArrayList<MemberBean>
		BookListService bookListService = new BookListService();

		ArrayList<BookBean> bookList = null;

		if (orderTarget == null) { // 파라미터가 없을 경우
			bookList = bookListService.getBookList();
		} else { // 파라미터가 있을 경우
			bookList = bookListService.getBookList(orderTarget, orderType);
		}

//		System.out.println(memberList);

		// 조회된 전체 목록을 ArrayList<MemberBean> 객체로 전달받아
		// request 객체에 저장(memberList)
		request.setAttribute("bookList", bookList);

		// member 디렉토리의 member_list.jsp 페이지로 포워딩
		forward = new ActionForward();
		forward.setPath("/review/bookSearch.jsp");
		

		return forward;
	}

}

package review.svc;

import static review.db.jdbcUtil.*;


import java.sql.Connection;
import java.util.ArrayList;

import review.dao.BookDAO;
import review.vo.BookBean;


public class BookListService {

	public ArrayList<BookBean> getBookList() {

		Connection con = getConnection();

		BookDAO bookDAO = BookDAO.getInstance();

		bookDAO.setConnection(con);

		// MemberDAO 클래스의 selectMemberList() 메서드를 호출하여
		// 회원 목록 조회 요청 작업 수행
		// => 파라미터 : 없음, 리턴타입 : ArrayList<MemberBean>
		ArrayList<BookBean> memberlist = bookDAO.selectBookList();

		close(con);

		return memberlist;
	}

	public ArrayList<BookBean> getBookList(String orderTarget, String orderType) {
		Connection con = getConnection();

		BookDAO bookDAO = BookDAO.getInstance();

		bookDAO.setConnection(con);

		ArrayList<BookBean> booklist = bookDAO.selectBookList(orderTarget, orderType);

		close(con);

		return booklist;

	}

}

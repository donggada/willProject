package book.dao;

import static book.db.JdbcUtil.close;
import static book.db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;

import book.dao.BookDAO;
import book.vo.BookBean;

public class BookDAO {

	private BookDAO() {
	}

	private static BookDAO instance = new BookDAO();

	public static final BookDAO getInstance() {
		// TODO Auto-generated method stub.

		if (instance == null) {
			instance = new BookDAO();
		}

		return instance;
	}

	Connection con;

	public void setConnection(Connection con) {
		this.con = con;

	}

	public int insertArticle(BookBean article) {
		// TODO Auto-generated method stub

		int insertCount = 0; // INSERT 작업 결과를 저장할 변수

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			String sql = "SELECT MAX(book_num) FROM book";
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			int num = 1;

			if (rs.next()) {

				num = rs.getInt(1) + 1;
			}

			sql = "insert into book(book_num, book_date, pickup_date, end_date,book_date2) values(?,?,?,?,now()) ";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, num);
			pstmt.setDate(2, article.getBook_date()); // 예약일
			pstmt.setDate(3, article.getPickup_date()); // 수령
			pstmt.setDate(4, article.getEnd_date()); // 반납

			insertCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// PreparedStatement, ResultSet 객체 반환
			close(rs); // JdbcUtil.close(rs)
			close(pstmt); // JdbcUtil.close(rs)
		}

		return insertCount;
	}

	// 회원 목록 조회 작업을 위한 selectMemberList() 메서드 정의
	public ArrayList<BookBean> selectBookList() {
		ArrayList<BookBean> bookList = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM book";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			bookList = new ArrayList<BookBean>();

			while (rs.next()) {
				// 조회된 결과 중 1개 레코드를 MemberBean 객체에 저장 후 ArrayList 에 추가
				BookBean book = new BookBean();
				book.setBook_num(rs.getInt("book_num"));

				book.setMember_id(rs.getString("member_id"));
				book.setBook_date(rs.getDate("book_date"));
				book.setPickup_date(rs.getDate("pickup_date"));
				book.setEnd_date(rs.getDate("end_date"));
				book.setCar_id(rs.getString("car_id"));
				book.setBook_price(rs.getInt("book_price"));
				book.setBook_state(rs.getInt("book_state"));

				bookList.add(book);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("MemberDAO - selectMemberList() 오류!");
		} finally {
			close(rs);
			close(pstmt);
		}

		return bookList;
	}

	public ArrayList<BookBean> selectBookList(String orderTarget, String orderType) {
		ArrayList<BookBean> bookList = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM member ORDER BY " + orderTarget + " " + orderType;
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			bookList = new ArrayList<BookBean>();

			while (rs.next()) {
				// 조회된 결과 중 1개 레코드를 MemberBean 객체에 저장 후 ArrayList 에 추가
				BookBean book = new BookBean();
				book.setBook_num(rs.getInt("book_num"));

				book.setMember_id(rs.getString("member_id"));
				book.setBook_date(rs.getDate("book_date"));
				book.setPickup_date(rs.getDate("pickup_date"));
				book.setEnd_date(rs.getDate("end_date"));
				book.setCar_id(rs.getString("car_id"));
				book.setBook_price(rs.getInt("book_price"));
				book.setBook_state(rs.getInt("book_state"));

				bookList.add(book);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("MemberDAO - selectMemberList() 오류!");
		} finally {
			close(rs);
			close(pstmt);
		}

		return bookList;
	}

	// 삭제

	public int deleteArticle(int book_num) {
		// TODO Auto-generated method stub

		int insertCount = 0; // INSERT 작업 결과를 저장할 변수

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			String sql = "delete from book where book_num = ?";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, book_num);

			rs = pstmt.executeQuery();

			insertCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// PreparedStatement, ResultSet 객체 반환
			close(rs); // JdbcUtil.close(rs)
			close(pstmt); // JdbcUtil.close(rs)
		}

		return insertCount;
	}

	// 수정
	public int updateArticle(BookBean bb) {
		// TODO Auto-generated method stub

		int insertCount = 0; // INSERT 작업 결과를 저장할 변수

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

//		String sql = "update book set book_date=?,pickup_date=?,end_date=?, car_id=?,book_price=?,insurance=?,book_state=?";

			StringBuffer sql = new StringBuffer();

			sql.append("update book set ");
			sql.append("bbook_date=?,pickup_date=?,end_date=?, ");
			sql.append("car_id=?,book_price=?,insurance=?,book_state=?");

			pstmt = con.prepareStatement(sql.toString());

			pstmt.setDate(1, bb.getBook_date());
			pstmt.setDate(2, bb.getPickup_date());
			pstmt.setDate(3, bb.getEnd_date());
			pstmt.setString(4, bb.getCar_id());
			pstmt.setInt(5, bb.getBook_price());
			pstmt.setInt(6, bb.getInsurance());
			pstmt.setInt(6, bb.getBook_state());

			rs = pstmt.executeQuery();

			insertCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// PreparedStatement, ResultSet 객체 반환
			close(rs); // JdbcUtil.close(rs)
			close(pstmt); // JdbcUtil.close(rs)
		}

		return insertCount;
	}

	public ArrayList<BookBean> selectBookListadmin(String str1, String str2) {
		ArrayList<BookBean> bookList = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM book where book_date between ? and ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, str1); //시작레코드번호 
			pstmt.setString(2, str2); //게시글 수
			rs = pstmt.executeQuery();

			bookList = new ArrayList<BookBean>();

			while (rs.next()) {
				// 조회된 결과 중 1개 레코드를 MemberBean 객체에 저장 후 ArrayList 에 추가
				BookBean book = new BookBean();
				book.setBook_num(rs.getInt("book_num"));

				book.setMember_id(rs.getString("member_id"));
				book.setBook_date(rs.getDate("book_date"));
				book.setPickup_date(rs.getDate("pickup_date"));
				book.setEnd_date(rs.getDate("end_date"));
				book.setCar_id(rs.getString("car_id"));
				book.setBook_price(rs.getInt("book_price"));
				book.setBook_state(rs.getInt("book_state"));

				bookList.add(book);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("MemberDAO - selectMemberList() 오류!");
		} finally {
			close(rs);
			close(pstmt);
		}

		return bookList;
	}

	public int selectBookListsum(String str1, String str2) {
		int result=0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT SUM(book_price) FROM book where book_date between ? and ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, str1); //시작레코드번호 
			pstmt.setString(2, str2); //게시글 수
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				result=rs.getInt("SUM(book_price)");
			}
	
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("MemberDAO - selectMemberList() 오류!");
		} finally {
			close(rs);
			close(pstmt);
		}

		return result;
	}
	
	
	public int selectBookListcount(String str1, String str2) {
		int result=0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT COUNT(book_price) FROM book where book_date between ? and ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, str1); //시작레코드번호 
			pstmt.setString(2, str2); //게시글 수
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				result=rs.getInt("COUNT(book_price)");
			}
	
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("MemberDAO - selectMemberList() 오류!");
		} finally {
			close(rs);
			close(pstmt);
		}

		return result;
	}
	
	
	
	public int selectBookListp1(String str1, String str2) {
		int result=0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			
			String sql = "SELECT ((SUM(book_price)-(SELECT SUM(book_price) FROM book where (book_date > ? -INTERVAL 1 MONTH and book_date < ? )))/(SELECT SUM(book_price) FROM book where (book_date > ? -INTERVAL 1 MONTH and book_date < ? )))*100 as score FROM book where booK_date between ? and ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, str1);  
			pstmt.setString(2, str1);
			pstmt.setString(3, str1);  
			pstmt.setString(4, str1);
			pstmt.setString(5, str1);
			pstmt.setString(6, str2);
			rs = pstmt.executeQuery();
			

			while (rs.next()) {
				result=rs.getInt("score");
				
			}
			
			
		

			
			
		


	
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("MemberDAO - selectMemberList() 오류!");
		} finally {
			close(rs);
			close(pstmt);
		}

		return result;
	}
	
	
	public int selectBookListp2(String str1, String str2) {
		int result=0;


		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			
			String sql = "SELECT ((count(book_price)-(SELECT count(book_price) FROM book where (book_date > ? -INTERVAL 1 MONTH and book_date < ? )))/(SELECT count(book_price) FROM book where (book_date > ? -INTERVAL 1 MONTH and book_date < ? )))*100 as score FROM book where booK_date between ? and ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, str1);  
			pstmt.setString(2, str1);
			pstmt.setString(3, str1);  
			pstmt.setString(4, str1);
			pstmt.setString(5, str1);
			pstmt.setString(6, str2);
			rs = pstmt.executeQuery();
			

			while (rs.next()) {
				result=rs.getInt("score");
			}
			
		
			
			

			
			
		


	
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("MemberDAO - selectMemberList() 오류!");
		} finally {
			close(rs);
			close(pstmt);
		}

		return result;
	}
	
	
	public int selectBookListf(String str1, String str2) {
		int result=0;


		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			
			String sql = "select count(*) as nullcount from book where book_state is null and booK_date between ? and ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, str1); //시작레코드번호 
			pstmt.setString(2, str2); //게시글 수
			rs = pstmt.executeQuery();
			

			while (rs.next()) {
				result=rs.getInt("nullcount");
			}
			
		

			
			
		


	
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("MemberDAO - selectMemberList() 오류!");
		} finally {
			close(rs);
			close(pstmt);
		}

		return result;
	}
	
	
	
	public int selectBookListfs(String str1, String str2) {
		int result=0;


		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			
			String sql = "select sum(book_price) from book where book_state is null and booK_date between ? and ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, str1); //시작레코드번호 
			pstmt.setString(2, str2); //게시글 수
			rs = pstmt.executeQuery();
			

			while (rs.next()) {
				result=rs.getInt("sum(book_price)");
			}
			
			

			
			
		


	
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("MemberDAO - selectMemberList() 오류!");
		} finally {
			close(rs);
			close(pstmt);
		}

		return result;
	}
	
	public int selectBookListfs2(String str1, String str2) {
		int result=0;


		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			
			String sql = "select sum(book_price) from book where book_state is null and booK_date between ? and ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, str1); //시작레코드번호 
			pstmt.setString(2, str2); //게시글 수
			rs = pstmt.executeQuery();
			

			while (rs.next()) {
				result=rs.getInt("sum(book_price)");
			}
			
			

			
			
		


	
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("MemberDAO - selectMemberList() 오류!");
		} finally {
			close(rs);
			close(pstmt);
		}

		return result;
	}
}

package book.action;

import java.io.PrintWriter;

import java.text.SimpleDateFormat;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.svc.BookProService;
import book.vo.ActionForward;
import book.vo.BookBean;

public class BookProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {


		ActionForward forward = null;

		ServletContext context = request.getServletContext();

		BookBean bb = new BookBean();

//		date 타입 -> String 변환
//		String oldstring = "2011-01-18 00:00:00.0";
//		Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(oldstring);

		Date date = new Date(new SimpleDateFormat("yyyyMMdd").parse(request.getParameter("book_date")).getTime());
		Date date1 = new Date(new SimpleDateFormat("yyyyMMdd").parse(request.getParameter("pickup_date")).getTime());
		Date date2 = new Date(new SimpleDateFormat("yyyyMMdd").parse(request.getParameter("end_date")).getTime());

//		Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("pickup_date"));
//		Date date2 = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("end_date"));

//		date = new java.sql.Date(date)
		
		Timestamp date4=new Timestamp(System.currentTimeMillis());

		
		bb.setBook_date2(date4);	
		
		
		bb.setBook_date(date);
		bb.setPickup_date(date1);
		bb.setEnd_date(date2);

//		Java.sql.Date date = new Java.sql.Date(pickedDate.getDate().getTime

//		System.out.println(request.getParameter("book_date"));
//		System.out.println(request.getParameter("pickup_date"));
//		System.out.println(request.getParameter("end_date"));

		BookProService bps = new BookProService();

		boolean isWriteSuccess = bps.registBook(bb);

		if (!isWriteSuccess) { // 요청 실패했을 경우
			// 자바스크립트를 사용하여 오류 메세지 출력 후 이전 페이지로 이동
			// PrintWriter 객체를 사용하여 자바스크립트 코드를 출력
			// response 객체를 사용하여 문서 타입 설정 및 PrintWriter 객체 가져오기
			response.setContentType("text/html;charset=UTF-8"); // 문서 타입 설정
			PrintWriter out = response.getWriter(); // PrintWriter 객체 가져오기
			// println() 메서드를 사용하여 자바스크립트를 문자열로 출력
			out.println("<script>"); // 자바스크립트 시작
			out.println("alert('잠시후 다시 시도해 주세요')"); // 오류 메세지 출력
			out.println("history.back()"); // 이전 페이지로 이동
			out.println("</script>"); // 자바스크립트 끝
		} else { // 요청 성공했을 경우
			// ActionForward 객체를 생성하여 포워딩 방식 및 URL 지정
			forward = new ActionForward();
			// BoardList.bo 서블릿 주소를 새로 요청하고, request 객체 유지할 필요가 없음
			// => Redirect 방식으로 포워딩 처리
			forward.setRedirect(true); // Redirect 방식 지정
			forward.setPath("bookList.bk"); // 포워딩 할 URL 지정
		}

		// TODO Auto-generated method stub
		return forward;
	}

}

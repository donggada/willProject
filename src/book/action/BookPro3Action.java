package book.action;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.vo.ActionForward;
import book.vo.BookBean;

public class BookPro3Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;

		BookBean bb = new BookBean();
		Date date1 = new Date(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("pickup")).getTime());
		Date date2 = new Date(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("end")).getTime());

		long rentday = (date2.getTime() - date1.getTime()) / (24 * 60 * 60 * 1000);
		
		String id = request.getParameter("member_id");
//		String snsid = request.getParameter("snsid");
		
		bb.setMember_id(id);
		bb.setPickup_date(date1);
		bb.setEnd_date(date2);
		bb.setCar_id(request.getParameter("car_id"));
		bb.setBook_state(1);
		bb.setBook_price((int) rentday * Integer.parseInt(request.getParameter("rentprice")));
		
		request.setAttribute("bookList", bb);
		forward = new ActionForward();
		forward.setPath("payCheck/payment_vbank.jsp"); //무통장입금 페이지로 이동
		
		return forward;
	}

}

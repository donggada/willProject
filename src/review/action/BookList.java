package review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.vo.ActionForward;

public class BookList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//예약이력을 출력하는 bookSearch.jsp로 이동하는 ActionForward
		
		ActionForward forward = null;
		String member_id = request.getParameter("member_id");
		
		forward = new ActionForward();
		forward.setPath("bookSearch.jsp?member_id"+member_id);
		
		return forward;
	}

}

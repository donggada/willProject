package review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.svc.ReviewDetailService;
import review.vo.ActionForward;
import review.vo.ReviewBean;

public class ReviewDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//리뷰상세보기 ActionForward
		
		ActionForward forward = null;
		
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		String page = request.getParameter("page");
		
		ReviewDetailService reviewDetailService = new ReviewDetailService();
		ReviewBean article = reviewDetailService.getArticle(review_num);
		
		request.setAttribute("article", article);
		request.setAttribute("page", page);

		forward = new ActionForward();
		forward.setPath("/review/reviewDetail.jsp");
		return forward;
	}

}

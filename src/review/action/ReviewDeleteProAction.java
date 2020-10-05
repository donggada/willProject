package review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.svc.ReviewDeleteProService;
import review.vo.ActionForward;

public class ReviewDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//리뷰 삭제 ActionForward
		
		ActionForward forward = null;
		
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		String review_pass = request.getParameter("review_pass");
		String page = request.getParameter("page");
		
		ReviewDeleteProService reviewDeleteProService = new ReviewDeleteProService();
		boolean isArticleWriter = reviewDeleteProService.isArticleWriter(review_num,review_pass);
		
		if(!isArticleWriter) {
			System.out.println("작성자 아님");
		} else {
			boolean isDeleteSuccess = reviewDeleteProService.removeArticle(review_num);
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("ReviewList.ad?&page="+page);
		}
		
		return forward;
	}

}

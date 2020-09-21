package review.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import review.svc.ReviewModifyProService;
import review.vo.ActionForward;
import review.vo.ReviewBean;

public class ReviewModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//리뷰 수정 ActionForward
		ActionForward forward = null;
		
		boolean isModifySuccess = false;
		
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		String page = request.getParameter("page");
		
		String realFolder = "";
		String saveFolder = "/reviewUpload";
		int fileSize = 1024*1024*10;
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);
		MultipartRequest multi = new MultipartRequest(request,realFolder,fileSize,"UTF-8",new DefaultFileRenamePolicy());
		String review_pass = multi.getParameter("review_pass");
		
		ReviewModifyProService reviewModifyProService = new ReviewModifyProService();
		
		boolean isArticleWriter = reviewModifyProService.isArticleWriter(review_num, review_pass);
		
		if(!isArticleWriter) {
			System.out.println("작성자 아님");
		}else {
			ReviewBean article = new ReviewBean();
			article.setReview_num(review_num);
			article.setReview_subject(multi.getParameter("review_subject"));
			article.setReview_content(multi.getParameter("review_content"));
			article.setReview_file(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
			isModifySuccess = reviewModifyProService.modifyArticle(article);
			
			if(!isModifySuccess) {
				System.out.println("글수정 실패");
			}else {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("ReviewDetail.rw?review_num="+review_num+"&page="+page);
			}
		}
		return forward;
	}

}

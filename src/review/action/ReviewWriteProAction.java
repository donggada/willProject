package review.action;

import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import review.svc.ReviewWriteProService;
import review.vo.ActionForward;
import review.vo.ReviewBean;

public class ReviewWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//리뷰 작성 ActionForward
		ActionForward forward = null;
		String realFolder = "";
		String saveFolder = "/reviewUpload";
		int fileSize = 5*1024*1024;
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);
		
		MultipartRequest multi = new MultipartRequest(request, realFolder,fileSize, "UTF-8", new DefaultFileRenamePolicy());
		ReviewBean reviewBean = new ReviewBean();
		reviewBean.setBook_num(Integer.parseInt(multi.getParameter("book_num")));	
		reviewBean.setMember_id(multi.getParameter("member_id"));
		reviewBean.setCar_id(multi.getParameter("car_id"));
		reviewBean.setPickup_date(multi.getParameter("pickup_date"));
		reviewBean.setEnd_date(multi.getParameter("end_date"));
		reviewBean.setReview_subject(multi.getParameter("review_subject"));
		reviewBean.setReview_content(multi.getParameter("review_content"));
		reviewBean.setReview_file(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		reviewBean.setReview_pass(multi.getParameter("review_pass"));
		
		ReviewWriteProService reviewWriteProService = new ReviewWriteProService();
		boolean isWriteSuccess = reviewWriteProService.registReview(reviewBean);
		
		if(!isWriteSuccess) {
			System.out.println("등록안됨");
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("ReviewList.rw");
		}
		
		return forward;
	}

}

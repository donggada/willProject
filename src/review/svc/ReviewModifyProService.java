package review.svc;

import static review.db.jdbcUtil.*;

import java.sql.Connection;

import review.dao.ReviewDAO;
import review.vo.ReviewBean;

public class ReviewModifyProService {
	
	//작성자 확인 isArticleWriter(review_num,review_pass)
	public boolean isArticleWriter(int review_num, String review_pass) {
		boolean isArticleWriter = false;
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		
		isArticleWriter = reviewDAO.isArticleReviewWriter(review_num, review_pass);
		close(con);
		
		return isArticleWriter;
	}
	//리뷰글 수정 modifyArticle(article)
	public boolean modifyArticle(ReviewBean article) {
		boolean isModifySuccess = false;
		
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		
		int updateCount = reviewDAO.updateArticle(article);
		if(updateCount>0) {
			commit(con);
			isModifySuccess = true;
		}else {
			rollback(con);
		}
		close(con);
		
		return isModifySuccess;
	}

}

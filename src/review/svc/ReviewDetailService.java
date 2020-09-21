package review.svc;

import static review.db.jdbcUtil.*;

import java.sql.Connection;

import review.dao.ReviewDAO;
import review.vo.ReviewBean;

public class ReviewDetailService {
	
	//리뷰글 상세 조회 getArticle(review_num)
	public ReviewBean getArticle(int review_num) {
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		ReviewBean article = reviewDAO.selectArticle(review_num);
		
		if(article != null) {
			int updateCount = reviewDAO.updateReadCount(review_num);
			
			if(updateCount>0) {
				commit(con);
			}else {
				rollback(con);
			}
		}
		close(con);
		
		return article;
	}

}

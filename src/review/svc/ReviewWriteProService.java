package review.svc;

import static review.db.jdbcUtil.*;
import java.sql.Connection;

import review.dao.ReviewDAO;
import review.vo.ReviewBean;

public class ReviewWriteProService {
	//리뷰글 작성 registReview(reviewBean)
	public boolean registReview(ReviewBean reviewBean) {
		
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		
		int insertCount = reviewDAO.insertReview(reviewBean);
		
		if(insertCount>0) {
			commit(con);
			isWriteSuccess = true;
		}else {
			rollback(con);
		}
		close(con);
		
		return isWriteSuccess;
	}

	

}

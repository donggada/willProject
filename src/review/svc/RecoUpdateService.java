package review.svc;

import static review.db.jdbcUtil.*;

import java.sql.Connection;
import review.dao.ReviewDAO;

public class RecoUpdateService {
	// 추천수 조회하는 selectRecoCount(review_num)
	public int selectRecoCount(int review_num) {
		int recoCount = 0;
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		int recoSuccess = reviewDAO.updateRecoCount(review_num); //추천수 올리는 updateRecoCount(review_num)
		
		if(recoSuccess>0) {
			commit(con);
			recoCount = reviewDAO.selectRecoCount(review_num);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return recoCount;
	}

}

package review.svc;

import static review.db.jdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import review.dao.ReviewDAO;
import review.vo.ReviewBean;

public class ReviewListService {
	
	//전체 리뷰글 수 조회 getList()
	public int getListCount() {
		
		int listCount = 0;
		
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		
		listCount = reviewDAO.selectListCount();
		close(con);
		
		return listCount;
	}
	
	//전체 리뷰글 목록 조회 getArticleList(page,limit)
	public ArrayList<ReviewBean> getArticleList(int page, int limit) {
		ArrayList<ReviewBean> articleList = null;
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		
		articleList = reviewDAO.selectArticleList(page,limit);
		
		close(con);
		
		return articleList;
	}

}

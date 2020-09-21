package faq.svc;

import static faq.db.jdbcutil.*;

import java.sql.Connection;

import faq.dao.faqBoardDAO;
import faq.vo.faqBoardbean;



public class faqBoardDeleteService {

	
	public int delete(faqBoardbean qnaboardbean) {
		int check = 0;
		
		Connection con=getconnection();
		faqBoardDAO boarddao=faqBoardDAO.getinstance();
		boarddao.setCon(con);
		
		
		int updatedelete=boarddao.delete(qnaboardbean.getFaqboard_num());
		commit(con);
		
		
		
		
		
		close(con);
		return check;
		

		
	}


	
}

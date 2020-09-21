package faq.svc;

import static faq.db.jdbcutil.*;

import java.sql.Connection;

import faq.dao.faqBoardDAO;
import faq.vo.faqBoardbean;

public class faqBoardDetailService {

	
	
	public faqBoardbean detail(int faqboardnum) {
		System.out.println(faqboardnum);

		faqBoardbean getcontent2=null;
		
		Connection con=getconnection();
		faqBoardDAO boarddao=faqBoardDAO.getinstance();
		boarddao.setCon(con);
		
		getcontent2=boarddao.getcontent(faqboardnum);
		commit(con);
			
		
		
		
		
		
		close(con);
		return getcontent2;
	}
	
	
}

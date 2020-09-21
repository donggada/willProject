package faq.svc;

import static faq.db.jdbcutil.*;

import java.sql.Connection;
import java.util.ArrayList;

import faq.dao.faqBoardDAO;
import faq.vo.faqBoardbean;




public class contentService {

	
	
	
	public ArrayList<faqBoardbean> getarticlelist(int num) {
		ArrayList<faqBoardbean> articlelist=null;
		
		Connection con=getconnection();
		faqBoardDAO faqBoard=faqBoardDAO.getinstance();
		faqBoard.setCon(con);
		
		
		articlelist=faqBoard.selectcontent(num);
		
		
		
		close(con);
		return articlelist;
		
	}
	
	
	
}

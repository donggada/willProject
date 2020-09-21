package faq.svc;

import static faq.db.jdbcutil.*;

import java.sql.Connection;
import java.util.ArrayList;

import faq.dao.faqBoardDAO;
import faq.vo.faqBoardbean;




public class faqBoardSearchService {

	
	public int getlistcount(String search) {
		int listcount = 0;
		
		Connection con=getconnection();
		faqBoardDAO faqBoard=faqBoardDAO.getinstance();
		faqBoard.setCon(con);
		listcount=faqBoard.searchselectlist(search);


		close(con);
		return listcount;
		

		
	}

	
	
	
	public ArrayList<faqBoardbean> getarticlelist(int page, int limit, String search) {
		ArrayList<faqBoardbean> articlelist=null;
		
		Connection con=getconnection();
		faqBoardDAO faqBoard=faqBoardDAO.getinstance();
		faqBoard.setCon(con);
		
		
		articlelist=faqBoard.searchselectlist(page,limit,search);
		
		
		
		close(con);
		return articlelist;
		
	}
	
	
	
}

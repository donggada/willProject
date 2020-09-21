package faq.svc;

import static faq.db.jdbcutil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import faq.dao.faqBoardDAO;
import faq.vo.faqBoardbean;


public class faqBoardModifyService {

	//글수정 작업요청 
	public boolean regisartiset(faqBoardbean faqboardbean) {
	boolean ismodifySuccess = false;
	

	Connection con = getconnection();
	

	faqBoardDAO board=faqBoardDAO.getinstance();
	
	board.setCon(con);
	board.modifyArticle(faqboardbean);
	commit(con);
	ismodifySuccess=true;
		
	

	close(con); 

	return ismodifySuccess;
	
	

		
		
		
		
		
	}
	
	
	
	
}

package qna.svc;


import static qna.db.jdbcutil.*;

import java.sql.Connection;

import qna.dao.qnaBoardDAO;
import qna.vo.qnaBoardbean;


public class qnaBoardReplyProService {

	
	public boolean regisartiset(qnaBoardbean boardbean) {

		
		boolean ismodifySuccess = false;
		Connection con = getconnection();
		qnaBoardDAO board=qnaBoardDAO.getinstance();
		board.setCon(con);

		int replycount = board.reply(boardbean);

		if(replycount>0) {
			
			commit(con); 
			ismodifySuccess=true;
			System.out.println(replycount);
			
		}else {

			System.out.println("답글 실패");
			rollback(con);
			
		}
		
		close(con); 
		return ismodifySuccess;
		
		

			
			
			
			
	}		
	
	
}

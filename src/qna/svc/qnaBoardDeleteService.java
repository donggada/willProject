package qna.svc;

import static qna.db.jdbcutil.*;

import java.sql.Connection;

import qna.dao.qnaBoardDAO;
import qna.vo.qnaBoardbean;


public class qnaBoardDeleteService {

	
	public int delete(qnaBoardbean qnaboardbean) {
		int check = 0;
		
		Connection con=getconnection();
		qnaBoardDAO boarddao=qnaBoardDAO.getinstance();
		boarddao.setCon(con);
		
		
		check=boarddao.check(qnaboardbean);
		
		if(check>0) {
			int updatedelete=boarddao.delete(qnaboardbean.getQnaBoard_num());
				commit(con);
			}else {
				rollback(con);
			}
		
		
		
		
		
		close(con);
		return check;
		

		
	}

	public int delete2(qnaBoardbean qnaboardbean) {
		int check = 0;
		
		Connection con=getconnection();
		qnaBoardDAO boarddao=qnaBoardDAO.getinstance();
		boarddao.setCon(con);
		
		
		check=boarddao.delete(qnaboardbean.getQnaBoard_num());
		commit(con);
	
		
		close(con);
		return check;
		
	}
	
}

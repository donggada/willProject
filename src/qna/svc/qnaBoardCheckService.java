package qna.svc;

import static qna.db.jdbcutil.close;
import static qna.db.jdbcutil.commit;
import static qna.db.jdbcutil.getconnection;
import static qna.db.jdbcutil.rollback;

import java.sql.Connection;

import qna.dao.qnaBoardDAO;
import qna.vo.qnaBoardbean;

public class qnaBoardCheckService {

public int check(qnaBoardbean article) {
		
		int result;
		
		Connection con=getconnection();
		qnaBoardDAO boarddao=qnaBoardDAO.getinstance();
		boarddao.setCon(con);
		
		result=boarddao.check(article);
		
	
		
		close(con);
		return result;
	}
	
	
}

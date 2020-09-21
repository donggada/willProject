package qna.svc;

import static qna.db.jdbcutil.*;

import java.sql.Connection;

import qna.dao.qnaBoardDAO;
import qna.vo.qnaBoardbean;

public class qnaBoardDetailService {

	
	
	public qnaBoardbean detail(int qnaboardnum) {
		System.out.println(qnaboardnum);

		qnaBoardbean getcontent2=null;
		
		Connection con=getconnection();
		qnaBoardDAO boarddao=qnaBoardDAO.getinstance();
		boarddao.setCon(con);
		
		getcontent2=boarddao.getcontent(qnaboardnum);
		
		
		if(getcontent2!=null) {
			int updatecount=boarddao.updatereadcount(qnaboardnum);
			if(updatecount>0) {
				commit(con);
			}else {
				rollback(con);
			}
		}
		
		
		close(con);
		return getcontent2;
	}
	
	
}

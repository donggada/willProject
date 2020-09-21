package admin.svc;

import static qna.db.jdbcutil.close;
import static qna.db.jdbcutil.getconnection;

import java.sql.Connection;
import java.util.ArrayList;

import admin.dao.AdminDAO;
import qna.dao.qnaBoardDAO;
import qna.vo.qnaBoardbean;

public class QnaAdminBoardService {

	public ArrayList<qnaBoardbean> QnaAdminBoardList(int page,int limit) {	
		System.out.println("QnaAdminBoardService");
		ArrayList<qnaBoardbean> articlelist=null;
		
		Connection con=getconnection();
		
		AdminDAO adao= AdminDAO.adao;
		
		adao.setConnection(con);
		
		
		articlelist=adao.selectAdminBoardList(page,limit);
				
		
	    close(con);
		
	    return articlelist;
	}

}

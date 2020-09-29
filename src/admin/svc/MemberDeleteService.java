package admin.svc;

import static member.db.JdbcUtill.*;

import java.sql.Connection;

import admin.dao.AdminDAO;
import member.dao.MemberDAO;




public class MemberDeleteService {

	
	public boolean delete(int taget,String table) {
		boolean isdelete=false;
		
		Connection con=getConnection();
		
		AdminDAO boarddao=AdminDAO.getMdao();
		boarddao.setConnection(con);
		
		
		isdelete=boarddao.mmdelete(taget,table);
		commit(con);
		
		
		
		
		
		close(con);
		return isdelete;
		

		
	}


	
}

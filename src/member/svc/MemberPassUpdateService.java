package member.svc;

import static member.db.JdbcUtill.*;

import java.sql.Connection;

import member.dao.MemberDAO;

public class MemberPassUpdateService {

	public boolean passupdate(String pass,String name,String license,String id) {
		boolean ispassudate= false;
		int passupdatecount=0;
		
		Connection con=getConnection();
		
		MemberDAO mdao=MemberDAO.getMdao();
		
		mdao.setConnection(con);
		
		passupdatecount=mdao.passupdate(pass,name,license,id);
		
		if(passupdatecount>0) {
			commit(con);
			ispassudate=true;
		}else {
			rollback(con);
		}
		
		close(con);
		
		
		
		return ispassudate;
	}



}

package member.svc;

import java.sql.Connection;

import member.dao.MemberDAO;

import static member.db.JdbcUtill.*;

public class MemberLoginProService {

	public int MemberLogin(String id,String pass) {
		System.out.println("MemberLoginProService");
		int isLogsuccess=0;
		
		Connection con=getConnection();
		
		MemberDAO mdao=MemberDAO.getMdao();
		
		mdao.setConnection(con);
		
		isLogsuccess = mdao.MemberLogin(id,pass);
		
		close(con);
		
		return isLogsuccess;
	}

}

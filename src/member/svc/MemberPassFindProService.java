package member.svc;

import java.sql.Connection;

import member.dao.MemberDAO;

import static member.db.JdbcUtill.*;

public class MemberPassFindProService {

	public boolean MemberPassUpdate(String name, String license, String id) {
		System.out.println("MemberPassFindProService");
		boolean isFindPass=false;
		
		Connection con=getConnection();
		
		MemberDAO mdao=MemberDAO.getMdao();
		
		mdao.setConnection(con);
		
		isFindPass=mdao.findpass(name,license,id);
		System.out.println(isFindPass);
		
		if(isFindPass) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return isFindPass;
	}



}

package member.svc;

import java.sql.Connection;

import member.dao.MemberDAO;

import static member.db.JdbcUtill.*;

public class MemberSnsLoginProService {

	public boolean snsLogin(String id) {
		System.out.println("MemberSnsLoginProService");
		boolean isSnsLogsuccess=false;
		int SnsLogincount=0;
		
		Connection con =getConnection();
		
		MemberDAO mdao=MemberDAO.getMdao();
		
		mdao.setConnection(con);
		
		SnsLogincount=mdao.snsLogin(id);
		
		if(SnsLogincount==1 || SnsLogincount==-1) {
			isSnsLogsuccess=true;
			commit(con);
		}else {
			isSnsLogsuccess=false;
			rollback(con);
		}
		
		close(con);
		System.out.println(isSnsLogsuccess);
		return isSnsLogsuccess;
	}

}

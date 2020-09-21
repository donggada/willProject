package member.svc;
import static member.db.JdbcUtill.*;

import java.sql.Connection;

import member.dao.MemberDAO;

public class MemberIDFindProService {

	public boolean MemberIDFind(String name, String license) {
		System.out.println("MemberIDFindProService");
		boolean isIDFind=false;
		
		Connection con=getConnection();
		
		MemberDAO mdao=MemberDAO.getMdao();
		
		mdao.setConnection(con);
		
		isIDFind=mdao.findid(name,license);
		
		if(isIDFind) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		
		return isIDFind;
	}

	public String lookid(String name,String license) {
		String findid="";
		
		Connection con=getConnection();
		
		MemberDAO mdao=MemberDAO.getMdao();
		
		mdao.setConnection(con);
		
		findid=mdao.lookid(name,license);
		
		if(findid.equals("")) {
			rollback(con);
		}else {
			commit(con);
		}
		
		close(con);
		
		return findid;
	}

}

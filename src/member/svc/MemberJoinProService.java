package member.svc;

import java.sql.Connection;

import member.dao.MemberDAO;
import member.vo.MemberBean;
import static member.db.JdbcUtill.*;

public class MemberJoinProService {

	public boolean joinMemer(MemberBean bb) {
		System.out.println("MemberJoinProService");
		boolean insertsuccess=false;
		int insertcount=0;
		
		Connection con=getConnection();
		
		MemberDAO mdao=MemberDAO.mdao;
		
		mdao.setConnection(con);
		
		insertcount=mdao.insertMember(bb);
		
		
		if(insertcount>0) {
			insertsuccess=true;
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return insertsuccess;
	}

	public int dupCheckMember(String id) {
		int dupcheck =0;
		
		Connection con=getConnection();
		
		MemberDAO mdao=MemberDAO.mdao;
		
		mdao.setConnection(con);
		
		dupcheck=mdao.dupcheck(id);
		
		close(con);
		
		return dupcheck;
	}



}

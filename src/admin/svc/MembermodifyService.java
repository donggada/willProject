package admin.svc;

import static member.db.JdbcUtill.*;


import java.sql.Connection;
import java.util.ArrayList;

import admin.dao.AdminDAO;
import member.vo.MemberBean;

public class MembermodifyService {


	public ArrayList<MemberBean> getArticleListM(String taget) {
		ArrayList<MemberBean> memberList = null;
		
		
		Connection con = getConnection();
		
		AdminDAO adao = AdminDAO.adao;
		
		
		adao.setConnection(con);
		
		
		memberList = adao.selectMemberListM(taget);
		
		
		close(con);
		
		return memberList;
		
	}
	
	public int getListCount(String taget,String table) {
		System.out.println("MemberListService - getListCount()");
		int listCount = 0;
		
		
		Connection con = getConnection();
		
		
		AdminDAO adao = AdminDAO.adao;
		
		
		adao.setConnection(con);
		
	
		listCount = adao.selectListCount(taget,table);
		
		close(con);
		
		return listCount;	
		
	
	}
	
	
	
	public boolean mmmodify(MemberBean bb) {
		boolean ismodifySuccess = false;
		

		Connection con = getConnection();
		

		AdminDAO board=AdminDAO.getMdao();
		
		board.setConnection(con);
		board.modifyArticle(bb);
		commit(con);
		ismodifySuccess=true;
			
		

		close(con); 

		return ismodifySuccess;
		
		

			
			
			
			
			
		}
	
	
	
	
	
	

}

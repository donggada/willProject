package admin.svc;

import static member.db.JdbcUtill.*;


import java.sql.Connection;
import java.util.ArrayList;

import admin.dao.AdminDAO;
import member.vo.MemberBean;

public class MemberListService {

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

	public ArrayList<MemberBean> getArticleList(int page, int limit) {
		System.out.println("MemberListService - getArticleList()");
		ArrayList<MemberBean> memberList = null;
		
		
		Connection con = getConnection();
		
		AdminDAO adao = AdminDAO.adao;
		
		
		adao.setConnection(con);
		
		
		memberList = adao.selectMemberList(page, limit);
		
		
		close(con);
		
		return memberList;
		
	}
	
	

}

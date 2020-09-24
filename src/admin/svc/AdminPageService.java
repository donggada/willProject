package admin.svc;

import java.sql.Connection;
import java.util.ArrayList;

import admin.dao.AdminDAO;
import book.vo.BookBean;

import static member.db.JdbcUtill.*;


public class AdminPageService {

	public ArrayList<BookBean> statslist() {
		ArrayList<BookBean> Statslist=null;
		
		Connection con=getConnection();
		
		AdminDAO adao=AdminDAO.adao;
		
		adao.setConnection(con);
		
		Statslist=adao.statslist();
		
		close(con);
		
		
		return Statslist;
	}

	public ArrayList<BookBean> Monthlist() {
		ArrayList<BookBean> Monthlist=null;
		
		Connection con=getConnection();
		
		AdminDAO adao=AdminDAO.adao;
		
		adao.setConnection(con);
		
		Monthlist=adao.Monthlist();
		
		close(con);
		
		return Monthlist;
	}

}

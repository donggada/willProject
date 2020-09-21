package admin.svc;

import static member.db.JdbcUtill.close;
import static member.db.JdbcUtill.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import admin.dao.AdminDAO;
import admin.vo.CarBean;

public class GraphProService {

	public ArrayList<CarBean> GraphPro(String target1) {
		System.out.println("GraphProService");
		ArrayList<CarBean> cb=null;
		int page=0,limit=0;

		
		Connection con = getConnection();
		
		AdminDAO adao = AdminDAO.adao;
		
		
		adao.setConnection(con);
		
		
		cb = adao.selectgraph(target1);
		
		
		close(con);
		
		return cb;
	}
	
	public ArrayList<CarBean> GraphPro(String target1,String target2) {
		System.out.println("GraphProService");
		ArrayList<CarBean> cb=null;
		int page=0,limit=0;

		
		Connection con = getConnection();
		
		AdminDAO adao = AdminDAO.adao;
		
		
		adao.setConnection(con);
		
		
		cb = adao.selectgraph(target1,target2);
		
		
		close(con);
		
		return cb;
	}

}

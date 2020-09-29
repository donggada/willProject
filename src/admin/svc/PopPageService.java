package admin.svc;

import org.json.simple.JSONArray;

import admin.dao.AdminDAO;

import static member.db.JdbcUtill.*;

import java.sql.Connection;

public class PopPageService {

	public JSONArray CallPage() {
		JSONArray PoPpage=null;
		
		Connection con =getConnection();
		
		AdminDAO adao=AdminDAO.adao;
		
		adao.setConnection(con);
		
		PoPpage=adao.CallPage();
		
		close(con);
		
		return PoPpage;
	}
	
}

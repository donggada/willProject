package admin.svc;

import org.json.simple.JSONArray;

import admin.dao.AdminDAO;

import static member.db.JdbcUtill.*;

import java.sql.Connection;

public class DetailCarListService {

	public JSONArray DetailCarList(int car_id) {
		JSONArray DetailCarList=null;
		Connection con =getConnection();
		
		AdminDAO adao=AdminDAO.adao;
		
		adao.setConnection(con);
		
		DetailCarList=adao.DetailCarList(car_id);
		
		close(con);
		
		
		return DetailCarList;
	}

}

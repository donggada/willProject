package admin.svc;

import java.sql.Connection;
import java.util.ArrayList;

import admin.dao.AdminDAO;
import admin.vo.CarBean;

import static member.db.JdbcUtill.*;

public class SalesChartService {

	public ArrayList<CarBean> SalesChart() {
		ArrayList<CarBean> SalesList=null;	
		System.out.println("SalesChartService");
		Connection con=getConnection();
		
		AdminDAO adao=AdminDAO.adao;
		
		adao.setConnection(con);
		
		SalesList=adao.SalesChart();
		
		
		close(con);
		
		
		
		return SalesList;
	}

}

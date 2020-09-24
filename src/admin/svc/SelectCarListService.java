package admin.svc;

import java.sql.Connection;
import java.util.ArrayList;

import admin.dao.AdminDAO;
import admin.vo.CarBean;
import member.vo.MemberBean;

import static member.db.JdbcUtill.*;
public class SelectCarListService {

	public ArrayList<CarBean> SelectCarList(String carsearch1, String carsearch2,int page, int limit) {
		ArrayList<CarBean> SelectCarList=null;
		
		Connection con =getConnection();
		
		AdminDAO adao=AdminDAO.adao;
		
		adao.setConnection(con);
		
		
		SelectCarList=adao.selectCarList(carsearch1, carsearch2,page,limit);
		
		close(con);
		
		return SelectCarList ;
	}
	
	public ArrayList<MemberBean> SelectMemberList(String carsearch1, String carsearch2,int page, int limit) {
		ArrayList<MemberBean> SelectCarList=null;
		
		Connection con =getConnection();
		
		AdminDAO adao=AdminDAO.adao;
		
		adao.setConnection(con);
		
		
		SelectCarList=adao.selectMemberList(carsearch1, carsearch2, page, limit);
		
		close(con);
		
		return SelectCarList ;
	}

}

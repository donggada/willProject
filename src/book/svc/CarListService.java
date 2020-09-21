package book.svc;

import static book.db.JdbcUtil.close;
import static book.db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import book.dao.CarDAO;
import book.vo.CarBean;

public class CarListService {

	public ArrayList<CarBean> getCarList() {

		
		Connection con = getConnection();

		CarDAO carDAO = CarDAO.getInstance();

		carDAO.setConnection(con);
		
		ArrayList<CarBean> carList = carDAO.getCarListBean();

		close(con);
		
		return carList;
	}
}

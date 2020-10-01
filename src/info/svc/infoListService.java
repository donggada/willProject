package info.svc;

import info.vo.ListBean;
import static info.db.jdbcutil.*;

import java.sql.Connection;
import java.util.ArrayList;

import info.dao.mypageDAO;

public class infoListService {

	public ListBean checkList(String id) {
		
		ListBean lb = new ListBean();
		mypageDAO dao = mypageDAO.getinstance();
		Connection con = getconnection();
		dao.setCon(con);
		
		lb = dao.checkMember(id);
		close(con);

		return lb;
	}

	public ArrayList<ListBean> getBookList(String id) {
		
		ArrayList<ListBean> list = new ArrayList<ListBean>();
		mypageDAO dao = mypageDAO.getinstance();
		Connection con = getconnection();
		dao.setCon(con);
		list = dao.checkBook(id);
		close(con);
		return list;
	}
	
}

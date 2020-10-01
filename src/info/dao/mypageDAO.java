package info.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import static info.db.jdbcutil.*;
import info.vo.ListBean;
import qna.dao.qnaBoardDAO;

public class mypageDAO {


private static mypageDAO instance;
	
	private mypageDAO() {}
	
	public static final mypageDAO getinstance() 
	{
		if(instance==null) 
		{
			instance=new mypageDAO();
		}
		
		return instance;
	}
	
//--------------------------------------------------------------------------------------------------
	
	Connection con;
	
	public void setCon(Connection con) 
	{
		this.con = con;
	}
	
//	------------------------------------------------------------------------------------------------
	
	public ListBean checkMember(String id) 
	{
		ListBean lb = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try 
		{
			String sql = "select * from member where member_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				lb = new ListBean();
				lb.setId(rs.getString(2));
				lb.setName(rs.getString(4));
				lb.setAge(rs.getString(5));
				lb.setGender(rs.getString(6));
				lb.setTel(rs.getString(7));
				lb.setAddress(rs.getString(8));
				lb.setEmail(rs.getString(9));
				lb.setLicense(rs.getString(10));
				lb.setSmoke(rs.getString(11));
				lb.setPet(rs.getString(12));
				lb.setBaby(rs.getString(13));
				lb.setGrade(rs.getString(14));
			}
			else
			{
				lb = null;
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		close(pstmt);
		close(rs);
		return lb;
	}

	public ArrayList<ListBean> checkBook(String id) {
		
		ArrayList<ListBean> list = new ArrayList<ListBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try 
		{
			String sql = "select * from book where member_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				ListBean lb = new ListBean();
				lb.setBook_date(rs.getString(4));
				lb.setPickup_date(rs.getString(5));
				lb.setEnd_date(rs.getString(6));
				lb.setCar_id(rs.getInt(7));
				lb.setPrice(rs.getInt(8));
				list.add(lb);
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		close(pstmt);
		close(rs);
		return list;
	}
	
}



















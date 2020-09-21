package admin.dao;

import static member.db.JdbcUtill.*;
import static qna.db.jdbcutil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import admin.vo.CarBean;
import member.dao.MemberDAO;
import member.vo.MemberBean;
import qna.vo.qnaBoardbean;

public class AdminDAO {

	public static AdminDAO getMdao() {
		return adao;
	}

private AdminDAO() {
	
}

public static AdminDAO adao=new AdminDAO();

Connection con;
public void setConnection(Connection con) {
	this.con = con;
}

public int selectListCount(String taget, String table) {
	int listCount = 0;
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		String sql = "SELECT COUNT(?) FROM "+table;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, taget);;
		rs = pstmt.executeQuery();
	
		
	
		if(rs.next()) {
			listCount = rs.getInt(1);
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
		System.out.println("AdminDAO - selectListCount() 에러!"+e);
	} finally {
		
		close(rs); 
		close(pstmt); 
	}
	
	return listCount;
	
}

public ArrayList<MemberBean> selectMemberList(int page, int limit) {
	ArrayList<MemberBean> MemberList = null;
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		
		int startRow = (page - 1) * 10;
		
		String sql = "SELECT * FROM member LIMIT ?,?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, startRow); // 시작 레코드 번호 전달
		pstmt.setInt(2, limit); // 게시물 수 전달
		rs = pstmt.executeQuery();
		
		MemberList = new ArrayList<MemberBean>();
		
		while(rs.next()) {
			MemberBean bb = new MemberBean();
			bb.setIdx(rs.getInt("idx"));
			bb.setMember_name(rs.getString("member_name"));
			bb.setMember_id(rs.getString("member_id"));
			bb.setMember_pass(rs.getString("member_pass"));
			bb.setMember_email(rs.getString("member_email"));
			bb.setMember_age(rs.getString("member_age"));
			bb.setMember_gender(rs.getString("member_gender"));
			bb.setMember_tel(rs.getString("member_tel"));
			bb.setMember_adress(rs.getString("member_adress"));
			bb.setMember_license(rs.getString("member_license"));
			bb.setMember_smoke(rs.getString("member_smoke"));
			bb.setMember_pet(rs.getString("member_pet"));
			bb.setMember_boby(rs.getString("member_baby"));
			bb.setMember_grade(rs.getString("member_grade"));
			
			
			MemberList.add(bb);
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
		System.out.println("AdminDAO - selectMemberList() 에러!"+e);
	} finally {
		
		close(rs); 
		close(pstmt);
	}
	
	return MemberList;
	
}

public ArrayList<CarBean> selectCarList(int page, int limit) {
ArrayList<CarBean> CarList = null;
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		
		int startRow = (page - 1) * 10;
		
		String sql = "SELECT * FROM car LIMIT ?,?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, startRow); // 시작 레코드 번호 전달
		pstmt.setInt(2, limit); // 게시물 수 전달
		rs = pstmt.executeQuery();
		
		CarList = new ArrayList<CarBean>();
		
		while(rs.next()) {
			CarBean cb =new CarBean();
			cb.setCar_id(rs.getInt("car_id"));
			cb.setCar_maker(rs.getString("car_maker"));
			cb.setCar_name(rs.getString("car_name"));
			cb.setCar_type(rs.getString("car_type"));
		
	
			
			CarList.add(cb);
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
		System.out.println("AdminDAO - selectCarList() 에러!"+e);
	} finally {
		
		close(rs); 
		close(pstmt);
	}
	
	return CarList;
}	

public ArrayList<CarBean> selectgraph(String target1) {
ArrayList<CarBean> CarList = null;
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		
		String sql = "select "+target1+" as taget,count(car_id) as count from car group by "+target1;
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		CarList = new ArrayList<CarBean>();
		
		while(rs.next()) {
			CarBean cb =new CarBean();
			cb.setCar_id(rs.getInt("count"));
			cb.setCar_maker(rs.getString("taget"));		
	
			
			CarList.add(cb);
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
		System.out.println("AdminDAO - selectCarList() 에러!"+e);
	} finally {
		
		close(rs); 
		close(pstmt);
	}
	
	return CarList;
}

public ArrayList<CarBean> selectgraph(String target1,String target2) {
ArrayList<CarBean> CarList = null;
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		
		String sql = "select "+target1+" as target,count(car_id) as count from car where "+target2+" group by "+target1;
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		CarList = new ArrayList<CarBean>();
		
		while(rs.next()) {
			CarBean cb =new CarBean();
			cb.setCar_id(rs.getInt("count"));
			cb.setCar_maker(rs.getString("target"));		
	
			
			CarList.add(cb);
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
		System.out.println("AdminDAO - selectCarList() 에러!"+e);
	} finally {
		
		close(rs); 
		close(pstmt);
	}
	
	return CarList;
}



public ArrayList<qnaBoardbean> selectAdminBoardList(int page, int limit) {
	ArrayList<qnaBoardbean> list=null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	try {
		int startrow=(page-1)*10;
		
		
		String sql="select *from qnaBoard order by qnaBoard_date desc,qnaBoard_reply desc ,qnaBoard_num asc limit ?, ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, startrow);
		pstmt.setInt(2, limit); 
		rs=pstmt.executeQuery();
		
		
		list = new ArrayList<qnaBoardbean>();
		while(rs.next()) {
			qnaBoardbean article = new qnaBoardbean();
			article.setQnaBoard_num(rs.getInt("qnaboard_num"));
			article.setQnaBoard_id(rs.getString("qnaboard_id"));
			article.setQnaBoard_subject(rs.getString("qnaboard_subject"));
			article.setQnaBoard_content(rs.getString("qnaboard_content"));
			article.setQnaBoard_file(rs.getString("qnaboard_file"));
			article.setQnaBoard_re_ref(rs.getInt("qnaboard_re_ref"));
			article.setQnaBoard_re_lev(rs.getInt("qnaboard_re_lev"));
			article.setQnaBoard_re_seq(rs.getInt("qnaboard_re_seq"));
			article.setQnaBoard_readcount(rs.getInt("qnaboard_readcount"));
			article.setQnaBoard_date(rs.getDate("qnaboard_date"));
			article.setQnaBaord_tag(rs.getString("qnaboard_tag"));
			article.setQnaboard_reply(rs.getString("qnaboard_reply"));

			list.add(article);
		}
		
		
		
	} catch (SQLException e) {
				e.printStackTrace();
		System.out.println("selectAdminBoardList 오류"+e);
	}finally {
		close(rs); 
		close(pstmt);
	}
	
	
	return list;
	
}	



}

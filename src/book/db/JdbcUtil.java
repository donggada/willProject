package book.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class JdbcUtil {
	public static Connection getConnection(){
		Connection con = null;
		
		try {
			//톰캣 컨텍스트 객체(context.xml) 가져오기
			Context initCtx = new InitialContext();
			
			//context.xml내의 <Resource> 태그부분 가져오기
//			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			
			//context.xml 내의 지정된 name 속성항목을 찾아 datasource 객체 반환
//			DataSource ds = (DataSource)envCtx.lookup("jdbc/MySQL");
			
			//통합
			DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/MySQL");
			
			//커넥션 풀로 부터 connection 객체 가져오기
			con = ds.getConnection();
//			con = ds.getConnection("ROOT","1234"); id,pass 미입력시
			
			//DB의 autocommit 기능 해제(작업 성공시 commit(),실패시 rollback()을 수동으로 호출)
			con.setAutoCommit(false);
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public static void close(Connection con)
	{
		if(con != null) try{con.close();}catch (Exception e) {}
	}
	public static void close(PreparedStatement pstmt)
	{
		if(pstmt != null) try{pstmt.close();}catch (Exception e) {}
	}
	public static void close(ResultSet rs)
	{
		if(rs != null) try{rs.close();}catch (Exception e) {}
	}
	
	public static void commit(Connection con)
	{
		try {con.commit();} catch (SQLException e) {}
	}
	public static void rollback(Connection con)
	{
		try {con.rollback();} catch (SQLException e) {}
	}
}













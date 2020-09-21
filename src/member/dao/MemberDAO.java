package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import static member.db.JdbcUtill.*;
import member.vo.MemberBean;
import member.vo.SMTPAuthenticatior;
import javax.mail.Transport;
import javax.mail.Message;
import javax.mail.Address;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.Session;
import javax.mail.Authenticator;
import java.util.Properties;

public class MemberDAO {

	
public static MemberDAO getMdao() {
		return mdao;
	}

private MemberDAO() {
	
}

public static MemberDAO mdao=new MemberDAO();

Connection con;
public void setConnection(Connection con) {
	this.con = con;
}

public int insertMember(MemberBean bb) {
	int insertcount=0;
	PreparedStatement pstmt = null;
	
	
	try {
		String sql = "INSERT INTO member VALUES (null,?,?,?,?,?,?,?,?,?,?,?,?,'Silver')";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, bb.getMember_id());
		pstmt.setString(2, bb.getMember_pass());
		pstmt.setString(3, bb.getMember_name());
		pstmt.setString(4, bb.getMember_age());
		pstmt.setString(5, bb.getMember_gender());
		pstmt.setString(6, bb.getMember_tel());
		pstmt.setString(7, bb.getMember_adress());
		pstmt.setString(8, bb.getMember_email());
		pstmt.setString(9, bb.getMember_license());
		pstmt.setString(10, bb.getMember_smoke());
		pstmt.setString(11, bb.getMember_pet());
		pstmt.setString(12, bb.getMember_boby());
		//pstmt.setString(13,"Silver");
		insertcount=pstmt.executeUpdate();
		
	} catch (SQLException e) {
		System.out.println("insertMember오류"+e);
		e.printStackTrace();
	}finally {
		close(pstmt);
	}
	
	
	return insertcount;
}

public int dupcheck(String id) {
	int dupcheck=0;
	PreparedStatement pstmt = null;
	ResultSet rs=null;
	
	try {
		String sql = "select * from member where member_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()) {
				dupcheck=0;
			
		}else {
				dupcheck=1;
		}
	} catch (SQLException e) {
		System.out.println("dupcheck오류"+e);
		e.printStackTrace();
	}finally {
		close(rs);
		close(pstmt);
	}
	
	return dupcheck;
}

public int MemberLogin(String id, String pass) {
	int isLoginsuccess=0;
	PreparedStatement pstmt = null;
	ResultSet rs=null;
	
	try {
		String sql = "select * from member where member_id=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()) {
				isLoginsuccess=-1;
			if(rs.getString("member_pass").equals(pass)) {
				isLoginsuccess=1;
			}
		}
	} catch (SQLException e) {
		System.out.println("MemberLogin 오류"+e);
		e.printStackTrace();
	}finally {
		close(rs);
		close(pstmt);
	}
	
	return isLoginsuccess;
}

public int snsLogin(String id) {
	int SnsLogincount=0;
	PreparedStatement pstmt = null;
	ResultSet rs=null;	
	try {
		String sql = "select * from member where member_id=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()) {
			SnsLogincount=-1;
		}else {
			sql="INSERT INTO member(idx,member_id,member_grade) VALUES(null,?,'Silver')";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			SnsLogincount=pstmt.executeUpdate();
		}
	} catch (SQLException e) {
		System.out.println("snsLogin오류"+e);
		e.printStackTrace();
	}finally {
		close(rs);
		close(pstmt);
	}
	
	
	return SnsLogincount;
}

public boolean findid(String name, String license) {
	boolean isfindid=false;
	PreparedStatement pstmt = null;
	ResultSet rs=null;		
	try {
		String sql = "select * from member where member_name=? and member_license=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1,name);
		pstmt.setString(2,license);
		rs=pstmt.executeQuery();
		if(rs.next()) {
			isfindid=true;
		}
	} catch (SQLException e) {
		System.out.println("findi오류"+e);
		e.printStackTrace();
	}finally {
		close(rs);
		close(pstmt);
	}
	
	return isfindid;
}

public String lookid(String name, String license) {
	String findid="";
	PreparedStatement pstmt = null;
	ResultSet rs=null;			
	try {
		String sql = "select * from member where member_name=? and member_license=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1,name);
		pstmt.setString(2,license);
		rs=pstmt.executeQuery();
		if(rs.next()){
			findid=rs.getString("Member_id");
		}
		
	} catch (SQLException e) {
		System.out.println("lookid오류"+e);
		e.printStackTrace();
	}finally {
		close(rs);
		close(pstmt);
	}
	
	
	return findid;
	
}

public int passupdate(String pass,String name,String license,String id) {
	int passupdatecount=0;
	PreparedStatement pstmt = null;
		
	try {
		String sql = "update member set member_pass=? where member_name=? and member_license=? and member_id=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1,pass);
		pstmt.setString(2,name);
		pstmt.setString(3,license);
		pstmt.setString(4,id);
		passupdatecount=pstmt.executeUpdate();
		
	} catch (SQLException e) {
		System.out.println("passupdate오류"+e);
		e.printStackTrace();
	}finally {
		close(pstmt);
	}
		
	return passupdatecount;
}

public boolean findpass(String name, String license, String id) {
	boolean isfindpass= false;
	PreparedStatement pstmt = null;
	ResultSet rs=null;	
	
	try {
		String sql = "select * from member where member_name=? and member_license=? and member_id=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1,name);
		pstmt.setString(2,license);
		pstmt.setString(3, id);
		rs=pstmt.executeQuery();
		if(rs.next()) {
			isfindpass=true;
		}
	} catch (SQLException e) {
		System.out.println("findpass오류"+e);
		e.printStackTrace();
	}finally {
		close(rs);
		close(pstmt);
	}
	
	return isfindpass;
}

public String checknum() { // 임시 비밀번호 
	String randomPw = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	StringBuilder checknum = new StringBuilder();
	for (int i = 0; i < 8; i++) {
		int num = (int) (Math.random() * randomPw.length());
		checknum.append(randomPw.charAt(num));
	}
	return checknum.toString();
}

public int sendEmail(String to, String subject, String content){
	String from ="koem0425@naver.com";
	 
	Properties p = new Properties(); // 정보를 담을 객체

	p.put("mail.smtp.host", "smtp.naver.com"); // 네이버 SMTP
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");
	// SMTP 서버에 접속하기 위한 정보들

	try {
		Authenticator auth = new SMTPAuthenticatior();
		Session ses = Session.getInstance(p, auth);

		ses.setDebug(true);

		MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
		msg.setSubject(subject); // 제목

		Address fromAddr = new InternetAddress(from);
		msg.setFrom(fromAddr); // 보내는 사람

		Address toAddr = new InternetAddress(to);
		msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람

		msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩

		Transport.send(msg); // 전송

		return 1;
	} catch (Exception e) {
		System.out.println("sendEmail()에서 오류: " + e);
		return 0;
	}

}

}

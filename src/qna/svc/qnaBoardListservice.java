package qna.svc;

import static qna.db.jdbcutil.*;

import java.sql.Connection;
import java.util.ArrayList;

import qna.dao.qnaBoardDAO;
import qna.vo.qnaBoardbean;



public class qnaBoardListservice {

	//session 아이디 있으면 id
	public int getlistcount(String id) {
		int listcount = 0;
		
		Connection con=getconnection();
		qnaBoardDAO qnaBoard=qnaBoardDAO.getinstance();
		qnaBoard.setCon(con);
		listcount=qnaBoard.selectlist(id);
		

		close(con);
		return listcount;
		

		
	}
	
	
	
	public int getlistcount2() {
		int listcount = 0;
		
		Connection con=getconnection();
		qnaBoardDAO qnaBoard=qnaBoardDAO.getinstance();
		qnaBoard.setCon(con);
		listcount=qnaBoard.selectlist2();
		

		close(con);
		return listcount;
		

		
	}
	
	
	//미답변리스트
	public int getlistcount3() {
		int listcount = 0;
		
		Connection con=getconnection();
		qnaBoardDAO qnaBoard=qnaBoardDAO.getinstance();
		qnaBoard.setCon(con);
		listcount=qnaBoard.selectlist3();
		

		close(con);
		return listcount;
		

		
	}
	
	//답변리스트
	public int getlistcount4() {
		int listcount = 0;
		
		Connection con=getconnection();
		qnaBoardDAO qnaBoard=qnaBoardDAO.getinstance();
		qnaBoard.setCon(con);
		listcount=qnaBoard.selectlist4();
		

		close(con);
		return listcount;
		

		
	}
	

	
	
	
	public ArrayList<qnaBoardbean> getarticlelist(int page, int limit) {
		ArrayList<qnaBoardbean> articlelist=null;
		
		Connection con=getconnection();
		qnaBoardDAO qnaBoard=qnaBoardDAO.getinstance();
		qnaBoard.setCon(con);
		
		
		articlelist=qnaBoard.selectarticlelist(page,limit);
		
		
		
		close(con);
		return articlelist;
		
	}
	

	
	
	
	
	public ArrayList<qnaBoardbean> getrearticlelist(int page, int limit, String id) {
		ArrayList<qnaBoardbean> articlelist=null;
		
		Connection con=getconnection();
		qnaBoardDAO qnaBoard=qnaBoardDAO.getinstance();
		qnaBoard.setCon(con);
		
		
		articlelist=qnaBoard.selectarticlelistid(page, limit, id);
		
		
		
		close(con);
		return articlelist;
		
	}
	
	//미답변리스트
	public ArrayList<qnaBoardbean> getarticlelist3(int page, int limit) {
		ArrayList<qnaBoardbean> articlelist=null;
		
		Connection con=getconnection();
		qnaBoardDAO qnaBoard=qnaBoardDAO.getinstance();
		qnaBoard.setCon(con);
		
		
		articlelist=qnaBoard.selectarticlelist3(page, limit);
		
		
		
		close(con);
		return articlelist;
		
	}
	
	
	
	public ArrayList<qnaBoardbean> getarticlelist4(int page, int limit) {
		ArrayList<qnaBoardbean> articlelist=null;
		
		Connection con=getconnection();
		qnaBoardDAO qnaBoard=qnaBoardDAO.getinstance();
		qnaBoard.setCon(con);
		
		
		articlelist=qnaBoard.selectarticlelist4(page, limit);
		
		
		
		close(con);
		return articlelist;
		
	}
	
	
}

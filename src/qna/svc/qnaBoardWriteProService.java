package qna.svc;

import static qna.db.jdbcutil.*;

import java.sql.Connection;

import qna.dao.qnaBoardDAO;
import qna.vo.qnaBoardbean;


public class qnaBoardWriteProService {

	//글쓰기 작업요청 
	public boolean regisartiset(qnaBoardbean qnaboardbean) {
	boolean isWriteSuccess = false;

	Connection con = getconnection();
	
	// 3. BoardDAO 클래스로부터 BoardDAO 객체 가져오기(공통)
	
	qnaBoardDAO qnaBoard=qnaBoardDAO.getinstance();
	// 4. BoardDAO 객체의 setConnection() 메서드를 호출하여 Connection 객체를 전달(공통)
	qnaBoard.setCon(con);
	
	// 5. BoardDAO 객체의 XXX 메서드를 호출하여 XXX 작업 수행 및 결과 리턴 받기
	int insertcount2 = qnaBoard.insertArticle(qnaboardbean);
	
	
	
	if(insertcount2>0) {
		//작업이 성공했을 경우
		commit(con);
		isWriteSuccess=true;
		
	}else {
		//작업이 실패했을 경우
		rollback(con);
		
	}
	
	// 6. JdbcUtil 객체로부터 가져온 Connection 객체를 반환(공통)
	close(con); //jdbcutil.close(con);
	
	// 7. 작업 처리 결과 리턴
	return isWriteSuccess;
	
	

		
		
		
		
		
	}
	
	
	
}




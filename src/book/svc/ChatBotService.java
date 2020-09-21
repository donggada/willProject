package book.svc;

import java.sql.Connection;
import java.util.ArrayList;

import faq.dao.faqBoardDAO;
import faq.vo.faqBoardbean;

import static book.db.JdbcUtil.*;

public class ChatBotService {
	
	public ArrayList<faqBoardbean> checkBot() {
		
		Connection con = getConnection();
		faqBoardDAO fDAO = faqBoardDAO.getinstance();
		fDAO.setCon(con);
		
		ArrayList<faqBoardbean> list = fDAO.checkBot();
		
		return list;
	}
	
}

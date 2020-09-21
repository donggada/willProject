package qna.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.action.action;
import qna.svc.qnaBoardReplyProService;
import qna.vo.actionForward;
import qna.vo.qnaBoardbean;

public class qnaBoardReplyProAction implements action {

	@Override
	public actionForward exectute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		actionForward forward=null;

		request.setCharacterEncoding("UTF-8");
		
		int boardnum=Integer.parseInt(request.getParameter("qnaBoard_num"));
		String page = request.getParameter("page");

		qnaBoardbean qnaboardbean= new qnaBoardbean();
		
		qnaboardbean.setQnaBoard_num(boardnum);
		qnaboardbean.setQnaboard_reply(request.getParameter("qnaBoard_reply"));
		
		
		qnaBoardReplyProService boardmodify= new qnaBoardReplyProService();
		boolean iswritesucce= boardmodify.regisartiset(qnaboardbean);
	
		
		if(!(iswritesucce)) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('답변 글 등록실패.')");
			out.println("history.back()");
			out.println("</script>");
			
		}else {
			forward=new actionForward();
			forward.setRedirect(true);
			forward.setPath("qnaBoardlist.bo");
		}
		
		
		
		
		return forward;
	}

}

package info.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import info.svc.infoListService;
import info.vo.ActionForward;
import info.vo.ListBean;

public class infoListAction implements Action {

	@Override
	public ActionForward exectute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		ActionForward forward = new ActionForward();
		
		infoListService service = new infoListService();
		ListBean lb = service.checkList(id);
		request.setAttribute("bean", lb);
		ArrayList<ListBean> list = service.getBookList(id);
		request.setAttribute("list", list);
		forward.setPath("/myPage/info.jsp");
		return forward;
	}

}

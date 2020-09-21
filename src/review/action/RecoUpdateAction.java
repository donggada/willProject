package review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import review.svc.RecoUpdateService;
import review.vo.ActionForward;

public class RecoUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//추천수 올리는 ActionForward
		
		ActionForward forward = null;
		
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		String page = request.getParameter("page");
		
		RecoUpdateService recoUpdateService = new RecoUpdateService();
		int recoCount = recoUpdateService.selectRecoCount(review_num);
		
		System.out.println(recoCount);
		
		JSONObject obj = new JSONObject();
		obj.put("recoCount", recoCount);
	    response.setContentType("application/x-json; charset=UTF-8");
	    response.getWriter().print(obj);
		
		
//		forward = new ActionForward();
//		forward.setRedirect(true);
//		forward.setPath("ReviewDetail.rw?review_num="+review_num+"&page="+page);
		return forward;
	}

}

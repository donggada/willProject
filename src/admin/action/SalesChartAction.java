package admin.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.svc.SalesChartService;
import admin.vo.CarBean;
import member.action.Action;
import member.vo.ActionForward;

public class SalesChartAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		System.out.println("SalesChartAction");
		SalesChartService scs=new SalesChartService();
		ArrayList<CarBean> SalesList=scs.SalesChart();
		
		request.setAttribute("SalesList", SalesList);
		
		forward=new ActionForward();
		forward.setPath("/Admin/sailgrap.jsp");
		
		
		return forward;
	}

}

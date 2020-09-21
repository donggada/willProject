package book.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import book.svc.ChatBotService;
import book.vo.ActionForward;
import faq.vo.faqBoardbean;

public class ChatBotAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String subject = request.getParameter("subject");
	    ArrayList<ArrayList> testQna = new ArrayList<ArrayList>();
	    ChatBotService cbs = new ChatBotService();
	    ArrayList<faqBoardbean> list = cbs.checkBot();
	    ArrayList<Object> qnaList = null;
	    String choiceQna = null;
	    String anotherQna  = null;
	    
	    boolean checkBool = false;
	    for(int a = 0; a < list.size(); a++)
	    {
	    	qnaList = new ArrayList<Object>();
	    	qnaList.add(list.get(a).getFaqboard_subject());
	    	qnaList.add(list.get(a).getFaqboard_content());
	    	testQna.add(qnaList);
	    }
	    double changeNum = 0.0;
		double num = 0;
	    JSONObject obj = new JSONObject();
	    for(int i = 0; i < testQna.size(); i++)
	    {
	    	double check = similarity(subject, (String)testQna.get(i).get(0));
	    	testQna.get(i).add(check);
	    	if(check != 0.0 && changeNum < check)
	    	{
    			checkBool = true;
    			choiceQna = "("+(String)testQna.get(i).get(0)+")\n"+(String)testQna.get(i).get(1);
	    		changeNum = check;
	    	}
	    	else if(changeNum > check && check != 0.0)
	    	{
	    		if(anotherQna == null)
	    		{
	    			anotherQna = "("+(String)testQna.get(i).get(0)+")\n"+(String)testQna.get(i).get(1);
	    			num = (double)testQna.get(i).get(2);
	    		}
	    		else if(num < (double)testQna.get(i).get(2))
	    		{
	    			anotherQna = "("+(String)testQna.get(i).get(0)+")\n"+(String)testQna.get(i).get(1);
	    			num = (double)testQna.get(i).get(2);
	    		}
	    		
	    	}
	    }
	    if(anotherQna == null)
	    {
	    	anotherQna = "";
	    }
	    if(choiceQna == null)
	    {
	    	choiceQna = "비슷한 답변이 없습니다";
	    	anotherQna = "";
	    }
	    else
	    {
		    obj.put("result3","--------------------------------------" +"\n");
	    }
	    response.setContentType("application/x-json; charset=UTF-8");

	    if(checkBool)
	    {
	    	obj.put("result","1번답변"+"\n"+choiceQna +"\n");
	    	if(anotherQna != "")
	    	{
	    		obj.put("result2","2번답변"+"\n"+anotherQna +"\n");
	    	}
	    }
	    else
	    {
	    	obj.put("result",choiceQna +"\n");
	    	obj.put("result2",anotherQna +"\n");
	    }
	    response.getWriter().print(obj);	
	    
		return null;
	}
	private double similarity(String s1, String s2) {
	    String longer = s1, shorter = s2;
	    
	    if (s1.length() < s2.length()) {
	        longer = s2; 
	        shorter = s1;
	    }
	    
	    int longerLength = longer.length();
	    if (longerLength == 0) return 1.0;

	    return (longerLength - editDistance(longer, shorter)) / (double) longerLength;
	}
	private int editDistance(String s1, String s2) {
	    s1 = s1.toLowerCase();
	    s2 = s2.toLowerCase();
	    int[] costs = new int[s2.length() + 1];
	    
	    for (int i = 0; i <= s1.length(); i++) {
	        int lastValue = i;
	        for (int j = 0; j <= s2.length(); j++) {
	            if (i == 0) {
	                costs[j] = j;
	            } else {
	                if (j > 0) {
	                    int newValue = costs[j - 1];
	                    
	                    if (s1.charAt(i - 1) != s2.charAt(j - 1)) {
	                        newValue = Math.min(Math.min(newValue, lastValue), costs[j]) + 1;
	                    }
	                    
	                    costs[j - 1] = lastValue;
	                    lastValue = newValue;
	                }
	            }
	        }
	        
	        if (i > 0) costs[s2.length()] = lastValue;
	    }
	    
	    return costs[s2.length()];
	}
}

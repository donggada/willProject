package book.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.net.MalformedURLException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import book.vo.ActionForward;

class WebConnection {
	NodeList xml;
	Document doc;
	String output;

	WebConnection(int pageNo, int numOfRows, String StartDate, String EndDate) throws Exception {
		String serviceKey = "G3pYG6pKDGIYEB6HnQfOyXuRj0WdQU1ZPwS%2F%2BBABAOm0fTwILlvQvJl19EDGW5HNKOXtyzWeKdH0FYj4B5%2Fh1Q%3D%3D";
		String address = "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson?"
				+ "serviceKey=" + serviceKey + "&pageNo="+ pageNo + "&numOfRows="+ numOfRows +
				"&startCreateDt="+ StartDate + "&endCreateDt=" + EndDate; // 커넥션 관련한 클래스
		
		try {
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			doc = dBuilder.parse(address);

			// root tag 
//			doc.getDocumentElement().normalize();
			System.out.println("Root element: " + doc.getDocumentElement().getNodeName()); // Root element: result
		
			NodeList nList = doc.getElementsByTagName("item");
			System.out.println("파싱할 리스트 수 : "+ nList.getLength());  // 파싱할 리스트 수 :  5
			
			xml = nList;
			
			TransformerFactory tf = TransformerFactory.newInstance();

			Transformer transformer = tf.newTransformer();

			transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");

			StringWriter writer = new StringWriter();

			transformer.transform(new DOMSource(doc), new StreamResult(writer));

			output = writer.getBuffer().toString();
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			System.out.println("url에 문제가 있음!");
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("Json 통신에 문제가 있음!");
			e.printStackTrace();
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TransformerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	WebConnection(int pageNo, int numOfRows){
		String serviceKey = "G3pYG6pKDGIYEB6HnQfOyXuRj0WdQU1ZPwS%2F%2BBABAOm0fTwILlvQvJl19EDGW5HNKOXtyzWeKdH0FYj4B5%2Fh1Q%3D%3D";
		String address = "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson?"
				+ "serviceKey=" + serviceKey + "&pageNo="+ pageNo + "&numOfRows="+ numOfRows;// 커넥션 관련한 클래스
		

		try {
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			doc = dBuilder.parse(address);

			// root tag 
//			doc.getDocumentElement().normalize();
			System.out.println("Root element: " + doc.getDocumentElement().getNodeName()); // Root element: result
		
			NodeList nList = doc.getElementsByTagName("item");
			System.out.println("파싱할 리스트 수 : "+ nList.getLength());  // 파싱할 리스트 수 :  5
			
			xml = nList;
			
			TransformerFactory tf = TransformerFactory.newInstance();

			Transformer transformer = tf.newTransformer();

			transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");

			StringWriter writer = new StringWriter();

			transformer.transform(new DOMSource(doc), new StreamResult(writer));

			output = writer.getBuffer().toString();
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			System.out.println("url에 문제가 있음!");
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("Json 통신에 문제가 있음!");
			e.printStackTrace();
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TransformerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}

public class CoronaDataParsingAction implements Action {
	
	private static String getTagValue(String tag, Element eElement) {
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();
	}


	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String StartDate = request.getParameter("StartDate");
		String EndDate = request.getParameter("EndDate");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.DATE, -1);
	
	
		StartDate = sdf.format(cal.getTime());
		EndDate = sdf.format(cal.getTime());
		
		System.out.println("시작일 : " + StartDate + "종료일 : " + EndDate);
		
		WebConnection wc;
		if(StartDate != null && EndDate != null) {
			wc = new WebConnection(1, 10, StartDate, EndDate); 
		}else {
			wc = new WebConnection(1, 10); 
		}
		 
		response.setCharacterEncoding("utf-8");

		PrintWriter pw = response.getWriter();
		pw.println("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		pw.print(wc.output);
		pw.flush();
		
		NodeList items = wc.xml;
		
		for(int temp = 0; temp < items.getLength(); temp++){		
			Node nNode = items.item(temp);
			if(nNode.getNodeType() == Node.ELEMENT_NODE){
								
				Element eElement = (Element) nNode;
				System.out.println("######################");
				//System.out.println(eElement.getTextContent());
				System.out.println("지역명  : " + getTagValue("gubun", eElement));
				System.out.println("전날 대비 증감수  : " + getTagValue("incDec", eElement));
				System.out.println("확찐자 : " + getTagValue("defCnt", eElement));
			}	
		}	
		
		

		return null;
	}

}

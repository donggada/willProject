<%@page import="book.vo.BookBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="book.vo.CarBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%
      String snsid = (String)session.getAttribute("Member_snsid");
      String id = (String)session.getAttribute("Member_id");

      String pickup = request.getParameter("pickup_date"); 
      String end = request.getParameter("end_date"); 
      String SelCarType = request.getParameter("SelCar"); 
      
      ArrayList<CarBean> carList = (ArrayList<CarBean>)request.getAttribute("carList");
//       ArrayList<BookBean> bookList =(ArrayList<BookBean>)request.getAttribute("bookList");

	System.out.println(snsid);
		System.out.println(id);
		
    %>
    
    
<!DOCTYPE html>
<html> 
<script src="js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				var today = new Date();
				var dd = today.getDate();
				var mm = today.getMonth() + 1;
				var yyyy = today.getFullYear();
				if (dd < 10) {
					dd = '0' + dd
				}
				if (mm < 10) {
					mm = '0' + mm
				}
				today = yyyy + '-' + mm + '-' + dd;
				document.getElementById("pickup_date").setAttribute("min",
						today);

				$('#pickup_date').change(
						function() {

							var pickup = new Date($('#pickup_date').val());
							document.getElementById('end_date').min = pickup
									.toISOString().substring(0, 10);
							document.getElementById('end_date').value = pickup
									.toISOString().substring(0, 10);
							pickup.setDate(pickup.getDate() + 7);
						});
			});

	
	function card(a,b,c,d,e){
		var car_id = a
		var pickup = b
		var end = c
		var price = d
		var member_id = e
		window.open("BookPro2.bk?car_id="+car_id+"&pickup="+pickup+"&end="+end+"&rentprice="+price+"&member_id="+member_id,"카드결제","width=900,height=600");
	}
		
	/*무통장입금 결제 팝업창  */	
	function vbank(a,b,c,d,e){
		var car_id = a
		var pickup = b
		var end = c
		var price = d
		var member_id = e
		window.open("BookPro3.bk?car_id="+car_id+"&pickup="+pickup+"&end="+end+"&rentprice="+price+"&member_id="+member_id,"카드결제","width=900,height=600");
	}
	
	function noId(){
		
		
		alert("로그인을 해주세요.");
		location.href="LoginForm.me";
		
	}
		
		
	//     $('table tr td').click(function() {
	//         var txt = $(this).text();
	//         document.getElementById('car').value = txt;
	//         $('#Car_list tr td').css('border', '1px solid black');
	//         $(this).css('border', '2px solid blue');
	// 	});
</script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<h3>예약 페이지 2</h3>

<%
System.out.println(pickup);
System.out.println(end);
System.out.println(SelCarType);

%>
</head>

<script type="text/javascript">
		
function search(id){
	alert(id);
}		
		
		
</script>

<body>

<form action="BookForm2.bk" method="post">
<h2>기간선택</h2>

인수날짜 : <input type="date" id="pickup_date" name="pickup_date" value="<%=pickup %>"><br>
도착날짜 : <input type="date" id="end_date" name="end_date" value="<%=end %>"><br>

<h2>차량유형 선택</h2>	
 
<table id="Car_list">
<tr>
<td>경차<input type="radio" name="SelCar" value="경차" <%if(SelCarType.equals("경차")){ %>checked<%} %>></td>
<td>소형<input type="radio" name="SelCar" value="소형" <%if(SelCarType.equals("소형")){ %>checked<%} %>></td>
<td>중형<input type="radio" name="SelCar"  value="중형" <%if(SelCarType.equals("중형")){ %>checked<%} %>></td>
</tr>
<tr>
<td>준대형<input type="radio" name="SelCar"  value="준대형" <%if(SelCarType.equals("준대형")){ %>checked<%} %>></td>
<td>대형<input type="radio" name="SelCar"  value="대형" <%if(SelCarType.equals("대형")){ %>checked<%} %>></td>
<td>승합<input type="radio" name="SelCar"  value="승합" <%if(SelCarType.equals("승합")){ %>checked<%} %>></td>
</tr>
<tr>
<td>SUV/RV<input type="radio" name="SelCar"  value="SUVㅣRV" <%if(SelCarType.equals("SUVㅣRV")){ %>checked<%} %>></td>
<td>전기차<input type="radio" name="SelCar"  value="전기차" <%if(SelCarType.equals("전기차")){ %>checked<%} %>></td>
<td>수입차<input type="radio" name="SelCar"  value="수입차"  <%if(SelCarType.equals("수입차")){ %>checked<%} %>></td>
</tr>
</table>

<input type="submit" value="재검색"><br>
</form>


<form action="BookPro.bk" method="post">
<input type="hidden" id="pickup_date" name="pickup_date" value="<%=pickup %>">
<input type="hidden" id="end_date" name="end_date" value="<%=end %>">

<table id="carselect">



			<tr >
				<td width="100">차량명</td>
				<td width="400">제조사</td>
				<td width="150">분류</td>
				<td width="100">가격</td>
				<td width="100">색상</td>
				<td width="100">선택</td>
			</tr>
				
				
				
			
			
			<%
			
// 			public enum CAR_TYPE{
// 				경차(0,"경차"),
// 				소형(1,"소형"),
// 				중형(2,"중형"),
// 				준대형(3,"준대형"),
// 				대형(4,"대형"),
// 				승합(5,"승합"),
// 				SUVㅣRV(6,"SUV/RV"),
// 				전기차(7,"전기차"),
// 				수입차(8,"수입차");
			
			
			
			
			String ct = null;
			
			for(int i = 0; i<carList.size(); i++){
			
				ct = carList.get(i).getCar_type().toString();
				
				if(carList.get(i).isCar_is_rent()==true && ct.equals(SelCarType)) {
			 
				%>
				<tr >
				<td width="100">차량명<%=carList.get(i).getCar_id() %></td>
				<td width="400">제조사<%=carList.get(i).getCar_maker() %></td>
				<td width="150">분류<%=carList.get(i).getCar_type() %></td>
				<td width="100">가격<%=carList.get(i).getCar_price_normal() %></td>
				<td width="100">색상<%=carList.get(i).getCar_color() %></td>
			<%-- 				<td><input type="button" class="selbtn" id="selbtn" onclick= "location.href='BookPro.bk?car_id=<%=carList.get(i).getCar_id()%>&pickup=<%=pickup %>&end=<%=end %>&rentprice=<%=carList.get(i).getCar_price_normal() %>&member_id=<%if(id == null){%><%=snsid%><%}else{%><%=id%><%};%>'" value="예약하기"></td> --%>
			
				<%if(id == null){%>
					
					<td>
					<input type="button" class="selbtn" id="selbtn" value="카드결제" onclick="noId()">
					<input type="button" class="selbtn" id="selbtn" value="무통장입금" onclick="noId()">
					</td>
						<%
						}else{
						%>
					
						<td>
						<input type="button" class="selbtn" id="selbtn" value="카드결제" onclick="card('<%=carList.get(i).getCar_id()%>','<%=pickup%>','<%=end%>','<%=carList.get(i).getCar_price_normal()%>','<%if(id == null){%><%=snsid%><%}else{%><%=id%><%};%>')">
						<input type="button" class="selbtn" id="selbtn" value="무통장입금" onclick="vbank('<%=carList.get(i).getCar_id()%>','<%=pickup%>','<%=end%>','<%=carList.get(i).getCar_price_normal()%>','<%if(id == null){%><%=snsid%><%}else{%><%=id%><%};%>')">
						</td>
					<%
					}
					%>
				
			<%
			}
			}
			%>
			</table>

</form>
</body>


</html>
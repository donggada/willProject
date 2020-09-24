<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<%String car_id=request.getParameter("car_id"); %>
<script type="text/javascript">
var car_id=<%=car_id%>
jQuery(document).ready(function () {
	
	  $.getJSON('DetailCarInfo.ad?car_id='+car_id,function(rdata){
		 $.each(rdata,function(index,item){
			 $('#car_id').append('<td>'+item.id+'</td>');
			 $('#car_num').append('<td>'+item.num+'</td>');
			 $('#car_maker').append('<td>'+item.maker+'</td>');
			 $('#car_type').append('<td>'+item.type+'</td>');
		 });
	 });	
	 
	
	
	
	
});
</script>
</head>
<body>
<table>
<tr><th id="car_id">Car_id</th></tr>
<tr><th id="car_num">Car_num</th></tr>
<tr><th id="car_maker">Car_maker</th></tr>
<tr><th id="car_type">Car_type</th></tr>
</table>
</body>
</html>
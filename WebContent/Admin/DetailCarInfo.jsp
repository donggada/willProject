<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!--=== Bootstrap CSS ===-->
<link href="../assets/css/bootstrap.min.css" rel="stylesheet">
<!--=== Slicknav CSS ===-->
<link href="../assets/css/plugins/slicknav.min.css" rel="stylesheet">
<!--=== Magnific Popup CSS ===-->
<link href="../assets/css/plugins/magnific-popup.css" rel="stylesheet">
<!--=== Owl Carousel CSS ===-->
<link href="../assets/css/plugins/owl.carousel.min.css" rel="stylesheet">
<!--=== Gijgo CSS ===-->
<link href="../assets/css/plugins/gijgo.css" rel="stylesheet">
<!--=== FontAwesome CSS ===-->
<link href="../assets/css/font-awesome.css" rel="stylesheet">
<!--=== Theme Reset CSS ===-->
<link href="../assets/css/reset.css" rel="stylesheet">
<!--=== Main Style CSS ===-->
<link href="../style.css" rel="stylesheet">
<!--=== Responsive CSS ===-->
<link href="../assets/css/responsive.css" rel="stylesheet">
<style type="text/css">
*{background-color: black;}

#car_num{color: #ffc107;}
#car_maker{color: #ffc107;}
#car_type{color: #ffc107;}
#car_name{color: #ffc107;}
</style>
<%String car_id=request.getParameter("car_id"); %>
<script type="text/javascript">
var car_id=<%=car_id%>
jQuery(document).ready(function () {
	  $.getJSON('DetailCarInfo.ad?car_id='+car_id,function(rdata){
		 $.each(rdata,function(index,item){
			 $('#car_img').append('<img src="../ChartCarimg/'+item.name+'.png" height="200">');
			 $('#car_id').append(item.id);
			 $('#car_num').append("차량 번호 : "+item.num);
			 $('#car_maker').append("차종류 : "+item.maker);
			 $('#car_name').append("차이름 : "+item.name);
			 $('#car_type').append("차종류 : "+item.type);
		 });
	 });	
	 
	
	
	
	
});
</script>
</head>
<body>
<!-- Single Pricing Table -->
				<div class="col-lg-4 col-md-6 text-center">
					<div class="single-pricing-table1">
						<h3 id="car_img"></h3>
						<h2 id="car_num"></h2>

						<ul class="package-list">
						<li id="car_maker"></li>
						<li id="car_name"></li>
						<li id="car_type"></li>
						
						</ul>
					</div>
				</div>
				<!-- Single Pricing Table -->
</body>
</html>
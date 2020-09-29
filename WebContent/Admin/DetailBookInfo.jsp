<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link href="Admin/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
     <link href="../QnA/QnA11/bootstrap.css" rel="stylesheet">
 <link href="../QnA/QnA11/bootstrap.min.css" rel="stylesheet"> 
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<%String book_num=request.getParameter("book_num"); %>

<script type="text/javascript">
var book_num=<%=book_num%>
jQuery(document).ready(function () {
	
	  $.getJSON('DetailBooktInfo.ad?book_num='+book_num,function(rdata){
		 $.each(rdata,function(index,item){
			 $('#car_id').append(item.book_num+" / "+item.book_id+" / "+item.book_date);
			 $('#car_num').append(item.book_price);
			 $('#car_type').append(item.book_insurance+" / "+item.book_id);
			 $('#car_option').append(item.book_pickup_date+" / "+item.end_date);

		 });
	 });	
	 
	
	
	
	
});
</script>
</head>
<body>

<div class="card mb-3">
  <h3 class="card-header" id="car_id"> </h3>

  <div class="card-body">
    <h5 class="card-title" id="car_type"></h5>
    <h6 class="card-subtitle text-muted" id="car_price"></h6>
  </div>
  <div id="car_im">
  </div>
  <div class="card-body">
    <p class="card-text" id="car_num"> </p>
  
   <p class="card-text" id="car_option"> </p>

    
 </div>

  <div class="card-footer text-muted" style="text-align: right;">
      <a onclick="window.close();" class="card-link" >닫기</a>
  </div>
</div>






</body>
</html>
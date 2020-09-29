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
<%String car_id=request.getParameter("car_id"); %>

<script type="text/javascript">
var car_id=<%=car_id%>
jQuery(document).ready(function () {
	
	  $.getJSON('DetailCarInfo.ad?car_id='+car_id,function(rdata){
		 $.each(rdata,function(index,item){
			 $('#car_id').append(item.id+" / "+item.maker+" / "+item.year);
			 $('#car_num').append(item.num);
			 $('#car_type').append(item.type+" / "+item.cc+"cc / "+item.oil);
			 $('#car_im').append(item.carphoto);
			 $('#car_option').append(item.trunk+" / "+item.pet+" / "+item.smoke+" / "+item.open);
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
  <img style="height: 200px; width: 100%; 
  display: block;" src="" alt="Card image">
  </div>
  <div class="card-body">
    <p class="card-text" id="car_num"> </p>
  
   <p class="card-text" id="car_option"> </p>

<!--     <div class="custom-control custom-checkbox"> -->
<!--       <input type="checkbox" class="custom-control-input" id="customCheck1" checked="checked"> -->
<!--       <label class="custom-control-label" for="customCheck1">navi</label> -->
<!--     </div> -->
<!--     <div class="custom-control custom-checkbox"> -->
<!--       <input type="checkbox" class="custom-control-input" id="customCheck2" > -->
<!--       <label class="custom-control-label" for="customCheck2">open</label> -->
<!--     </div> -->
<!--       <div class="custom-control custom-checkbox"> -->
<!--       <input type="checkbox" class="custom-control-input" id="customCheck3" > -->
<!--       <label class="custom-control-label" for="customCheck3">pet</label> -->
<!--     </div> -->
<!--       <div class="custom-control custom-checkbox"> -->
<!--       <input type="checkbox" class="custom-control-input" id="customCheck4" > -->
<!--       <label class="custom-control-label" for="customCheck4">smoke</label> -->
<!--     </div> -->
<!--       <div class="custom-control custom-checkbox"> -->
<!--       <input type="checkbox" class="custom-control-input" id="customCheck5"> -->
<!--       <label class="custom-control-label" for="customCheck5">trunk</label> -->
<!--     </div> -->
    
 </div>

  <div class="card-footer text-muted" style="text-align: right;">
      <a onclick="window.close();" class="card-link" >닫기</a>
  </div>
</div>

  </div>
  </div>
</div>
</div>




</body>
</html>
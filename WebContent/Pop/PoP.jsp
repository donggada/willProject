<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.5.1.js"></script>
</head>
<body>
팝업창 입니다<br>
<script type="text/javascript">
$(document).ready(function() {
 $.getJSON('popblog.jsp',function(rdata){
	 $.each(rdata,function(index,item){
		 $('boby').append('<img alt="300" src="'+item.file_name+'" ">')
	 });
 });
	
	
	
	
	
	
});

</script>
<img alt="img" src="../img/pc_img_kakao.jpg" id="imgblog" width="400" height="400">
</body>
</html>
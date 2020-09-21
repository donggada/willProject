<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String id=(String)session.getAttribute("id");
String snsid=(String)session.getAttribute("snsid");
String totalId = null;
if(id !=null){
	totalId=id;
}else{
	totalId=snsid;
}
out.println(totalId);
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>

<!--예약검색하는 javascript입니다  -->
<script type="text/javascript">
function bookSearch(){
	var totalId=document.reviewForm.member_id.value
    window.open("/WillProject_0.1/BookCheck.rw?id="+totalId,"예약검색","width=500,height=300");
}
</script>

</head>
<body>
<form action="ReviewWritePro.rw" method="post" enctype="multipart/form-data" name="reviewForm">
<input type="button" value="예약검색" onclick="bookSearch()">
<table>
<tr><td>ID</td><td><input type="text" name="member_id" id="member_id" value="<%=totalId%>"></td> <!--sessionID -->
    <td>예약번호</td><td><input type="text" name="book_num" id="book_num"></td></tr>
<tr><td>차량정보</td><td><input type="text" name="car_id" id="car_id"></td>
    <td>인수일</td><td><input type="text" name="pickup_date" id="pickup_date"></td>
    <td>반납일</td><td><input type="text" name="end_date" id="end_date"></td></tr>
<tr><td>글제목</td><td><input type="text" name="review_subject"></td></tr>
<tr><td>파일</td><td><input type="file" name="review_file" required="required"></td>
<tr><td>내용</td><td><textarea rows="10" cols="60" name="review_content"></textarea></td></tr>
<tr><td>비밀번호</td><td><input type="password" name="review_pass" required="required"></td></tr>
</table>
<input type="submit" value="등록" class="btn">
<input type="reset" value="취소" class="btn">
</form>
</body>
</html>
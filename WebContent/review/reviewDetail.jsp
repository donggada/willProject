<%@page import="review.vo.ReviewBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
ReviewBean article = (ReviewBean)request.getAttribute("article");
String nowPage = (String)request.getAttribute("page");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세보기</title>
<script src="js/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#recobtn').click(function(){
		$.ajax({
			url:"ReviewRecoCheck.rw",
			dataType: "json",
			data:{
				review_num:$('#review_num').val(),
				page:$('#page').val()
			},
			success: function(returndata){
				$('#test2').html(returndata.recoCount);
				
			}
		});
	});
});
</script>
</head>
<body>
<table>
<tr><td>ID</td><td><%=article.getMember_id() %></td><td>예약번호</td><td><%=article.getBook_num() %></td></tr>
<tr><td>차량정보</td><td><%=article.getCar_id() %></td><td>인수일</td><td><%=article.getPickup_date() %></td>
    <td>반납일</td><td><%=article.getEnd_date() %></td></tr>
<tr><td>글제목</td><td><%=article.getReview_subject() %></td></tr>
<tr><td>파일</td><%if(article.getReview_file()!=null){ %><td><%=article.getReview_file() %>
<img src="../WillProject_0.1/reviewUpload/<%=article.getReview_file()%>"><br></td><%} %>
<tr><td>내용</td><td><%=article.getReview_content() %></td></tr>
<tr><td>종아요<div id="test2"><%=article.getReview_recocount() %></div></td></tr>
</table>
<div id="recodiv">
<input type="hidden" name="review_num" id="review_num" value="<%=article.getReview_num() %>">
<input type="hidden" name="page" id="page" value="<%=nowPage %>">
<input type="button" value="추천하기" id="recobtn">
</div>
<%-- <%=article.getReview_recocount() %><br>
<input type="button" value="추천하기" id="recobtn" onclick="location.href='ReviewRecoCheck.rw?review_num=<%=article.getReview_num()%>&page=<%=nowPage %>'">
<br> --%>
<a href="ReviewModifyForm.rw?review_num=<%=article.getReview_num() %>&page=<%=nowPage %>">[수정]</a>
<a href="ReviewDeleteForm.rw?review_num=<%=article.getReview_num() %>&page=<%=nowPage %>">[삭제]</a>
<a href="ReviewList.rw?page=<%=nowPage %>">[목록]</a>
</body>
</html>
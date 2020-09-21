<%@page import="book.vo.PageInfo"%>
<%@page import="book.vo.BookBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	ArrayList<BookBean> bookList = (ArrayList<BookBean>) request.getAttribute("bookList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 리스트</title>
<style type="text/css">
</style>
</head>
<body>
	<!-- 게시판 리스트 -->
	<section id="listForm">
		<h2>글 목록</h2>
		<table>
			<tr id="tr_top">
				<td width="100">예약 번호</td>
				<td width="400">회원아이디</td>
				<td width="150">예약일</td>
				<td width="150">대여 예정일</td>
				<td width="100">반납 예정일</td>
				<td width="100">차량 번호</td>
				<td width="100">결재 금액</td>
				<td width="100">현재 상태</td>

			</tr>






			<tr id="tr_top">


				<%
					if (bookList != null) {
					for (BookBean book : bookList) {
				%>


				<td width="100"><%=book.getBook_num()%></td>
				<td width="400"><%=book.getMember_id()%></td>
				<td width="150"><%=book.getBook_date()%></td>
				<td width="150"><%=book.getPickup_date()%></td>
				<td width="100"><%=book.getEnd_date()%></td>
				<td width="100"><%=book.getCar_id()%></td>
				<td width="100"><%=book.getBook_price()%></td>
				<td width="100"><%=book.getBook_state()%></td>
			</tr>


			<%
				}
			%>

			<%
				} else {
			%>
			<tr>
				<td colspan="6">회원 목록이 없습니다.</td>
			</tr>
			<%
				}
			%>
		</table>
	</section>

</body>
</html>



















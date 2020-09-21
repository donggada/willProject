<%@page import="review.vo.PageInfo"%>
<%@page import="review.vo.ReviewBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ArrayList<ReviewBean> articleList = (ArrayList<ReviewBean>)request.getAttribute("articleList");
PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
int listCount = pageInfo.getListCount();
int nowPage = pageInfo.getPage();
int maxPage = pageInfo.getMaxPage();
int startPage = pageInfo.getStartPage();
int endPage = pageInfo.getEndPage();
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 목록</title>
</head>
<body>
<table>
<%
if(articleList != null && listCount>0){
%>
 <tr>
 <td>번호</td>
 <td>제목</td>
 <td>작성자</td>
 <td>날짜</td>
 <td>조회수</td>
 <td>추천수</td>
 </tr>
 <%for(int i=0; i<articleList.size(); i++) {%>
 <tr>
 <td><%=articleList.get(i).getReview_num() %></td>
 <td><a href="ReviewDetail.rw?review_num=<%=articleList.get(i).getReview_num() %>&page=<%=nowPage %>"><%=articleList.get(i).getReview_subject() %></a></td>
 <td><%=articleList.get(i).getMember_id() %></td>
 <td><%=articleList.get(i).getReview_date() %></td>
 <td><%=articleList.get(i).getReview_readcount() %></td>
 <td><%=articleList.get(i).getReview_recocount() %></td>
 </tr>
 <%
    }
 %>
</table>

<input type="button" value="글쓰기" onclick="location.href='ReviewWriteForm.rw'">
    <%if(nowPage<=1){ %>
    [이전]
    <%}else{ %>
        <a href="ReviewList.rw?page=<%=nowPage-1 %>">[이전]</a>
    <%} %>
    <%for(int a=startPage; a<=endPage; a++){ 
        if(a==nowPage){%>
            [<%=a %>]
    <%} else { %>
        <a href="ReviewList.rw?page=<%=a %>">[<%=a %>]</a>
        <%} %>    
    <%} %>
    <%if(nowPage>=maxPage){ %>
        [다음]
    <%}else{ %>    
        <a href="ReviewList.rw?page=<%=nowPage+1 %>">[다음]</a>
    <%} %>
<%}else{
	%>등록된 글이 없습니다.
	<%} %>
</body>
</html>
<%@page import="org.apache.el.lang.ELSupport"%>
<%@page import="qna.vo.pageinfo"%>
<%@page import="qna.vo.qnaBoardbean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%String id = (String)session.getAttribute("id"); 
     	if(id==null){
		%>
	<script type="text/javascript">
	  alert("회원만 작성가능합니다.")
	window.history.back();
	</script>
		
	<% }%>
    
	
    <%
	ArrayList<qnaBoardbean> articleList = (ArrayList<qnaBoardbean>)request.getAttribute("articlelist");
	pageinfo pageInfo = (pageinfo)request.getAttribute("pageinfo");

	int listCount = pageInfo.getListcount();
	int nowPage = pageInfo.getPage(); 
	int startPage = pageInfo.getStartpage();
	int endPage = pageInfo.getEndpage();
	int maxPage = pageInfo.getMaxpage();
	
%>  

 
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link href="QnA/QnA11/bootstrap.css" rel="stylesheet">
 <link href="QnA/QnA11/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

</head>
<body>
	<section id="listForm">
		<h2>1:1 Inquiry list</h2>
		
<a href="faqlist.fbo" style="float: right; margin-right: 3px;">
<button type="button" class="btn btn-outline-primary" style="margin-bottom: 3px;">FAQ</button>
</a>
		
		
	<table class="table table-hover">
			  <thead>
			<tr id="tr_top">
			<th scope="col">번호</th>
     		<th scope="col">구분</th>
      		<th scope="col">제목</th>
      		<th scope="col" style="height: 5px;">
      		<%if(id.equals("admin")){%>

    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" style="margin: -10px;">구분</a>
    <div class="dropdown-menu" style="">
      <a class="dropdown-item" href="qnaBoardlist.bo">전체</a>
      <a class="dropdown-item" href="qnaadminlist2.bo">답변완료</a>
      <a class="dropdown-item" href="qnaadminlist.bo">미답변</a>
    </div>      	
    
    
      		<%}else{%>답변유무<%}%>
      		</th>
      		<th scope="col">작성일</th>
      		<th scope="col">조회수</th>
			</tr>
			</thead>
	 <tbody>
			
		<%if(articleList != null & listCount > 0) {%>
			<%for(int i = 0; i < articleList.size(); i++) {%>
			
				<tr>
					<%if(articleList.get(i).getQnaBoard_re_lev()==0){ %>
					<th scope="row"><%=articleList.get(i).getQnaBoard_num() %></td>
					<%} else if(articleList.get(i).getQnaBoard_re_lev()>0){%>
					<td scope="row"></td>
					<% } %>
			<td style="text-align: center;">
			<%if(articleList.get(i).getQnaBaord_tag() !=null){ 
			%><b><%=articleList.get(i).getQnaBaord_tag() %></b><%}{}%>
			</td>
					<td>
					<a href="qnaboardcheck.bo?qnaBoard_num=<%=articleList.get(i).getQnaBoard_num()%>&page=<%=nowPage%>">
							<%=articleList.get(i).getQnaBoard_subject() %>
						</a>
					</td>
							
							<td>
							<%if(articleList.get(i).getQnaboard_reply()!=null){ %>
							<span class="badge badge-pill badge-primary">답변 완료</span>
							<%}else if(articleList.get(i).getQnaboard_reply()==null){%>
								<span class="badge badge-pill badge-secondary">답변대기중</span>
								
							<%} %>
							</td>
					

					
					<%if(articleList.get(i).getQnaBoard_re_lev()==0){ %>
					<td align="center"><%=articleList.get(i).getQnaBoard_date()%></td>
					<td align="center"><%=articleList.get(i).getQnaBoard_readcount() %></td>
					<%} else if(articleList.get(i).getQnaBoard_re_lev()>0){%>
					<td align="center"></td>
					<td align="center"></td>
					<% } %>
				</tr>
			<%} %>
			</tbody>
		</table>		
	</section>
	
	
	
	<section id="writeButton" style="float: right;">
		<a href="qnawrite.bo"><input type="button" class="btn btn-primary" value="문의하기"></a>
	</section>
	
	
	<section id="pageList" style="text-align: center; margin-left: auto; margin-right: auto;">
	<div style="text-align: center; margin-left: auto; margin-right: auto;">
	<ul class="pagination pagination-sm">
	<%if(nowPage <= 1) { %>
			 <li class="page-item disabled">
     	 <a class="page-link" href="#">&laquo;</a>
   		 </li>
	<%} else {%>
			    <li class="page-item disabled">
      <a class="page-link" href="qnaBoardlist.bo?page=<%=nowPage - 1%>#">&laquo;</a>&nbsp;
  		  </li>
	<%} %>
	
	<%for(int i = startPage; i <= endPage; i++) {
		    if(i == nowPage) {%>
		     <li class="page-item active">
		  <a class="page-link" href="#">
				<%=i %>
				</a>&nbsp;
				
		<%} else {%>
		 <li class="page-item active">
		  <a class="page-link" href="qnaBoardlist.bo?page=<%=i %>">
				<%=i %>
				</a>&nbsp;
		<%} %>
	<%} %>
	
	<%if(nowPage >= maxPage) {%>
			<li class="page-item">
      <a class="page-link" href="#">&raquo;</a>
          </li>
	<%} else { %>
			   <li class="page-item">
      <a class="page-link" href="qnaBoardlist.bo?page=<%=nowPage + 1%>">&raquo;</a>
    </li>
	<%} %>
	</ul>
</div>
	</section>
<%} else {%>


	<section id="emptyArea">등록된 글이 없습니다.</section>
	<section id="writeButton" style="float: right;">
		<a href="qnawrite.bo"><input type="button" class="btn btn-primary" value="문의하기"></a>
	</section>
	
<%} %>



</body>
</html>



















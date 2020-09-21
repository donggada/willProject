
<%@page import="qna.vo.qnaBoardbean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	qnaBoardbean article = (qnaBoardbean)request.getAttribute("article");
    String nowPage = (String)request.getAttribute("page");
	String id = (String)session.getAttribute("id");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link href="QnA/QnA11/bootstrap.css" rel="stylesheet">
 <link href="QnA/QnA11/bootstrap.min.css" rel="stylesheet">
</head>
<body>

 
   <div class="col-lg-4">
            <div class="bs-component">
              <div class="card mb-3">
                <h3 class="card-header"><%=article.getQnaBoard_id()%>님의 문의내용보기</h3>
                <div class="card-body">
                  <h5 class="card-title"><%=article.getQnaBoard_subject() %></h5>

                </div>
                
                <%if(article.getQnaBoard_file()!=null){ %>
                <img style="height: 200px; width: 100%; display: block;" src="upload/<%=article.getQnaBoard_file() %>" alt="image">
                <%}{} %>
                <div class="card-body">
                
                  <p class="card-text"><%=article.getQnaBoard_content() %></p>
                </div>
                
                
                <ul class="list-group list-group-flush">
           
                  <li class="list-group-item">
                  첨부파일 : 
                  <a href="qnaboardfiledowun.bo?file_name=<%=article.getQnaBoard_file()%>"> <%=article.getQnaBoard_file() %>
                  </li></a>
                </ul>
                <div class="card-footer text-muted">
                 <%=article.getQnaBoard_date() %>  
                 <br>
                  <a href="qnawrite.bo" class="card-link">추가 질문</a>
                  <a href="qnaBoardlist.bo?page=<%=nowPage%>" class="card-link">목록</a>
                   <a href="qnawritemodifyform.bo?qnaboard_num=<%=article.getQnaBoard_num() %>&page=<%=nowPage %>" class="card-link">수정</a>
                   <a href="qnaBoardDeleteform.bo?qnaBoard_num=<%=article.getQnaBoard_num() %>&page=<%=nowPage %>" class="card-link">삭제</a>
                </div>
              </div>
              </div>
              </div>
              
              
   
              
              <div class="col-lg-4">
            <div class="bs-component">
              <div class="card mb-3">
              
              
              <%if(id.equals("admin")){%>
                <form action="qnaBoardReplyPro.bo" method="get" name="boardform">
                <h3 class="card-header">관리자 답변</h3>
                <input type="hidden" value="<%=article.getQnaBoard_num()%>" name="qnaBoard_num">
                  <input type="hidden" value="<%=nowPage%>" id="page">
                <div class="card-body">
                    <textarea name="qnaBoard_reply" class="form-control" name="qnaBoard_reply" rows="4"><%if(article.getQnaboard_reply()!=null){ %>
                    <%=article.getQnaboard_reply() %>
                    <%}{} %>
                    </textarea>
                </div>
        		  <ul class="list-group list-group-flush">
                  <li class="list-group-item">
                <div class="card-body" style="text-align: center;">
                 <input type="submit" value="답변등록">
                </div>
                  </li>
                </ul>
                </form>
           
           
                <%}else{ %>
                <h3 class="card-header">관리자 답변</h3>
                <input type="hidden" value="<%=article.getQnaBoard_num()%>" name="qnaBoard_num">
                  <input type="hidden" value="<%=nowPage%>" id="page">
                <div class="card-body">
                    <textarea name="qnaBoard_reply" class="form-control" name="qnaBoard_reply" rows="4" readonly="readonly"><%if(article.getQnaboard_reply()!=null){ %>
                    <%=article.getQnaboard_reply()%>
                    <%}{} %>
                    </textarea>
                </div>
        		  <ul class="list-group list-group-flush">
              
                </ul>
                <%}%>
                
                
                
                <div class="card-footer text-muted">
                 <%=article.getQnaBoard_reply_date()%>
                </div>
              </div>
              </div>
              </div>
              
           
              
			
</body>
</html>
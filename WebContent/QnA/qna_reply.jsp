<%@page import="qna.vo.qnaBoardbean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	qnaBoardbean article=(qnaBoardbean)request.getAttribute("article");
    String nowPage = (String)request.getAttribute("page");
%>

     <%String sid=(String)session.getAttribute("id"); %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
  <link href="QnA/QnA11/bootstrap.css" rel="stylesheet">
 <link href="QnA/QnA11/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<!-- 게시판 답변 -->

	<section id="writeForm">
		<form action="qnaBoardReplyPro.bo" method="post" name="qnaBoardform">

			<input type="hidden" name="page" value="<%=nowPage %>" /> 
			<input type="hidden" name="qnaBoard_num" value="<%=article.getQnaBoard_num() %>">
			<input type="hidden" name="qnaBoard_re_ref" id="qnaBoard_re_ref"
				value="<%=article.getQnaBoard_re_ref() %>"> <input
				type="hidden" name="qnaBoard_re_lev"   id="qnaBoard_re_lev"
				value="<%=article.getQnaBoard_re_lev() %>"> <input
				type="hidden" name="qnaBoard_re_seq" id="qnaBoard_re_seq"
				value="<%=article.getQnaBoard_re_seq()%>">
			<input type="hidden" name="qnaBoard_id"id="qnaBoard_id"  value="<%=article.getQnaBoard_id()%>" readonly="readonly"/>
			
			
<div class="bs-docs-section">
        <div class="row">
          <div class="col-lg-12">
            <div class="page-header">
              <h1 id="forms">1:1 Inquiry Answer</h1>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-6">
            <div class="bs-component">
 
                <fieldset>
                
                 <div class="form-group">
                <label class="col-form-label" for="inputDefault">Member ID</label>
                
				<input type="text" name="qnaBoard_subject" class="form-control"
						id="qnaBoard_subject" value="<%=article.getQnaBoard_id() %>님! 답변입니다."/>
             		</div>
			
						  <div class="form-group">
                    <label for="exampleTextarea">원본글</label>
                    <textarea name="qnaBoard_content2" class="form-control" id="qnaBoard_content2" rows="3">
							<%=article.getQnaBoard_content() %>
							</textarea>
						</div>
			
			
			  <div class="form-group">
                    <label for="exampleTextarea">답 변</label>
                    <textarea name="qnaBoard_content" class="form-control" id="qnaBoard_content" rows="3">
         
			
							
							</textarea>
						</div>
			
		
	
				<input type="submit" value="답변글등록" class="btn btn-primary"/>&nbsp;&nbsp; <input
					type="button" value="다시작성" class="btn btn-primary" onclick="history.back(-1);" />

			</fieldset>
			</div>
			</div>
			</div>
			</div>
			
			
			
			
			
			
			
			
			
		</form>
	</section>
</body>
</html>
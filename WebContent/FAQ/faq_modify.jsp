<%@page import="faq.vo.faqBoardbean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%String id = (String)session.getAttribute("id"); 
     	if(!(id.equals("admin"))){
		%>
	<script type="text/javascript">
	  alert("admin만 작성가능합니다.")
	window.close();
	</script>
		
	<% }%>
	
	<%faqBoardbean article = (faqBoardbean)request.getAttribute("article"); 
  String nowPage = (String)request.getAttribute("page");%>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

 <link href="QnA/QnA11/bootstrap.css" rel="stylesheet">
 <link href="QnA/QnA11/bootstrap.min.css" rel="stylesheet">
 


<form action="faqmodifypro.fbo" method="post" name="boardform">
 
 
 
<div class="bs-docs-section">
        <div class="row">
          <div class="col-lg-12">
            <div class="page-header">
              <h1 id="forms">FAQ수정</h1>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-6">
            <div class="bs-component">
 
                <fieldset>

                <div class="form-group">
                <label class="col-form-label" for="inputDefault">Subject</label>
                <input type="text" name="faqBoard_subject" class="form-control" value="<%=article.getFaqboard_subject()%>">
              	<input type="hidden" name="faqBoard_num" id="faqBoard_num" value="<%=article.getFaqboard_num()%>">
            	<input type="hidden" name="page" id="page" value="<%=nowPage%>">
              </div>


                  <div class="form-group">
                    <label for="exampleSelect1">Tag select</label>
                    <select class="form-control" name="tag">
                    <option value="인수/반납">인수/반납</option>
                    <option value="대여안내">대여안내</option>
                    <option value="보험 및 사고">보험 및 사고</option>
                    <option value="결제/취소">결제/취소</option>
                    <option value="사이트이용">사이트이용</option>
                    </select>
                  </div>
              
                  <div class="form-group">
                    <label for="exampleTextarea">Substance</label>
                    <textarea name="faqBoard_content" class="form-control" id="qnaBoard_content" rows="3"><%=article.getFaqboard_content() %></textarea>
                  </div>
                  
                  <button type="submit" class="btn btn-primary">수정</button>
                  <button type="button" class="btn btn-primary" onClick ="javascript:history.go(-1)" >취소</button>
                </fieldset>
      
            </div>
          </div>
     </div>
     </div>
     </form>

           


</body>
</html>
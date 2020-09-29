
<%@page import="book.vo.BookBean"%>
<%@page import="qna.vo.pageinfo"%>
<%@page import="member.vo.MemberBean"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%
    	ArrayList<BookBean> bookList = (ArrayList<BookBean>) request.getAttribute("bookList");

        
        
        // 	pageinfo pageiInfo = (pageinfo)request.getAttribute("pageInfo");
	

// 	int listCount = pageiInfo.getListcount();
// 	int nowPage = pageiInfo.getPage(); 
// 	int startPage = pageiInfo.getStartpage();
// 	int endPage = pageiInfo.getEndpage();
// 	int maxPage = pageiInfo.getMaxpage();
	
%>  
<!DOCTYPE html>
<html>
 <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Admin</title>
        <link href="Admin/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
     <link href="QnA/QnA11/bootstrap.css" rel="stylesheet">
 <link href="QnA/QnA11/bootstrap.min.css" rel="stylesheet">
   <script src="js/jquery-3.5.1.js">
</script>
<script type="text/javascript">
    $(document).ready(function(){
        setDateBox();
    });    
 
    // select box 연도 , 월 표시
    function setDateBox(){
        var dt = new Date();
        var year = "";
        var com_year = dt.getFullYear();
        // 발행 뿌려주기
        $("#YEAR").append("<option value=''>년도</option>");
        // 올해 기준으로 -1년부터 +5년을 보여준다.
        for(var y = (com_year-1); y <= (com_year+2); y++){
            $("#YEAR").append("<option value='"+ y +"'>"+ y + " 년" +"</option>");
        }
        // 월 뿌려주기(1월부터 12월)
        var month;
        $("#MONTH").append("<option value=''>월</option>");
        for(var i = 1; i <= 12; i++){
			var mo=i;
            $("#MONTH").append("<option value='"+ i +"'>"+ i + " 월" +"</option>");
       		
        }
       
        
    }
 
</script>
   
   
    </head>
    
    <jsp:include page="/inc/topleft.jsp"></jsp:include>
    
    
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">Selling List</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="main.ad">ADMIN MAIN</a></li>
                            <li class="breadcrumb-item active">Car Selling List</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                수정할거 -  특정조건 검색 / 상태 null 미결제로 구분  / 영수증
                                <a target="_blank" href="#">official DataTables documentation</a>
                                .
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1" style="float: left; margin-top: 10px;"></i>
         
       <form action="sellinglist.ad">
            <select class="custom-select" style="width: 100px;" name="YEAR" id="YEAR" title="년도" class="select w80"></select>    
            <select class="custom-select" style="width: 100px;" name="MONTH" id="MONTH" title="월" class="select w80"></select>
  				<button type="submit" id="btn" name="btn" class="btn btn-outline-secondary" style="height: 35px; font-size: 12px; line-height: 10px;" >선택</button>      
                       
                         </form>       
                             
                            </div>
	   <form action="qnaSearchPro.fbo" class="form-inline my-2 my-lg-0">
                            <div class="card-body">
                                <div class="table-responsive">
                                
                                     <div style="float: right; padding-bottom: 10px;">
       <select class="custom-select" style="width: 100px; margin-right: 5px;">
      <option selected="">Search</option>
      <option value="1">IDX</option>
      <option value="2">NAME</option>
      <option value="3">Car_N</option>
       <option value="4">Satus</option>
    </select>
      <input name="search" id="search" class="form-control mr-sm-2" type="text" placeholder="Search" >
      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
    
    </form>
     </div>
     
 	<%if(bookList != null) {%>
      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
      
     
                                        
                                            <tr>
                                            
                                            
             <th>선택년월 
      
             </th>
<!--              booknum -->
   			<th colspan="2">전월비교 증감세 추이 </th>
    	 		<th>총 건수</th>
    	 		
     		<th>총 매출액</th>

                             
                                                
                                            </tr>
                                        </thead>
                                        <tfoot>
         		<%
// 					if (bookList != null) {
// 					for (BookBean book : bookList) {
				%>
				<tr>
				<td rowspan="3">
				<div id="selectyear" style="text-align: center; line-height: 100px;">
				<%if((request.getAttribute("year")!=null)){ %>
				<b><%=request.getAttribute("year") %> 년
               <%=request.getAttribute("month") %> 월</b>
               <%}else{ %>
               	선택없음
               <%} %>
               </div>
				</td>
					<td style="text-align: right;">
				<%
				int score2 = ((Integer)request.getAttribute("c2")).intValue();
				%>
				
				<%int fs = ((Integer)request.getAttribute("fs")).intValue();
				//미수 금액
				int sum = ((Integer)request.getAttribute("sum")).intValue();
				//이번달 총액
				%>
				<%=score2 %> 
				
				<%if((request.getAttribute("year")!=null&&
				request.getAttribute("month")!=null)){ %>
					<%if(score2==0){%>	
					 	전달 매출 대비  <B> <%=score2 %> % </B> 건수 변동없음
					 <%}else if(score2>0){%>
					 	전달 건수 대비 <a style="color: blue;"> <B> <%=score2 %> %  증가 </B></a>
					 <%}else{%>
					 	전달 건수 대비  <a style="color: red;"> <B> <%=score2 %> % 감소</B> </a>
					 <%} %>
			 
				<div style="font-size: 7px;">
				(전달건수-이번달건수/이번달건수)*100
				</div>
               <%}else{ %>
               	선택없음
               <%} %></td>
				<td style="text-align: right;">
				<%
				int score1 = ((Integer)request.getAttribute("c")).intValue();
				%>
				
				<%if((request.getAttribute("year")!=null&&
				request.getAttribute("month")!=null)){ %>
					<%if(score1==0){%>	
					 	전달 매출 대비  <B> <%=score1 %> % </B> 매출 변동없음
					 <%}else if(score1>0){%>
					 	전달 매출 대비 <a style="color: blue;"> <B> <%=score1 %> %  증가 </B></a>
					 <%}else{%>
					 	전달 매출 대비  <a style="color: red;"> <B> <%=score1 %> % 감소</B> </a>
					 <%} %>
			 
				<div style="font-size: 7px;">
				(전달매출-이번달매출/이번달매출)*100
				</div>
               <%}else{ %>
               	선택없음
               <%} %></td>
               
					<td style="text-align: right;"><%if((request.getAttribute("year")!=null&&
				request.getAttribute("month")!=null)){ %>
				<%=request.getAttribute("count") %> 건
               <%}else{ %>
               	선택없음
               <%} %></td>
				<td style="text-align: right;"><%if((request.getAttribute("year")!=null&&
				request.getAttribute("month")!=null)){ %>
				<b><%=request.getAttribute("sum") %> 원</b>
               <%}else{ %>
               	선택없음
               <%} %></td>

			</tr>
					
			<tr>
			<th>해당월 미수금</th>
			<th>해당월 미수율</th>
			<th>해당월 미수 총 건</th>
			<th>실제입금액</th>
			</tr>
			
			
			<tr>
			<td style="text-align: right;"><%if((request.getAttribute("year")!=null&&
				request.getAttribute("month")!=null)){ %>
				<%=request.getAttribute("fs") %> 원
               <%}else{ %>
               	선택없음
               <%} %></td>
               
               	<td style="text-align: right;">
			<%if((request.getAttribute("year")!=null&&
				request.getAttribute("month")!=null
				)){ %>
				<%if(fs==0||sum==0){ %>
				<%fs=0; sum=0; %>
				<%}else{ %>
				<%int dd= (fs*100/sum*100);%> 
				<b><%=dd/100%> %</b>
				(<%=fs %>/<%=sum %>*100)
				<%} %>
               <%}else{ %>
               	선택없음
               <%} %></td>
               
<!--                	<td style="text-align: right;"> -->
<%--                	<%if((request.getAttribute("year")!=null&& --%>
<%-- 				request.getAttribute("month")!=null)){ %> --%>
<%-- 					<%int dd= (fs*100/sum*100);%> --%>
<%-- 					 	<%=dd %> --%>
<%-- 					 <%}else{%> --%>
<!-- 					 	선택없음 -->
<%-- 					 <%} %> --%>
<!-- 					 </td> -->
               
			<td style="text-align: right;">
			<%if((request.getAttribute("year")!=null&&
				request.getAttribute("month")!=null)){ %>
				<%=request.getAttribute("f") %> 건
               <%}else{ %>
               	선택없음
               <%} %></td>
               
		<td style="text-align: right;">
			<%if((request.getAttribute("year")!=null&&
				request.getAttribute("month")!=null)){ %>
				<b style="border-bottom: 2px solid #b0e0e6; box-shadow: inset 0 -1px 0 #b0e0e6;"><%=sum-fs %> 원</b>
               <%}else{ %>
               	선택없음
               <%} %></td>
			
			
		
			</tr>
			

                                        </tbody>
                                    </table>
<%} else {%>
	<section id="emptyArea">등록된 글이 없습니다.</section>
<%} %>     
     
     
     
     
     
     
     
     
     
     
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
      
     
                                        
                                            <tr>
                                            
                                            
             <th>NO. </th>
<!--              booknum -->
    	 		<th>ID</th>
    	 		
     		<th>BookDate<img src="img/2.png" style="width: 12px;"> </th>
     		<th style="white-space: nowrap;">대여일 <img src="img/2.png" style="width: 12px;"></th>
     		<th style="white-space: nowrap;">반납일<img src="img/2.png" style="width: 12px;"></th>
     		<th>차량번호</th>
     		<th>결제금액</th>
   
   
     		<th style="white-space: nowrap; width: 100px;">

        <a data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" style="color: black;">현재상태 <img src="img/3.png" style="width: 12px;"></a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="#">대기</a>
           <a class="dropdown-item" href="#">대여</a>
          <a class="dropdown-item" href="#">반환</a>

        </div>

     		</th>	
     		
     		<th style="width: 100px;">
     		영수
     		</th>
     		
                                                
                                                
                                                
                                            </tr>
                                        </thead>
                                        <tfoot>
         		<%
					if (bookList != null) {
					for (BookBean book : bookList) {
				%>
				<td width="100"><%=book.getBook_num()%></td>
				<td width="200"><%=book.getMember_id()%></td>
				<td width="150"><%=book.getBook_date()%></td>
				<td width="150"><%=book.getPickup_date()%></td>
				<td width="100"><%=book.getEnd_date()%></td>
				<td width="100"><%=book.getCar_id()%></td>
				<td width="300" style="text-align: right;"><%=book.getBook_price()%></td>
				
				
				<td style="text-align: center;">
				<%if(book.getBook_state()==1){ %>
				<span class="badge badge-pill badge-danger">대여</span>
				<%}else{ %>
				<span class="badge badge-pill badge-warning">반환</span>
				<%} %>
				
				</td>
				
			<td style="text-align: center;">
			<span class="badge badge-dark">발행</span>
			</td>
			
		</tr>
			</tfoot>	
<%}}%>

                                        </tbody>
                                    </table>
                                    
   
   
                
                                    
                                    
  
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                
                



            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="Admin/js/scripts.js"></script>
<!--         <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script> -->
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="Admin/assets/demo/datatables-demo.js"></script>
    </body>
    
    


</html>

<%@page import="qna.vo.pageinfo"%>
<%@page import="member.vo.MemberBean"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%
	ArrayList<MemberBean> articleList = (ArrayList<MemberBean>)request.getAttribute("articlelist");
	pageinfo pageiInfo = (pageinfo)request.getAttribute("pageInfo");
	

	int listCount = pageiInfo.getListcount();
	int nowPage = pageiInfo.getPage(); 
	int startPage = pageiInfo.getStartpage();
	int endPage = pageiInfo.getEndpage();
	int maxPage = pageiInfo.getMaxpage();
	
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
   
   
   
    </head>
    
    <jsp:include page="/inc/topleft.jsp"></jsp:include>
    
    
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">Member Management</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.html">ADMIN MAIN</a></li>
                            <li class="breadcrumb-item active">Member</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                수정할거 -/ 정렬 / 찾기 / 횟수  금액 
                                <a target="_blank" href="#">official DataTables documentation</a>
                                .
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                Member List
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
      
     
                                        
                                            <tr>
                                            
                                            
             <th>IDX </th>
    	 		<th>ID</th>
     		<th>PASS</th>
     		<th style="white-space: nowrap;">NAME <img src="img/2.png" style="width: 12px;"></th>
     		<th style="white-space: nowrap;">AGE<img src="img/2.png" style="width: 12px;"></th>
     		<th>F/M</th>
     		<th>TEL</th>
     		<th>ADRESS</th>
     		<th>E-MAIL</th>		
     		<th>LICENSE</th>
     		<th>OPTION</th>
     		<th style="white-space: nowrap;">횟수 <img src="img/2.png" style="width: 12px;"></th>	
     		<th style="white-space: nowrap;">금액 <img src="img/2.png" style="width: 12px;"></th>	
     		<th style="white-space: nowrap;">
     		
  

 
        <a data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" style="color: black;">GRADE <img src="img/3.png" style="width: 12px;"></a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="#">일반/NEW</a>
          <a class="dropdown-item" href="#">SILVER</a>
          <a class="dropdown-item" href="#">GOLD</a>
           <a class="dropdown-item" href="#">VIP</a>
        </div>
 
 
  
     		
     		</th>	
     		  <th>
 				관리
      		</th>
                                                
                                                
                                                
                                            </tr>
                                        </thead>
                                        <tfoot>
          <%if(articleList != null & listCount > 0) {%>
			<%for(int i = 0; i < articleList.size(); i++) {%>
			
				<tr>
					<th scope="row">
					<%=articleList.get(i).getMember_num()%>	
					</th>
					
				
			<td>
			<%=articleList.get(i).getMember_id() %>
			</td>
					
				<td>
			<%=articleList.get(i).getMember_pass() %>
			</td>
			<td>
			<%=articleList.get(i).getMember_name() %>
			</td>
			<td>
			<%=articleList.get(i).getMember_age() %>
			</td>
			<td>
			<%=articleList.get(i).getMember_gender() %>
			</td>
			<td>
			<%=articleList.get(i).getMember_tel() %>
			</td>
			<td>
			<%=articleList.get(i).getMember_adress() %>
			</td>
			<td>
			<%=articleList.get(i).getMember_email() %>
			</td>
		<td>
			<%=articleList.get(i).getMember_license() %>
			</td>
			
			<td>

			<%if(articleList.get(i).getMember_smoke()!=null){ %>
			S <input type="checkbox" name="check" checked="checked">
			<%}else if(articleList.get(i).getMember_smoke()==null){ %>
			S <input type="checkbox" name="check">
				<%} %>
			
			<%if(articleList.get(i).getMember_pet()!=null){ %>
			P <input type="checkbox" name="check" checked="checked">
			<%}else if(articleList.get(i).getMember_pet()==null){ %>
			P <input type="checkbox" name="check" >
				<%} %>
	
				<%if(articleList.get(i).getMember_boby()!=null){ %>
			B <input type="checkbox" name="check" checked="checked">
			<%}else if(articleList.get(i).getMember_boby()==null){ %>
			B <input type="checkbox" name="check">
			<%} %>
		
			</td>
			
			
			<td>
			
			</td>
			
			<td>
			
			</td>
			
			<td>
			<%=articleList.get(i).getMember_grade() %>
			</td>
					
					
					
					
					
					<td style="white-space: nowrap;">
					<a href="mmmodify.ad?member_id=<%=articleList.get(i).getMember_id()%>&page?=<%=nowPage%>"><span class="badge badge-pill badge-warning">수정</span></a>
					
					<a onclick="removeCheck(<%=articleList.get(i).getMember_num()%>)">
					<span class="badge badge-pill badge-danger">삭제</span></a>
					<input type="hidden" name="page" value="<%=nowPage%>">
			
					</td>
					
				</tr>				
<%}%>

                                        </tbody>
                                    </table>
                                    
        <div style="float: right;">
	   <form action="MemberSelectList.ad" class="form-inline my-2 my-lg-0">
       <select class="custom-select" style="width: 100px; margin-right: 5px;"name="search1">
      <option selected="">Search</option>
      <option value="1">ID</option>
      <option value="2">NAME</option>
    </select>
      <input name="search2" id="search" class="form-control mr-sm-2" type="text" placeholder="Search" >
      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
    </form>
    </div>
                
                                    
                                    
    <section id="pageList">
	<ul class="pagination pagination-sm">
	
	<%if(nowPage <= 1) { %>
			 <li class="page-item disabled">
      <a class="page-link" href="#">&laquo;</a>
    </li>
	<%} else {%>
	   <li class="page-item disabled">
			<a href="MemberList.ad?page=<%=nowPage - 1%>" class="page-link">&laquo;</a>&nbsp;
			</li>
	<%} %>
	
	<%for(int i = startPage; i <= endPage; i++) {
		    if(i == nowPage) {%>
				 <li class="page-item active">
      <a class="page-link" href="#"><%=i %></a>
		<%} else {%>
		 <li class="page-item active">
				<a href="MemberList.ad?page=<%=i %>" class="page-link"><%=i %></a>&nbsp;
		<%} %>
	<%} %>
	
	<%if(nowPage >= maxPage) {%>
			  <li class="page-item">
      <a class="page-link" href="#">&raquo;</a>
	<%} else { %>
	<li class="page-item">
			<a href="MemberList.ad?page=<%=nowPage + 1%>" class="page-link">&raquo;</a>
	<%} %>
	
	  </li>
  </ul>
	</section>
<%} else {%>
	<section id="emptyArea">등록된 글이 없습니다.</section>
<%} %>
                                    
                                    
                                        
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
    
    
   <script type="text/javascript">
<!--

//-->


function removeCheck(idx) {

	
 if (confirm("정말 삭제하시겠습니까??") == true){    //확인

	 location.href="mmdelete.ad?table=member&&idx="+idx ;


 }else{   //취소

     return false;

 }
 
 

}

</script>

</html>
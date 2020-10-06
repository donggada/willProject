<%@page import="info.vo.pageinfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="info.vo.ListBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ListBean lb = (ListBean)request.getAttribute("bean");
    	ArrayList<ListBean> list = (ArrayList<ListBean>)request.getAttribute("list");
    	pageinfo pagecheck = (pageinfo)request.getAttribute("pageinfo");
    	int checkNum = 0;
    	int listCount = pagecheck.getListcount();
    	int nowPage = pagecheck.getPage(); 
    	int startPage = pagecheck.getStartpage();
    	int endPage = pagecheck.getEndpage();
    	int maxPage = pagecheck.getMaxpage();
    	if((request.getParameter("page") != null))
    	{
    			checkNum = Integer.parseInt(request.getParameter("page"));
    			
        	if(checkNum != 1)
        	{
        		checkNum = startPage * 10;
        	}
        	else if(checkNum == 1)
        	{
        		checkNum = 0;
        	}
    	}

    %>
<!DOCTYPE html>
<html>
<script src="js/jquery-3.5.1.js"></script>
<script type="text/javascript">

 function updatepage() {
	 document.getElementById('info_form').submit();
}

 function onClickUpdate() {
	 var button_name = document.getElementById('info_name'); 
	 var button_age = document.getElementById('info_age'); 
	 var button_tel = document.getElementById('info_tel'); 
	 var btn = document.createElement("BUTTON");
	 
	 	button_name.disabled = false; 
	 	button_age.disabled = false; 
	 	button_tel.disabled = false;
	 	
	 document.getElementById('update').value = "취소";
	 document.getElementById('update').onclick = cancel;
	 btn.innerHTML = "수정완료";
	 btn.id = 'updatebtn';
	 document.getElementById('button').appendChild(btn);
	 btn.onclick = updatepage;
}
 function cancel() {
	 var button_name = document.getElementById('info_name'); 
	 var button_age = document.getElementById('info_age'); 
	 var button_tel = document.getElementById('info_tel'); 
	 var checkupdate = document.getElementById('updatebtn'); 
	 
	 	button_name.disabled = true; 
	 	button_age.disabled = true; 
	 	button_tel.disabled = true;
	 	
		 document.getElementById('update').value = "수정하기";
		 checkupdate.remove();
		 document.getElementById('update').onclick = onClickUpdate; 
}
</script>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
<p>개인 정보</p>
<form action="UpdateInfo.if" id="info_form" method="post">
<table border="1">
<tr>
<th>아이디</th><td><%=lb.getId() %></td>
<th>이름</th><td><input type="text" name="name" id="info_name" value="<%=lb.getName() %>" disabled></td>
<th>나이</th><td><input type="text" name="age" id="info_age" value="<%=lb.getAge() %>" disabled></td>
</tr>
<tr>
<th>성별</th><td><%=lb.getGender() %></td>
<th>전화번호</th><td><input type="text" name="tel" id="info_tel" value="<%=lb.getTel() %>" disabled></td>
<th>주소</th><td><%=lb.getAddress() %></td>
<th>이메일</th><td><%=lb.getEmail() %></td>
</tr>
<tr>
<th>면허증</th><td><%=lb.getLicense() %></td>
<th>흡연여부</th><td><%=lb.getSmoke() %></td>
<th>애완동물</th><td><%=lb.getPet() %></td>
<th>아기</th><td><%=lb.getBaby() %></td>
</tr>
</table>
</form>
<div id='button'>
<input type="button" id="update" value="수정하기" onclick="onClickUpdate()">
</div>
<!-- ------------------------------------------------------------------------------------------------------- -->
<table>
<tr><th>멤버쉽 등급</th><td><%=lb.getGrade() %></td></tr>
</table>
<!-- ------------------------------------------------------------------------------------------------------- -->
<p>예약 현황</p>
<table border="1">
<tr>
<th>순번</th><th>예약일시</th><th>대여일</th><th>반납일</th><th>차량 아이디</th><th>가격</th>
</tr>
<%
if(list != null & pagecheck.getListcount() > 0)
{
for(int i =0; i < list.size(); i++)
{
%>
<tr>
<td><%=checkNum + (i+1) %></td>
<td><%=list.get(i).getBook_date() %></td>
<td><%=list.get(i).getPickup_date() %></td>
<td><%=list.get(i).getEnd_date() %></td>
<td><%=list.get(i).getCar_id() %></td>
<td><%=list.get(i).getPrice() %>원</td>
</tr>
<%
}
%>
</table>
    <%if(nowPage<=1){ %>
    [이전]
    <%}else{ %>
        <a href="MemberInfo.if?page=<%=nowPage-1 %>">[이전]</a>
    <%} %>
    <%for(int a=startPage; a<=endPage; a++){ 
        if(a==nowPage){%>
            [<%=a %>]
    <%} else { %>
        <a href="MemberInfo.if?page=<%=a %>">[<%=a %>]</a>
        <%} %>    
    <%} %>
    <%if(nowPage>=maxPage){ %>
        [다음]
    <%}else{ %>    
        <a href="MemberInfo.if?page=<%=nowPage+1 %>">[다음]</a>
    <%} %>
	<%}else{
	%>등록된 글이 없습니다.
	<%} %>
</body>
</html>












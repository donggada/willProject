<%@page import="review.vo.PageInfo"%>
<%@page import="review.vo.ReviewBean"%>
<%@page import="qna.vo.qnaBoardbean"%>
<%@page import="admin.vo.CarBean"%>
<%@page import="member.vo.MemberBean"%>
<%@page import="qna.vo.pageinfo" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="QnA/QnA11/bootstrap.css" rel="stylesheet">
 <link href="QnA/QnA11/bootstrap.min.css" rel="stylesheet">

<style>
li{
   list-style:none;
   padding-left:0px;
   }
 .wrap:after{clear: both; content: ""; display: block;}
.wrap> div {float: left; height: 100%;}
.left{width: 20%;}
.right{width: 80%;}   
</style>
</head>
<%
ArrayList<MemberBean> MemberList=(ArrayList)request.getAttribute("MemberList");
ArrayList<qnaBoardbean> articleList = (ArrayList<qnaBoardbean>)request.getAttribute("articlelist");
ArrayList<ReviewBean> ReviewList = (ArrayList<ReviewBean>)request.getAttribute("ReviewList");
pageinfo pageInfo = (pageinfo)request.getAttribute("pageInfo");
ArrayList<CarBean> CarList=(ArrayList)request.getAttribute("CarList");
ArrayList<CarBean> cb=(ArrayList<CarBean>)request.getAttribute("cb");
ArrayList target=new ArrayList();
ArrayList count= new ArrayList();
if(cb!=null){
for(int i = 0; i < cb.size(); i++){
	target.add("'"+cb.get(i).getCar_maker()+"'");
	count.add(cb.get(i).getCar_id());
}
}
%>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<body>
<div class="wrap">
 <div class="left">
 <ol>
      <li>
        회원 관리
        <ol>
          <a href="MemberList.ad"><li>회원 리스트 조회</li></a>
        
        </ol>
      </li>
      <li>
        차량 관리
        <ol>
        <a href="CarList.ad"><li>차량조회</li></a>
        <a href="#"><li>차량등록 및 삭제</li></a>
        </ol>
      </li>
      <li>
        예약 관리
        <ol>
          <li>회원예약관리</li>
          <li>차량예약관리</li>
          <li>Dolor</li>
        </ol>2
      </li>
      <li>
        게시판관리
        <ol>
          <li>공지사항<li>
          <a href="QnABoard.ad"><li>Q&A</li></a>
          <a href="ReviewList.rw?Member_id=admin"><li>Review 게시판</li></a>
        </ol>
      </li>
      <li>
       Graph
        <ol>
        <a href="GraphPro.ad?target1=car_maker"><li>제조사별</li></a>
        <a href="GraphPro.ad?target1=car_type"><li>종류별</li></a>
        <a href="GraphPro.ad?target1=car_name"><li>이름별</li></a>
        <a href="GraphPro.ad?target1=car_name&&target2=car_maker='Hyundai'"><li>Hyundai 차량</li></a>
        </ol>
      </li>
      
    </ol>
   
    </div>
    
   <div class="right">
  <%if(pageInfo!=null){
	  int listCount = pageInfo.getListcount();
	  int nowPage = pageInfo.getPage(); 
	  int startPage = pageInfo.getStartpage();
	  int endPage = pageInfo.getEndpage();
	  int maxPage = pageInfo.getMaxpage();
	  %>
 <section id="listForm">
 <%if(MemberList != null & listCount > 0) {  //회원리스트 조회 %>
		<h2>회원 리스트 조회</h2>
		<table>
			<tr id="tr_top">
				<td width="100">번호</td>
				<td width="400">이름</td>
				<td width="150">아이디</td>
				<td width="150">성별</td>
				<td width="100">회원등급</td>
			</tr>
		
			<!-- 게시물 목록이 하나라도 존재할 때만 목록을 표시 -->
			<%for(int i = 0; i < MemberList.size(); i++) {%>
				<tr>
					<td align="center"><%=MemberList.get(i).getIdx()%></td>
					<td align="center"><%=MemberList.get(i).getMember_name() %></td>	
					<td align="center"><%=MemberList.get(i).getMember_id() %></td>
					<td align="center"><%=MemberList.get(i).getMember_gender()%></td>
					<td align="center"><%=MemberList.get(i).getMember_grade() %></td>
				</tr>
			<%} %>
		</table>		
	</section>
	
	<!-- 페이지 목록 버튼 표시 -->
	<!-- 이전 페이지 또는 다음 페이지가 존재할 경우에만 해당 하이퍼링크 활성화 -->
	<section id="pageList">
	<%if(nowPage <= 1) { %>
			[이전]&nbsp;
	<%} else {%>
			<a href="MemberList.ad?page=<%=nowPage - 1%>">[이전]</a>&nbsp;
	<%} %>
	
	<!-- 존재하는 페이지 번호만 표시(현재 페이지는 번호만 표시하고, 나머지 페이지는 하이퍼링크 활성화) -->
	<%for(int i = startPage; i <= endPage; i++) {
		    if(i == nowPage) {%>
				[<%=i %>]&nbsp;
		<%} else {%>
				<a href="MemberList.ad?page=<%=i %>">[<%=i %>]</a>&nbsp;
		<%} %>
	<%} %>
	
	<%if(nowPage >= maxPage) {%>
			&nbsp;[다음]
	<%} else { %>
			<a href="MemberList.ad?page=<%=nowPage + 1%>">&nbsp;[다음]</a>
	<%} %>
	</section>
<%} else if(CarList != null & listCount > 0) {// 차량 조회 리스트%>
<section id="listForm">
		<h2>차량 조회</h2>
		<table class="table table-hover">
			<tr id="tr_top">
				<td scope="col" width="400">제조사</td>
				<td scope="col" width="150">차량종류</td>
				<td scope="col" width="150">차량이름</td>
			</tr>
		
			<!-- 게시물 목록이 하나라도 존재할 때만 목록을 표시 -->
			<%for(int i = 0; i < CarList.size(); i++) {%>
				<tr id="tr_top">
					 <td scope="row" align="center"><%=CarList.get(i).getCar_maker() %></td>	
					<td scope="row" align="center"><%=CarList.get(i).getCar_type()%></td>
					<td scope="row" align="center"><%=CarList.get(i).getCar_name()%></td>
				</tr>
			<%} %>
		</table>		
	</section>
	
	<!-- 페이지 목록 버튼 표시 -->
	<!-- 이전 페이지 또는 다음 페이지가 존재할 경우에만 해당 하이퍼링크 활성화 -->
	<section id="pageList" style="text-align: center; margin-left: auto; margin-right: auto;">
<div style="text-align: center; margin-left: auto; margin-right: auto;">
<ul class="pagination pagination-sm">
<%if(nowPage <= 1) { %>
	 <li class="page-item disabled">
<a class="page-link" href="#">&laquo;</a>
 </li>
<%} else {%>
	    <li class="page-item">
<a class="page-link" href="CarList.ad?page=<%=nowPage - 1%>">&laquo;</a>&nbsp;
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
<a class="page-link" href="CarList.ad?page=<%=i %>">
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
<a class="page-link" href="CarList.ad?page=<%=nowPage + 1%>">&raquo;</a>
</li>
<%} %>
</ul>
</div>
</section>
	<%}else if(articleList != null & listCount > 0){  //QnA 게시판 리스트%>
<section id="listForm">
		<h2>1:1 Inquiry list</h2>
	<table class="table table-hover">
			  <thead>
			<tr id="tr_top">
			<th scope="col">번호</th>
     		<th scope="col">구분</th>
      		<th scope="col">제목</th>
      		<th scope="col">답변유무 <a href="qnaBoardlist.bo?Member_id=admin">@@</a></th>
      		<th scope="col">작성일</th>
      		<th scope="col">조회수</th>
			</tr>
			</thead>
	 <tbody>
	 <%for(int i = 0; i < articleList.size(); i++) { %>
		
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
<a class="page-link" href="#" align="center">
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

<% }else if(ReviewList != null && listCount>0){  // 리뷰게시판 리스트%>
<table>
<tr>
 <td>번호</td>
 <td>제목</td>
 <td>작성자</td>
 <td>날짜</td>
 <td>조회수</td>
 <td>추천수</td>
 </tr>
 <%for(int i=0; i<ReviewList.size(); i++) {%>
 <tr>
 <td><%=ReviewList.get(i).getReview_num() %></td>
 <td><a href="ReviewDetail.rw?review_num=<%=ReviewList.get(i).getReview_num() %>&page=<%=nowPage %>"><%=ReviewList.get(i).getReview_subject() %></a></td>
 <td><%=ReviewList.get(i).getMember_id() %></td>
 <td><%=ReviewList.get(i).getReview_date() %></td>
 <td><%=ReviewList.get(i).getReview_readcount() %></td>
 <td><%=ReviewList.get(i).getReview_recocount() %></td>
 </tr>
 <%
    }
 %>
</table>

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
<% }
 //else if end
else {%>
	<section id="emptyArea">등록된 글이 없습니다.</section>
	<section id="writeButton" style="float: right;">
	</section>
	
<%} %>






<%} //첫 i
  else {%>
<canvas id="pieChart" width=500 height=500></canvas>
<script type="text/javascript">
var target=<%=target%>
var targetcount=<%=count%>

var data = {
	    datasets: [{
	        data: targetcount,
	        backgroundColor: [
	        	'rgba(255, 99, 132, 1)',
				'rgba(54, 162, 235, 1)',
				'rgba(255, 206, 86, 1)',
				'rgba(75, 192, 192, 1)',
				'rgba(153, 102, 255, 1)',
				'rgba(255, 159, 64, 1)'
	        ],
	        label: 'My dataset' // for legend
	    }],
	    labels: target
	};

	var pieOptions = {
			maintainAspectRatio: false,
	  events: false,
	  animation: {
	    duration: 500,
	    easing: "easeOutQuart",
	    onComplete: function () {
	      var ctx = this.chart.ctx;
	      ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontFamily, 'normal', Chart.defaults.global.defaultFontFamily);
	      ctx.textAlign = 'center';
	      ctx.textBaseline = 'bottom';

	      this.data.datasets.forEach(function (dataset) {

	        for (var i = 0; i < dataset.data.length; i++) {
	          var model = dataset._meta[Object.keys(dataset._meta)[0]].data[i]._model,
	              total = dataset._meta[Object.keys(dataset._meta)[0]].total,
	              mid_radius = model.innerRadius + (model.outerRadius - model.innerRadius)/2,
	              start_angle = model.startAngle,
	              end_angle = model.endAngle,
	              mid_angle = start_angle + (end_angle - start_angle)/2;

	          var x = mid_radius * Math.cos(mid_angle);
	          var y = mid_radius * Math.sin(mid_angle);

	          ctx.fillStyle = '#fff';
	          if (i == 3){ // Darker text color for lighter background
	            ctx.fillStyle = '#444';
	          }
	          var percent = String(Math.round(dataset.data[i]/total*100)) + "%";  
	         var count=String(dataset.data[i])+"대";
	          //Don't Display If Legend is hide or value is 0
	          if(dataset.data[i] != 0 && dataset._meta[0].data[i].hidden != true) {
	        	ctx.fillText(target[i], model.x + x, model.y + y-15);
	            ctx.fillText(count, model.x + x, model.y + y);
	            // Display percent in another line, line break doesn't work for fillText
	            ctx.fillText(percent, model.x + x, model.y + y + 15);
	          }
	        }
	      });               
	    }
	  }
	};

	var pieChartCanvas = document.getElementById('pieChart');
	var pieChart = new Chart(pieChartCanvas, {
	  type: 'doughnut', // or doughnut
	  data: data,
	  options: pieOptions
	});

</script>


	  
 <%}%>
	</div>
    </div>
</body>






</html>
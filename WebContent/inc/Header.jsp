<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String ip = request.getRemoteAddr();
%>
<!--== Header Area Start ==-->
<header id="header-area" class="fixed-top">
	<!--== Header Top Start ==-->
	<div id="header-top" class="d-none d-xl-block">
		<div class="container">
			<div class="row">
				<!--== Single HeaderTop Start ==-->
				<div class="col-lg-3 text-left">
					<i class="fa fa-map-marker"></i> S.Kor Jejudo
				</div>
				<!--== Single HeaderTop End ==-->

				<!--== Single HeaderTop Start ==-->
				<div class="col-lg-3 text-center">
					<i class="fa fa-mobile"></i> +82 051 264 2222
				</div>
				<!--== Single HeaderTop End ==-->

				<!--== Single HeaderTop Start ==-->
				<div class="col-lg-3 text-center">
					<i class="fa fa-clock-o"></i> Open Throughout The Year
				</div>
				<!--== Single HeaderTop End ==-->

				<!--== Social Icons Start ==-->
				<div class="col-lg-3 text-right">
					<div class="header-social-icons">
						<%
						String id=(String)request.getAttribute("Member_id");
						String snsid=(String)request.getAttribute("Member_snsid");
						if(id == null)
						{
						session.setAttribute("snsid",snsid);
						}
						else
						{
						session.setAttribute("id",id);
						}
						if (id == null && snsid == null) {
						%>
						<a href="LoginForm.me">로그인</a> | <a href="JoinForm.me">회원가입</a>
						<%
							}
						else{
						if (id != null) {
						%>
						<%-- 	<%=id %>님  |	<a href="member/qna_member_logout.jsp">로그아웃</a> | <a href="MemberList.me">회원리스트</a> --%>
						<%=id%>님 | <a href="MemberLogout.me">logout</a> | <a href="#">admin page</a>
						<%
							} else {
						%>
						<%=snsid%>님 | <a href="#">logout</a>
						<%
							}
						}
						%>
						<%
						if (ip.equals("0:0:0:0:0:0:0:1")) {
						%>
						<br><a href="" onclick="window.open('chat/admin.jsp','admin','width=750, height=750, resizable=no')">|관리자채팅</a>
						<%
							}
						%>
					</div>
				</div>
				<!--== Social Icons End ==-->

			</div>
		</div>
	</div>
	<!--== Header Top End ==-->

	<!--== Header Bottom Start ==-->
	<div id="header-bottom">
		<div class="container">
			<div class="row">
				<!--== Logo Start ==-->
				<div class="col-lg-4">
					<a href="index.jsp" class="logo"> <img
						src="assets/img/logo.png" alt="JSOFT">
					</a>
				</div>
				<!--== Logo End ==-->

				<!--== Main Menu Start ==-->
				<div class="col-lg-8 d-none d-xl-block">
					<nav class="mainmenu alignright">
						<ul>
							<li class="active"><a href="#">Home</a> <!--                                     <ul> -->
								<!--                                         <li><a href="index.jsp">Home 1</a></li> -->
								<!--                                     </ul> --></li>
							<li><a href="#">About</a></li>
							<li><a href="#">services</a></li>
							<li><a href="#">차량 소개</a>
								<ul>
									<li><a href="car-left-sidebar.html">Car Left Sidebar</a></li>
									<li><a href="car-right-sidebar.html">Car Right Sidebar</a></li>
									<li><a href="car-without-sidebar.html">Car Without
											Sidebar</a></li>
									<li><a href="car-details.html">Car Details</a></li>
								</ul></li>
							<li><a href="index.jsp">Pages</a>
								<ul>
									<li><a href="package.html">Pricing</a></li>
									<li><a href="qnaBoardlist.bo">QNA</a></li>
									<li><a href="faqlist.fbo">FAQ</a></li>
									<li><a href="gallery.html">Gallery</a></li>
									<li><a href="help-desk.html">Help Desk</a></li>
									<li><a href="login.html">Log In</a></li>
									<li><a href="register.html">Register</a></li>
									<li><a href="404.html">404</a></li>
								</ul></li>
							<li><a href="#">Review</a>
								<ul>
									<li><a href="ReviewList.rw">Blog Page</a></li>
									<li><a href="ReviewList.rw">Blog Details</a></li>
								</ul></li>
							<li><a href="contact.html">Contact</a></li>
						</ul>
					</nav>
				</div>
				<!--== Main Menu End ==-->
			</div>
		</div>
	</div>
	<!--== Header Bottom End ==-->
</header>
<script type="text/javascript">
 function logout() {
	 sessionStorage.clear();
	 alert("로그아웃");
	 location.href = "index.jsp";
}
</script>
<!--== Header Area End ==-->
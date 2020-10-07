<%@page import="book.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
    int listCount = pageInfo.getListCount();
    int nowPage = pageInfo.getPage();
    int maxPage = pageInfo.getMaxPage();
    int startPage = pageInfo.getStartPage();
    int endPage = pageInfo.getEndPage();
    %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--=== Favicon ===-->
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />

    <title>Cardoor - Car Rental HTML Template</title>

    <!--=== Bootstrap CSS ===-->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <!--=== Slicknav CSS ===-->
    <link href="assets/css/plugins/slicknav.min.css" rel="stylesheet">
    <!--=== Magnific Popup CSS ===-->
    <link href="assets/css/plugins/magnific-popup.css" rel="stylesheet">
    <!--=== Owl Carousel CSS ===-->
    <link href="assets/css/plugins/owl.carousel.min.css" rel="stylesheet">
    <!--=== Gijgo CSS ===-->
    <link href="assets/css/plugins/gijgo.css" rel="stylesheet">
    <!--=== FontAwesome CSS ===-->
    <link href="assets/css/font-awesome.css" rel="stylesheet">
    <!--=== Theme Reset CSS ===-->
    <link href="assets/css/reset.css" rel="stylesheet">
    <!--=== Main Style CSS ===-->
    <link href="style.css" rel="stylesheet">
    <!--=== Responsive CSS ===-->
    <link href="assets/css/responsive.css" rel="stylesheet">


    <!--[if lt IE 9]>
        <script src="//oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="loader-active">

    <!--== Preloader Area Start ==-->
    <div class="preloader">
        <div class="preloader-spinner">
            <div class="loader-content">
                <img src="assets/img/preloader.gif" alt="JSOFT">
            </div>
        </div>
    </div>
    <!--== Preloader Area End ==-->
    <jsp:include page="../inc/Header.jsp" />
    
    <!--== Page Title Area Start ==-->
    <section id="page-title-area" class="section-padding overlay">
        <div class="container">
            <div class="row">
                <!-- Page Title Start -->
                <div class="col-lg-12">
                    <div class="section-title  text-center">
                        <h2>차량소개</h2>
                        <span class="title-line"><i class="fa fa-car"></i></span>
                        <p></p>
                    </div>
                </div>
                <!-- Page Title End -->
            </div>
        </div>
    </section>
    <!--== Page Title Area End ==-->
    <section id="car-list-area" class="section-padding">
        <div class="container">
            <div class="row">
                <!-- Car List Content Start -->
                <div class="col-lg-12">
                    <div class="car-list-content">
                        <div class="row">
                            <!-- Single Car Start -->
                            <div class="col-lg-6 col-md-6">
                                <div class="single-car-wrap">
                                    <div class="car-list-thumb car-thumb-1"></div>
                                    <div class="car-list-info without-bar">
                                        <h2><a href="#">Aston Martin One-77</a></h2>
                                        <h5>39$ Rent /per a day</h5>
                                        <p>Vivamus eget nibh. Etiam cursus leo vel metus. Nulla facilisi. Aenean inorci luctus et ultrices posuere cubilia.</p>
                                        <ul class="car-info-list">
                                            <li>AC</li>
                                            <li>Diesel</li>
                                            <li>Auto</li>
                                        </ul>
                                        <p class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star unmark"></i>
                                        </p>
                                        <a href="#" class="rent-btn">Book It</a>
                                    </div>
                                </div>
                            </div>
                       <!-- Single Car End -->
                        </div>
                    </div>
                     <!-- Page Pagination Start -->
                             <div class="page-pagi">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                            <%if(nowPage<=1) {%>
                                <li class="page-item"><a class="page-link">Previous</a></li>
                                <%}else{ %>
                                <li class="page-item"><a class="page-link" href="carIntro.rw?page=<%=nowPage-1 %>">Previous</a></li><%} %>
                                
                                <%for(int a=startPage; a<=endPage; a++){
                                	if(a==nowPage){%>
                                	<li class="page-item active"><a class="page-link"><%=a %></a><%}else{ %>
                                	
                                <li class="page-item"><a class="page-link" href="carIntro.rw?page=<%=a %>"><%=a %></a>
                                <%} %>
                                <%} %>
                                
                               <%if(nowPage>=maxPage){ %>
                               <li class="page-item"><a class="page-link" href="#">Next</a>
                               <%}else{ %>
                                <li class="page-item"><a class="page-link" href="carIntro.rw?page=<%=nowPage+1 %>">Next</a><%} %>
                            </ul>
                        </nav>
                    </div>
                    <!-- Page Pagination End -->
                </div>
                <!-- Car List Content End -->
          </div>
        </div>
    </section>
    <!--== Car List Area End ==-->
        <!--== Footer Area Start ==-->
    <jsp:include page="../inc/Footer.jsp" />
</body>
</html>
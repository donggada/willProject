<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<script src="js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				var today = new Date();
				var dd = today.getDate();
				var mm = today.getMonth() + 1;
				var yyyy = today.getFullYear();
				if (dd < 10) {
					dd = '0' + dd
				}
				if (mm < 10) {
					mm = '0' + mm
				}
				today = yyyy + '-' + mm + '-' + dd;
				document.getElementById("pickup_date").setAttribute("min",
						today);

				$('#pickup_date').change(
						function() {

							var pickup = new Date($('#pickup_date').val());
							document.getElementById('end_date').min = pickup
									.toISOString().substring(0, 10);
							document.getElementById('end_date').value = pickup
									.toISOString().substring(0, 10);
							pickup.setDate(pickup.getDate() + 7);
						});
			});

	//     $('table tr td').click(function() {
	//         var txt = $(this).text();
	//         document.getElementById('car').value = txt;
	//         $('#Car_list tr td').css('border', '1px solid black');
	//         $(this).css('border', '2px solid blue');
	// 	});
</script>
<style>
#chat {
	width: 150px;
	position: fixed;
	top: 30%;
	right: 55px;
	z-index: 9999;
}
</style>
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

	<!--== Header Area Start ==-->
	<jsp:include page="inc/Header.jsp" />

	<!--== Header Area End ==-->

	<!--== Slider Area Start ==-->
	<section id="slider-area">
		<!--== slide Item One ==-->
		<div class="single-slide-item overlay">
			<div class="container">
				<div class="row">
					<div class="col-lg-5">
						<div class="book-a-car">
							<form action="BookForm2.bk" method="post">
								<!--== Pick Up Location ==-->
								<div>
									<h2>예약</h2>
								</div>
								<br>
								<!--                                 <div class="pickup-location book-item"> -->
								<!--                                     <h4>지점 선택</h4> -->
								<!--                                     <select class="custom-select"> -->
								<!--                                       <option selected>선택하세요</option> -->
								<!--                                       <option value="1">제주공항 지점</option> -->
								<!--                                       <option value="2">제주항 지점</option> -->
								<!--                                       <option value="3">서귀포항 지점</option> -->
								<!--                                     </select> -->
								<!--                                 </div> -->
								<!--== Pick Up Location ==-->

								<!--== Pick Up Date ==-->
								<div class="pick-up-date book-item">
									<h4>대여일 선택:</h4>
									<input type="date" id="pickup_date" name="pickup_date">
									<!--                                     <input id="startDate" placeholder="Pick Up Date" /> -->

									<div class="return-car">
										<h4>반납일 선택:</h4>
										<input type="date" id="end_date" name="end_date">
										<!--                                         <input id="endDate" placeholder="Return Date" /> -->
									</div>
								</div>
								<!--== Pick Up Location ==-->

								<!--== Car Choose ==-->
								<div class="choose-car-type book-item">
									<h4>차량유형 선택:</h4>
									<table id="Car_list" board="1">
										<tr>
											<td>경차<input type="radio" name="SelCar" value="경차"></td>
											<td>소형<input type="radio" name="SelCar" value="소형"></td>
											<td>중형<input type="radio" name="SelCar" value="중형"></td>
										</tr>
										<tr>
											<td>준대형<input type="radio" name="SelCar" value="준대형"></td>
											<td>대형<input type="radio" name="SelCar" value="대형"></td>
											<td>승합<input type="radio" name="SelCar" value="승합"></td>
										</tr>
										<tr>
											<td>SUVㅣRV<input type="radio" name="SelCar"
												value="SUVㅣRV"></td>
											<td>전기차<input type="radio" name="SelCar" value="전기차"></td>
											<td>수입차<input type="radio" name="SelCar" value="수입차"></td>
										</tr>
									</table>
								</div>
								<!--== Car Choose ==-->

								<div class="book-button text-center">
									<input type="submit" value="검색">
								</div>
							</form>
						</div>
					</div>

					<div class="col-lg-7 text-right">
						<div class="display-table">
							<div class="display-table-cell">
								<div class="slider-right-text">
									<h1>빛나는 제주, 빛나는 휴가</h1>
									<p>
										최고의 서비스 그리고 최고의 차량<br>당신의 휴가를 더 특별하게
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--== slide Item One ==-->
	</section>
	<!--== Slider Area End ==-->

	<!--== About Us Area Start ==-->
	<!--     <section id="about-area" class="section-padding"> -->
	<!--         <div class="container"> -->
	<!--             <div class="row"> -->
	<!--                 Section Title Start -->
	<!--                 <div class="col-lg-12"> -->
	<!--                     <div class="section-title  text-center"> -->
	<!--                         <h2>About us</h2> -->
	<!--                         <span class="title-line"><i class="fa fa-car"></i></span> -->
	<!--                         <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p> -->
	<!--                     </div> -->
	<!--                 </div> -->
	<!--                 Section Title End -->
	<!--             </div> -->

	<!--             <div class="row"> -->
	<!--                 About Content Start -->
	<!--                 <div class="col-lg-6"> -->
	<!--                     <div class="display-table"> -->
	<!--                         <div class="display-table-cell"> -->
	<!--                             <div class="about-content"> -->
	<!--                                 <p>Lorem simply dummy is a texted of the printing costed and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type.</p> -->

	<!--                                 <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quasi aliquid debitis optio praesentium, voluptate repellat accusantium deserunt eius.</p> -->
	<!--                                 <div class="about-btn"> -->
	<!--                                     <a href="#">Book a Car</a> -->
	<!--                                     <a href="#">Contact Us</a> -->
	<!--                                 </div> -->
	<!--                             </div> -->
	<!--                         </div> -->
	<!--                     </div> -->
	<!--                 </div> -->
	<!--                 About Content End -->

	<!--                 About Video Start -->
	<!--                 <div class="col-lg-6"> -->
	<!--                     <div class="about-video"> -->
	<!--                         <iframe src="https://player.vimeo.com/video/121982328?title=0&byline=0&portrait=0"></iframe> -->
	<!--                     </div> -->
	<!--                 </div> -->
	<!--                 About Video End -->
	<!--             </div> -->
	<!--         </div> -->
	<!--     </section> -->
	<!--     == About Us Area End == -->

	<!--                     </div> -->
	<!--                 </div> -->
	<!--             </div> -->
	<!--         </div> -->
	<!--     </div> -->
	<!--     == Partner Area End == -->

	<!--== Services Area Start ==-->
	<section id="service-area" class="section-padding">
		<div class="container">
			<div class="row">
				<!-- Section Title Start -->
				<div class="col-lg-12">
					<div class="section-title  text-center">
						<h2>그 외 서비스</h2>
						<span class="title-line"><i class="fa fa-car"></i></span>
						<p>고객님이 원하는 서비스를 추천해드립니다.</p>
					</div>
				</div>
				<!-- Section Title End -->
			</div>


			<!-- Service Content Start -->
			<div class="row">
				<!-- Single Service Start -->
				<div class="col-lg-4 text-center">
					<div class="service-item">
						<i class="fa fa-taxi"></i>
						<h3>차 렌터 서비스</h3>
						<p>최고의 자동차로 만끽하는 휴가를 즐겨보세요.</p>
					</div>
				</div>
				<!-- Single Service End -->

				<!-- Single Service Start -->
				<div class="col-lg-4 text-center">
					<div class="service-item">
						<i class="fa fa-cog"></i>
						<h3>차 수리 서비스</h3>
						<p>위급사항 발생 시 차량전문가의 손길으로 합리적인 가격에 수리하세요.</p>
					</div>
				</div>
				<!-- Single Service End -->

				<!-- Single Service Start -->
				<div class="col-lg-4 text-center">
					<div class="service-item">
						<i class="fa fa-map-marker"></i>
						<h3>전문 기사 서비스</h3>
						<p>어디서 이동하든 원하시는 곳에 전문 기사와 함께하세요.</p>
					</div>
				</div>
				<!-- Single Service End -->

				<!-- Single Service Start -->
				<div class="col-lg-4 text-center">
					<div class="service-item">
						<i class="fa fa-life-ring"></i>
						<h3>전 좌석 에어백 서비스</h3>
						<p>저희 Will사의 모든 차량은 전 좌석 에어백이 탑재되어 있습니다.</p>
					</div>
				</div>
				<!-- Single Service End -->

				<!-- Single Service Start -->
				<div class="col-lg-4 text-center">
					<div class="service-item">
						<i class="fa fa-bath"></i>
						<h3>호텔 서비스</h3>
						<p>제주 호텔과의 협약으로 합리적인 가격에 호텔을 이용하세요.</p>
					</div>
				</div>
				<!-- Single Service End -->

				<!-- Single Service Start -->
				<div class="col-lg-4 text-center">
					<div class="service-item">
						<i class="fa fa-phone"></i>
						<h3>24시 보험 서비스</h3>
						<p>차량에 문제가 있으신가요? 언제든 전화주세요</p>
					</div>
				</div>
				<!-- Single Service End -->
			</div>
			<!-- Service Content End -->
		</div>
	</section>
	<!--== Services Area End ==-->

	<!--== Fun Fact Area Start ==-->
	<section id="funfact-area" class="overlay section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-11 col-md-12 m-auto">
					<div class="funfact-content-wrap">
						<div class="row">
							<!-- Single FunFact Start -->
							<div class="col-lg-4 col-md-6">
								<div class="single-funfact">
									<div class="funfact-icon">
										<i class="fa fa-smile-o"></i>
									</div>
									<div class="funfact-content">
										<p>
											<span class="counter">550</span>+
										</p>
										<h4>만족한 고객</h4>
									</div>
								</div>
							</div>
							<!-- Single FunFact End -->

							<!-- Single FunFact Start -->
							<div class="col-lg-4 col-md-6">
								<div class="single-funfact">
									<div class="funfact-icon">
										<i class="fa fa-car"></i>
									</div>
									<div class="funfact-content">
										<p>
											<span class="counter">250</span>+
										</p>
										<h4>회사 내 차량</h4>
									</div>
								</div>
							</div>
							<!-- Single FunFact End -->

							<!-- Single FunFact Start -->
							<div class="col-lg-4 col-md-6">
								<div class="single-funfact">
									<div class="funfact-icon">
										<i class="fa fa-bank"></i>
									</div>
									<div class="funfact-content">
										<p>
											<span class="counter">50</span>+
										</p>
										<h4>지점</h4>
									</div>
								</div>
							</div>
							<!-- Single FunFact End -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--== Fun Fact Area End ==-->

	<!--== Choose Car Area Start ==-->
	<section id="choose-car" class="section-padding">
		<div class="container">
			<div class="row">
				<!-- Section Title Start -->
				<div class="col-lg-12">
					<div class="section-title  text-center">
						<h2>차량 소개</h2>
						<span class="title-line"><i class="fa fa-car"></i></span>
						<p>당신을 위한 자동차를 미리 만나보세요!</p>
					</div>
				</div>
				<!-- Section Title End -->
			</div>

			<div class="row">
				<!-- Choose Area Content Start -->
				<div class="col-lg-12">
					<div class="choose-content-wrap">
						<!-- Choose Area Tab Menu -->
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								id="home-tab" data-toggle="tab" href="#popular_cars" role="tab"
								aria-selected="true">상시 대기 차량</a></li>
							<li class="nav-item"><a class="nav-link" id="profile-tab"
								data-toggle="tab" href="#newest_cars" role="tab"
								aria-selected="false">새로 들어온 차량</a></li>
							<li class="nav-item"><a class="nav-link" id="contact-tab"
								data-toggle="tab" href="#office_map" role="tab"
								aria-selected="false">지점 안내</a></li>
						</ul>
						<!-- Choose Area Tab Menu -->

						<!-- Choose Area Tab content -->
						<div class="tab-content" id="myTabContent">
							<!-- Popular Cars Tab Start -->
							<div class="tab-pane fade show active" id="popular_cars"
								role="tabpanel" aria-labelledby="home-tab">
								<!-- Popular Cars Content Wrapper Start -->
								<div class="popular-cars-wrap">
									<!-- Filtering Menu -->
									<div class="popucar-menu text-center">
										<a href="#" data-filter="*" class="active">all</a> <a href="#"
											data-filter=".audi">AUDI</a> <a href="#" data-filter=".bmw">BMW</a>
										<a href="#" data-filter=".benz">BENZ</a> <a href="#"
											data-filter=".rover">RANGE ROVER</a> <a href="#"
											data-filter=".etc">ETC</a>
									</div>

									<!-- Filtering Menu -->

									<!-- PopularCars Tab Content Start -->
									<div class="row popular-car-gird">
										<!-- Single Popular Car Start -->
										<div class="col-lg-4 col-md-6 hon bmw mpv">
											<div class="single-popular-car">
												<div class="p-car-thumbnails">
													<a class="car-hover" href="assets/img/car/car-7.jpg"> <img
														src="assets/img/car/car-7.jpg" alt="JSOFT">
													</a>
												</div>

												<div class="p-car-content">
													<h3>
														<a href="#">BMW 320d</a> <span class="price"><i
															class="fa fa-tag"></i> $280/day</span>
													</h3>

													<h5></h5>

													<div class="p-car-feature">
														<a href="#">2020</a> <a href="#">manual</a> <a href="#">AIR
															CONDITION</a>
													</div>
												</div>
											</div>
										</div>
										<!-- Single Popular Car End -->

										<!-- Single Popular Car Start -->
										<div class="col-lg-4 col-md-6 audi sedan">
											<div class="single-popular-car">
												<div class="p-car-thumbnails">
													<a class="car-hover" href="assets/img/car/car-2.jpg"> <img
														src="assets/img/car/car-2.jpg" alt="JSOFT">
													</a>
												</div>

												<div class="p-car-content">
													<h3>
														<a href="#">Dodge Ram 1500</a> <span class="price"><i
															class="fa fa-tag"></i> $55/day</span>
													</h3>

													<h5>HATCHBACK</h5>

													<div class="p-car-feature">
														<a href="#">2017</a> <a href="#">manual</a> <a href="#">AIR
															CONDITION</a>
													</div>
												</div>
											</div>
										</div>
										<!-- Single Popular Car End -->

										<!-- Single Popular Car Start -->
										<div class="col-lg-4 col-md-6 suv con mpv">
											<div class="single-popular-car">
												<div class="p-car-thumbnails">
													<a class="car-hover" href="assets/img/car/car-3.jpg"> <img
														src="assets/img/car/car-3.jpg" alt="JSOFT">
													</a>
												</div>

												<div class="p-car-content">
													<h3>
														<a href="#">Dodge Ram 1500</a> <span class="price"><i
															class="fa fa-tag"></i> $55/day</span>
													</h3>

													<h5>HATCHBACK</h5>

													<div class="p-car-feature">
														<a href="#">2017</a> <a href="#">manual</a> <a href="#">AIR
															CONDITION</a>
													</div>
												</div>
											</div>
										</div>
										<!-- Single Popular Car End -->

										<!-- Single Popular Car Start -->
										<div class="col-lg-4 col-md-6 con hat">
											<div class="single-popular-car">
												<div class="p-car-thumbnails">
													<a class="car-hover" href="assets/img/car/car-4.jpg"> <img
														src="assets/img/car/car-4.jpg" alt="JSOFT">
													</a>
												</div>

												<div class="p-car-content">
													<h3>
														<a href="#">Dodge Ram 1500</a> <span class="price"><i
															class="fa fa-tag"></i> $55/day</span>
													</h3>

													<h5>HATCHBACK</h5>

													<div class="p-car-feature">
														<a href="#">2017</a> <a href="#">manual</a> <a href="#">AIR
															CONDITION</a>
													</div>
												</div>
											</div>
										</div>
										<!-- Single Popular Car End -->

										<!-- Single Popular Car Start -->
										<div class="col-lg-4 col-md-6 con sedan mpv">
											<div class="single-popular-car">
												<div class="p-car-thumbnails">
													<a class="car-hover" href="assets/img/car/car-5.jpg"> <img
														src="assets/img/car/car-5.jpg" alt="JSOFT">
													</a>
												</div>

												<div class="p-car-content">
													<h3>
														<a href="#">Dodge Ram 1500</a> <span class="price"><i
															class="fa fa-tag"></i> $55/day</span>
													</h3>

													<h5>HATCHBACK</h5>

													<div class="p-car-feature">
														<a href="#">2017</a> <a href="#">manual</a> <a href="#">AIR
															CONDITION</a>
													</div>
												</div>
											</div>
										</div>
										<!-- Single Popular Car End -->

										<!-- Single Popular Car Start -->
										<div class="col-lg-4 col-md-6 hat suv mpv">
											<div class="single-popular-car">
												<div class="p-car-thumbnails">
													<a class="car-hover" href="assets/img/car/car-6.jpg"> <img
														src="assets/img/car/car-6.jpg" alt="JSOFT">
													</a>
												</div>

												<div class="p-car-content">
													<h3>
														<a href="#">Dodge Ram 1500</a> <span class="price"><i
															class="fa fa-tag"></i> $55/day</span>
													</h3>

													<h5>HATCHBACK</h5>

													<div class="p-car-feature">
														<a href="#">2017</a> <a href="#">manual</a> <a href="#">AIR
															CONDITION</a>
													</div>
												</div>
											</div>
										</div>
										<!-- Single Popular Car End -->
										<div class="col-lg-4 col-md-6 hat suv mpv">
											<div class="single-popular-car">
												<div class="p-car-thumbnails">
													<a class="car-hover" href="assets/img/car/car-6.jpg"> <img
														src="assets/img/car/car-6.jpg" alt="JSOFT">
													</a>
												</div>

												<div class="p-car-content">
													<h3>
														<a href="#">Dodge Ram 1500</a> <span class="price"><i
															class="fa fa-tag"></i> $55/day</span>
													</h3>

													<h5>HATCHBACK</h5>

													<div class="p-car-feature">
														<a href="#">2017</a> <a href="#">manual</a> <a href="#">AIR
															CONDITION</a>
													</div>
												</div>
											</div>
										</div>
										<!-- Single Popular Car End -->
										<div class="col-lg-4 col-md-6 hat suv mpv">
											<div class="single-popular-car">
												<div class="p-car-thumbnails">
													<a class="car-hover" href="assets/img/car/car-6.jpg"> <img
														src="assets/img/car/car-6.jpg" alt="JSOFT">
													</a>
												</div>

												<div class="p-car-content">
													<h3>
														<a href="#">Dodge Ram 1500</a> <span class="price"><i
															class="fa fa-tag"></i> $55/day</span>
													</h3>

													<h5>HATCHBACK</h5>

													<div class="p-car-feature">
														<a href="#">2017</a> <a href="#">manual</a> <a href="#">AIR
															CONDITION</a>
													</div>
												</div>
											</div>
										</div>
										<!-- Single Popular Car End -->
										<div class="col-lg-4 col-md-6 hat suv mpv">
											<div class="single-popular-car">
												<div class="p-car-thumbnails">
													<a class="car-hover" href="assets/img/car/car-6.jpg"> <img
														src="assets/img/car/car-6.jpg" alt="JSOFT">
													</a>
												</div>

												<div class="p-car-content">
													<h3>
														<a href="#">Dodge Ram 1500</a> <span class="price"><i
															class="fa fa-tag"></i> $55/day</span>
													</h3>

													<h5>HATCHBACK</h5>

													<div class="p-car-feature">
														<a href="#">2017</a> <a href="#">manual</a> <a href="#">AIR
															CONDITION</a>
													</div>
												</div>
											</div>
										</div>
										<!-- Single Popular Car End -->
									</div>
									<!-- PopularCars Tab Content End -->
								</div>
								<!-- Popular Cars Content Wrapper End -->
							</div>
							<!-- Popular Cars Tab End -->
							<!-- //-------------------------------------------------------------------------------------------------------- -->
							<!-- Newest Cars Tab Start -->
							<div class="tab-pane fade" id="newest_cars" role="tabpanel"
								aria-labelledby="profile-tab">
								<!-- Newest Cars Content Wrapper Start -->
								<div class="popular-cars-wrap">
									<!-- Filtering Menu -->
									<div class="newcar-menu text-center">
										<a href="#" data-filter="*" class="active">all</a> <a href="#"
											data-filter=".toyota">toyota</a> <a href="#"
											data-filter=".bmw">bmw</a> <a href="#" data-filter=".audi">audi</a>
										<a href="#" data-filter=".tata">Tata</a>
									</div>

									<!-- Filtering Menu -->

									<!-- NewestCars Tab Content Start -->
									<div class="row newest-car-gird">
										<!-- Single Newest Car Start -->
										<div class="col-lg-4 col-md-6 tata audi">
											<div class="single-new-car">
												<div class="p-car-thumbnails">
													<a class="car-hover" href="assets/img/car/car-6.jpg"> <img
														src="assets/img/car/car-6.jpg" alt="JSOFT">
													</a>
												</div>

												<div class="p-car-content">
													<h3>
														<a href="#">Toyota RAV4 EV</a> <span class="price"><i
															class="fa fa-tag"></i> $35/day</span>
													</h3>

													<h5>Toyota</h5>

													<div class="p-car-feature">
														<a href="#">2018</a> <a href="#">Auto</a> <a href="#">Non
															AIR CONDITION</a>
													</div>
												</div>
											</div>
										</div>
										<!-- Single Newest Car End -->

										<!-- Single Newest Car Start -->
										<div class="col-lg-4 col-md-6 bmw tata toyota">
											<div class="single-new-car">
												<div class="p-car-thumbnails">
													<a class="car-hover" href="assets/img/car/car-5.jpg"> <img
														src="assets/img/car/car-5.jpg" alt="JSOFT">
													</a>
												</div>

												<div class="p-car-content">
													<h3>
														<a href="#">Toyota RAV4 EV</a> <span class="price"><i
															class="fa fa-tag"></i> $35/day</span>
													</h3>

													<h5>Toyota</h5>

													<div class="p-car-feature">
														<a href="#">2018</a> <a href="#">Auto</a> <a href="#">Non
															AIR CONDITION</a>
													</div>
												</div>
											</div>
										</div>
										<!-- Single Newest Car End -->

										<!-- Single Newest Car Start -->
										<div class="col-lg-4 col-md-6 bmw">
											<div class="single-new-car">
												<div class="p-car-thumbnails">
													<a class="car-hover" href="assets/img/car/car-4.jpg"> <img
														src="assets/img/car/car-4.jpg" alt="JSOFT">
													</a>
												</div>

												<div class="p-car-content">
													<h3>
														<a href="#">Toyota RAV4 EV</a> <span class="price"><i
															class="fa fa-tag"></i> $35/day</span>
													</h3>

													<h5>Toyota</h5>

													<div class="p-car-feature">
														<a href="#">2018</a> <a href="#">Auto</a> <a href="#">Non
															AIR CONDITION</a>
													</div>
												</div>
											</div>
										</div>
										<!-- Single Newest Car End -->
									</div>
									<!-- NewestCars Tab Content End -->
								</div>
								<!-- Newest Cars Content Wrapper End -->
							</div>
							<!-- Newest Cars Tab End -->

							<!-- Office Map Tab -->
							<div class="tab-pane fade" id="office_map" role="tabpanel"
								aria-labelledby="contact-tab">
								<div class="map-area">
									<iframe
										src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3650.6538067244583!2d90.37092511435942!3d23.79533919297639!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c0cce3251ab1%3A0x7a2aa979862a9643!2sJSoft!5e0!3m2!1sen!2sbd!4v1516771096779"></iframe>
								</div>
							</div>
							<!-- Office Map Tab -->
						</div>
						<!-- Choose Area Tab content -->
					</div>
				</div>
				<!-- Choose Area Content End -->
			</div>
		</div>
	</section>
	<!--== Choose Car Area End ==-->

	<!--== Pricing Area Start ==-->
	<section id="pricing-area" class="section-padding overlay">
		<div class="container">
			<div class="row">
				<!-- Section Title Start -->
				<div class="col-lg-12">
					<div class="section-title  text-center">
						<h2>멤버십</h2>
						<span class="title-line"><i class="fa fa-car"></i></span>
						<p>여러분들을 Will사의 가족으로 초대합니다.</p>
					</div>
				</div>
				<!-- Section Title End -->
			</div>

			<!-- Pricing Table Conatent Start -->
			<div class="row">
				<!-- Single Pricing Table -->
				<div class="col-lg-4 col-md-6 text-center">
					<div class="single-pricing-table">
						<h3>GOLD</h3>
						<h2>$ 1500</h2>
						<h5>Harf Year</h5>

						<ul class="package-list">
							<li>차량 딜리버리 서비스</li>
							<li>협약 호텔 및 렌터카 할인</li>
							<li>제주 왕복 항공권 제공</li>
							<li>GOLD 라운지 제공</li>
							<!--                             <li> </li> -->
							<!--                             <li> </li> -->
						</ul>
					</div>
				</div>
				<!-- Single Pricing Table -->

				<!-- Single Pricing Table -->
				<div class="col-lg-4 col-md-6 text-center">
					<div class="single-pricing-table">
						<h3>DIAMOND</h3>
						<h2>$ 5000</h2>
						<h5>Harf Year</h5>

						<ul class="package-list">
							<li>차량 딜리버리 서비스</li>
							<li>협약 호텔 및 렌터카 할인</li>
							<li>전문 기사 서비스</li>
							<li>제주 왕복 항공권 제공</li>
							<li>제주공항 라운지 제공</li>
							<li>DIAMOND 라운지 제공</li>
						</ul>
					</div>
				</div>
				<!-- Single Pricing Table -->

				<!-- Single Pricing Table -->
				<div class="col-lg-4 col-md-6 text-center">
					<div class="single-pricing-table">
						<h3>PLATINUM</h3>
						<h2>$ 3000</h2>
						<h5>Harf Year</h5>

						<ul class="package-list">
							<li>차량 딜리버리 서비스</li>
							<li>협약 호텔 및 렌터카 할인</li>
							<li>전문 기사 서비스</li>
							<li>제주 왕복 항공권 제공</li>
							<li>PLATINUM 라운지 제공</li>
							<!--                             <li>ALL MINI BAR</li> -->
							<!--                             <li>CHAUFFER PRICE</li> -->
						</ul>
					</div>
				</div>
				<!-- Single Pricing Table -->
			</div>
			<!-- Pricing Table Conatent End -->
		</div>
	</section>
	<!--== Pricing Area End ==-->

	<!-- 개편된 기간,지점 선택 (시작) -->
	<article>
		<div class="header-group">
			<h3>
				기간/지점 선택
				<p>
					<span class="cl-point1">기간·지점·차량</span>은 순서와 관계없이 <span
						class="cl-point1">선택 예약이 가능</span>합니다.
				</p>
			</h3>
			<!-- 20180402 -->
		</div>
		<div class="article-content">
			<div class="rent-store-select">
				<div class="col fl">
					<div class="date-time-area clearfix">
						<span id="sDateSpan" class="input fl"> <input type="text"
							id="sDate" class="brr0 rentDate" readonly="readonly"
							placeholder="대여일 선택" name="sDate" value="" disabled="disabled" />
						</span> <span class="select-box fl"> <select name="sHour"
							id="sHour" class="option01 hour">
						</select>
						</span> <span class="select-box fl"> <select name="sMinute"
							id="sMinute" class="option01 timeChange" disabled="disabled">
								<option value="00">00분</option>
								<option value="30">30분</option>
						</select>
						</span>
					</div>
					<div class="store-area clearfix">
						<span class="multiple-select-box fl is-disabled"> <strong
							class="js-multiple-select-text">제주/제주지점</strong>
						</span>
						<div class="layer-multiple-select-box">
							<div class="col">
								<dl class="location">
									<dt>지역선택</dt>
								</dl>
							</div>
							<div class="col">
								<dl class="store">
									<dt>지점선택</dt>
								</dl>
							</div>
						</div>
						<a href="javascript:void(0);"
							class="btn btn-default btn-fix1 btn-modal fr"
							onclick="viewBranch('000012');">지도보기</a>
					</div>
				</div>
				<div class="col fl">
					<div class="date-time-area clearfix">
						<span id="lDateSpan" class="input fl"> <input type="text"
							class="readonly brr0 rentDate" id="lDate" placeholder="반납일 선택"
							readonly="readonly" name="lDate" value="" disabled="disabled" />
						</span> <span class="select-box fl"> <select name="lHour"
							id="lHour" class="option01 hour" disabled="disabled">
						</select>
						</span> <span class="select-box fl"> <select name="lMinute"
							id="lMinute" class="option01 timeChange" disabled="disabled">
								<option value="00">00분</option>
								<option value="30">30분</option>
						</select>
						</span>
					</div>
					<div class="store-area clearfix">
						<span class="multiple-select-box fl is-disabled"> <strong
							class="js-multiple-select-text">제주/제주지점</strong>
						</span>
						<div class="layer-multiple-select-box">
							<div class="col">
								<dl class="location">
									<dt>지역선택</dt>
								</dl>
							</div>
							<div class="col">
								<dl class="store">
									<dt>지점선택</dt>
								</dl>
							</div>
						</div>
						<a href="javascript:void(0);"
							class="btn btn-default btn-fix1 btn-modal fr"
							onclick="viewBranch('000012');">지도보기</a>
					</div>
				</div>
				<div class="col fr">
					<div class="date-total-time-area">
						<div class="helper">
							<strong>총 대여시간</strong>
							<p>0일 0시간 0분</p>
						</div>
					</div>
				</div>
			</div>

			<div class="bg-line1 under-tab">
				<ul class="list-info v1">
					<li>예약가능시간 : 제주지점(대여/반납 06:00 ~ 22:00)<!--  / 내륙 전 지점(9:00~19:00) --></li>
					<li id="txtClosedBranch" class="cl-point1" style="display: none">해당
						지점에 선택하신 날짜에는 예약 및 반납이 불가합니다</li>
					<li>반려동물 동반 탑승은 불가합니다. (케이지 포함)<br>(* 다음 이용 고객에 알레르기 등
						불편을 줄 수 있어, 동반 탑승 시 클리닝 비용(10만원 이상)이 추가 발생할 수 있습니다.)
					</li>
				</ul>
			</div>

		</div>
	</article>

	<!-- 개편된 기간,지점 선택 (끝) -->
	<!--== Testimonials Area Start ==-->
	<section id="testimonial-area" class="section-padding">
		<div class="container">
			<div class="row">
				<!-- Section Title Start -->
				<div class="col-lg-12">
					<div class="section-title  text-center">
						<h2>Testimonials</h2>
						<span class="title-line"><i class="fa fa-car"></i></span>
						<p>Lorem ipsum dolor sit amet elit.</p>
					</div>
				</div>
				<!-- Section Title End -->
			</div>

			<div class="row">
				<div class="col-lg-8 col-md-12 m-auto">
					<div class="testimonial-content">
						<!--== Single Testimoial Start ==-->
						<div class="single-testimonial">
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Quis totam obcaecati impedit, at autem repellat vel magni
								architecto veritatis sed.</p>
							<h3>Vongchong Smith</h3>
							<div class="client-logo">
								<img src="assets/img/client/client-pic-1.jpg" alt="JSOFT">
							</div>
						</div>
						<!--== Single Testimoial End ==-->

						<!--== Single Testimoial Start ==-->
						<div class="single-testimonial">
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Quis totam obcaecati impedit, at autem repellat vel magni
								architecto veritatis sed.</p>
							<h3>Amader Tuni</h3>
							<div class="client-logo">
								<img src="assets/img/client/client-pic-3.jpg" alt="JSOFT">
							</div>
						</div>
						<!--== Single Testimoial End ==-->

						<!--== Single Testimoial Start ==-->
						<div class="single-testimonial">
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Quis totam obcaecati impedit, at autem repellat vel magni
								architecto veritatis sed.</p>
							<h3>Atex Tuntuni Smith</h3>
							<div class="client-logo">
								<img src="assets/img/client/client-pic-2.jpg" alt="JSOFT">
							</div>
						</div>
						<!--== Single Testimoial End ==-->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--== Testimonials Area End ==-->
	<!--== Footer Area Start ==-->
	<section id="footer-area">
		<!-- Footer Widget Start -->
		<div class="footer-widget-area">
			<div class="container">
				<div class="row">
					<!-- Single Footer Widget Start -->
					<div class="col-lg-4 col-md-6">
						<div class="single-footer-widget">
							<h2>About Us</h2>
							<div class="widget-body">
								<img src="assets/img/logo.png" alt="JSOFT">
								<p>Lorem ipsum dolored is a sit ameted consectetur
									adipisicing elit. Nobis magni assumenda distinctio debitis, eum
									fuga fugiat error reiciendis.</p>

								<div class="newsletter-area">
									<form action="index.jsp">
										<input type="email" placeholder="Subscribe Our Newsletter">
										<button type="submit" class="newsletter-btn">
											<i class="fa fa-send"></i>
										</button>
									</form>
								</div>

							</div>
						</div>
					</div>
					<!-- Single Footer Widget End -->

					<!-- Single Footer Widget Start -->
					<div class="col-lg-4 col-md-6">
						<div class="single-footer-widget">
							<h2>Recent Posts</h2>
							<div class="widget-body">
								<ul class="recent-post">
									<li><a href="#"> Hello Bangladesh! <i
											class="fa fa-long-arrow-right"></i>
									</a></li>
									<li><a href="#"> Lorem ipsum dolor sit amet <i
											class="fa fa-long-arrow-right"></i>
									</a></li>
									<li><a href="#"> Hello Bangladesh! <i
											class="fa fa-long-arrow-right"></i>
									</a></li>
									<li><a href="#"> consectetur adipisicing elit? <i
											class="fa fa-long-arrow-right"></i>
									</a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- Single Footer Widget End -->

					<!-- Single Footer Widget Start -->
					<div class="col-lg-4 col-md-6">
						<div class="single-footer-widget">
							<h2>get touch</h2>
							<div class="widget-body">
								<p>Lorem ipsum doloer sited amet, consectetur adipisicing
									elit. nibh auguea, scelerisque sed</p>

								<ul class="get-touch">
									<li><i class="fa fa-map-marker"></i> 800/8, Kazipara,
										Dhaka</li>
									<li><i class="fa fa-mobile"></i> +880 01 86 25 72 43</li>
									<li><i class="fa fa-envelope"></i> kazukamdu83@gmail.com</li>
								</ul>
								<a href="https://goo.gl/maps/b5mt45MCaPB2" class="map-show"
									target="_blank">Show Location</a>
							</div>
						</div>
					</div>
					<!-- Single Footer Widget End -->
				</div>
			</div>
		</div>
		<!-- Footer Widget End -->

		<!-- Footer Bottom Start -->
		<div class="footer-bottom-area">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<p>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with <i
								class="fa fa-heart-o" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer Bottom End -->
	</section>
	<!--== Footer Area End ==-->

	<!--== Scroll Top Area Start ==-->
	<div id="chat">
		<!-- <img alt="카카오" src="img/pc_img_kakao.jpg" onclick="script:alert('아직은 미지원 입니다 ^^b');"><br> -->
		<img alt="웹 채팅" src="img/pc_btn_chat.png"
			onclick="window.open('chat/chat_bot.jsp','new','width=800, height=600, resizable=no')">
	</div>
	<div class="scroll-top">
		<img src="assets/img/scroll-top.png" alt="JSOFT">
	</div>
	<!--== Scroll Top Area End ==-->

	<!--=======================Javascript============================-->
	<!--=== Jquery Min Js ===-->
	<script src="assets/js/jquery-3.2.1.min.js"></script>
	<!--=== Jquery Migrate Min Js ===-->
	<script src="assets/js/jquery-migrate.min.js"></script>
	<!--=== Popper Min Js ===-->
	<script src="assets/js/popper.min.js"></script>
	<!--=== Bootstrap Min Js ===-->
	<script src="assets/js/bootstrap.min.js"></script>
	<!--=== Gijgo Min Js ===-->
	<script src="assets/js/plugins/gijgo.js"></script>
	<!--=== Vegas Min Js ===-->
	<script src="assets/js/plugins/vegas.min.js"></script>
	<!--=== Isotope Min Js ===-->
	<script src="assets/js/plugins/isotope.min.js"></script>
	<!--=== Owl Caousel Min Js ===-->
	<script src="assets/js/plugins/owl.carousel.min.js"></script>
	<!--=== Waypoint Min Js ===-->
	<script src="assets/js/plugins/waypoints.min.js"></script>
	<!--=== CounTotop Min Js ===-->
	<script src="assets/js/plugins/counterup.min.js"></script>
	<!--=== YtPlayer Min Js ===-->
	<script src="assets/js/plugins/mb.YTPlayer.js"></script>
	<!--=== Magnific Popup Min Js ===-->
	<script src="assets/js/plugins/magnific-popup.min.js"></script>
	<!--=== Slicknav Min Js ===-->
	<script src="assets/js/plugins/slicknav.min.js"></script>

	<!--=== Mian Js ===-->
	<script src="assets/js/main.js"></script>

</body>

</html>

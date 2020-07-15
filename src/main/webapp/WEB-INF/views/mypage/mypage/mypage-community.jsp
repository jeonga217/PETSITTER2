<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Browse &mdash; Free Website Template by Free-Template.co</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="Free-Template.co" />

<link rel="shortcut icon" href="ftco-32x32.png">

<link href="https://fonts.googleapis.com/css?family=Rubik:400,700"
	rel="stylesheet">

<link rel="stylesheet" href="resources/main/fonts/icomoon/style.css">

<link rel="stylesheet" href="/resources/main/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/main/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/main/css/jquery-ui.css">
<link rel="stylesheet" href="/resources/main/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="/resources/main/css/owl.theme.default.min.css">

<link rel="stylesheet"
	href="/resources/main/css/bootstrap-datepicker.css">

<link rel="stylesheet"
	href="/resources/main/fonts/flaticon/font/flaticon.css">

<link rel="stylesheet" href="/resources/main/css/aos.css">
<link rel="stylesheet" href="/resources/main/css/rangeslider.css">

<link rel="stylesheet" href="/resources/main/css/style.css">




<link rel="stylesheet" type="text/css"
	href="/resources/main/vendor1/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/main/fonts1/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/main/vendor1/animate/animate.css">
<link rel="stylesheet" type="text/css"
	href="/resources/main/vendor1/select2/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/main/vendor1/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" type="text/css"
	href="/resources/main/css1/util.css">
<link rel="stylesheet" type="text/css"
	href="/resources/main/css1/main.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
</head>
<style>
td{
text-align: center;
}
</style>
<body>

	<div class="site-wrap">

		<div class="site-mobile-menu">
			<div class="site-mobile-menu-header">
				<div class="site-mobile-menu-close mt-3">
					<span class="icon-close2 js-menu-toggle"></span>
				</div>
			</div>
			<div class="site-mobile-menu-body"></div>
		</div>

		<header class="site-navbar" role="banner">

			<div class="container">
				<div class="row align-items-center">

					<div class="col-11 col-xl-2">
						<h1 class="mb-0 site-logo">
							<a href="index.html" class="text-white h2 mb-0">Browse</a>
						</h1>
					</div>
					<div class="col-12 col-md-10 d-none d-xl-block">
						<nav class="site-navigation position-relative text-right"
							role="navigation">

							<ul class="site-menu js-clone-nav mr-auto d-none d-lg-block">
								<li class="active"><a href="#"><span>Home</span></a></li>
								<li class="active"><a href="#"><span>AboutUs</span></a></li>
								<li><a href="#"><span>PetService</span></a></li>
								<li><a href="#"><span>About</span></a></li>
								<li><a href="mypage"><span>MyPage</span></a></li>
								<li><a href="#"><span>Sing Up</span></a></li>
								<li><a href="#"><span>Login</span></a></li>
							</ul>
						</nav>
					</div>



					<div class="d-inline-block d-xl-none ml-md-0 mr-auto py-3"
						style="position: relative; top: 3px;">
						<a href="#" class="site-menu-toggle js-menu-toggle text-white"><span
							class="icon-menu h3"></span></a>
					</div>

				</div>

			</div>
		</header>

	</div>




	<div class="site-blocks-cover inner-page-cover overlay"
		style="background-image: url(/resources/main/images/dig.jpg);"
		data-aos="fade">
		<div class="container">
			<div
				class="row align-items-center justify-content-center text-center">

				<div class="col-md-10" data-aos="fade-up" data-aos-delay="400">


					<div class="row justify-content-center">
						<div class="col-md-8 text-center">
							<h1>마이페이지 커뮤니티</h1>
							<p data-aos="fade-up" data-aos-delay="100">
								Handcrafted free templates by <a
									href="https://free-template.co/" target="_blank">Free-Template.co</a>
							</p>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>


	<div class="site-section bg-light">
		<div class="container">


			<div class="limiter">
				<div class="container-table20">
					<div class="wrap-table20">
						<div class="table100 ver1 m-b-110">
							<div class="limiter">

								<table>
									<thead>
										<tr class="table100-head">
											<th class="column1">카테고리</th>
											<th class="column2">제목</th>
											<th class="column3">날짜</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="i" items="${bdto}">
											<tr>
												<td>${i.cu_category}</td>
												<td><a href="/community/view?cu_seq=${i.cu_seq}&cu_view_cnt=${i.cu_view_cnt}">${i.cu_title}</a></td>
												<td>${i.cu_date}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>

								<div class="col-12 mt-5 text-center">
									<div class="custom-pagination">${navi}</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<footer class="site-footer">
			<div class="container">
				<div class="row">
					<div class="col-md-9">
						<div class="row">
							<div class="col-md-6 mb-5 mb-lg-0 col-lg-3">
								<h2 class="footer-heading mb-4">Quick Links</h2>
								<ul class="list-unstyled">
									<li><a href="#">About Us</a></li>
									<li><a href="#">Services</a></li>
									<li><a href="#">Testimonials</a></li>
									<li><a href="#">Contact Us</a></li>
								</ul>
							</div>
							<div class="col-md-6 mb-5 mb-lg-0 col-lg-3">
								<h2 class="footer-heading mb-4">Products</h2>
								<ul class="list-unstyled">
									<li><a href="#">About Us</a></li>
									<li><a href="#">Services</a></li>
									<li><a href="#">Testimonials</a></li>
									<li><a href="#">Contact Us</a></li>
								</ul>
							</div>
							<div class="col-md-6 mb-5 mb-lg-0 col-lg-3">
								<h2 class="footer-heading mb-4">Features</h2>
								<ul class="list-unstyled">
									<li><a href="#">About Us</a></li>
									<li><a href="#">Services</a></li>
									<li><a href="#">Testimonials</a></li>
									<li><a href="#">Contact Us</a></li>
								</ul>
							</div>
							<div class="col-md-6 mb-5 mb-lg-0 col-lg-3">
								<h2 class="footer-heading mb-4">Follow Us</h2>
								<a href="#" class="pl-0 pr-3"><span class="icon-facebook"></span></a>
								<a href="#" class="pl-3 pr-3"><span class="icon-twitter"></span></a>
								<a href="#" class="pl-3 pr-3"><span class="icon-instagram"></span></a>
								<a href="#" class="pl-3 pr-3"><span class="icon-linkedin"></span></a>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<h2 class="footer-heading mb-4">Subscribe Newsletter</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.</p>
						<form action="#" method="post">
							<div class="input-group mb-3">
								<input type="text" class="form-control bg-transparent"
									placeholder="Enter Email" aria-label="Enter Email"
									aria-describedby="button-addon2">
								<div class="input-group-append">
									<button class="btn btn-primary text-white" type="button"
										id="button-addon2">Send</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="row pt-5 mt-5">
					<div class="col-12 text-md-center text-left">
						<p>
							<!-- Link back to Free-Template.co can't be removed. Template is licensed under CC BY 3.0. -->
							&copy; 2020 <strong class="text-black">Browse</strong> Free
							Template. All Rights Reserved. <br> Design by <a
								href="https://free-template.co/" target="_blank"
								class="text-black">Free-Template.co</a>
						</p>
					</div>
				</div>
			</div>
		</footer>
	</div>


	<script src="/resources/main/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/main/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="/resources/main/js/jquery-ui.js"></script>
	<script src="/resources/main/js/popper.min.js"></script>
	<script src="/resources/main/js/bootstrap.min.js"></script>
	<script src="/resources/main/js/owl.carousel.min.js"></script>
	<script src="/resources/main/js/jquery.stellar.min.js"></script>
	<script src="/resources/main/js/jquery.countdown.min.js"></script>
	<script src="/resources/main/js/jquery.magnific-popup.min.js"></script>
	<script src="/resources/main/js/bootstrap-datepicker.min.js"></script>
	<script src="/resources/main/js/aos.js"></script>
	<script src="/resources/main/js/rangeslider.min.js"></script>

	<script src="/resources/main/js/main.js"></script>
</body>
</html>
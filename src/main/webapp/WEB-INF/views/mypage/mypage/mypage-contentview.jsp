<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<link rel="stylesheet" href="/resources/main/fonts/icomoon/style.css">

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
<script src="/resources/main/js/pet_reg.js"></script>
<script src="/resources/main/js/jquery-migrate-3.0.1.min.js"></script>
<script src="/resources/main/js/jquery-ui.js"></script>
<script src="/resources/main/js/popper.min.js"></script>
<script src="/resources/main/js/bootstrap.min.js"></script>
<script src="/resources/main/js/owl.carousel.min.js"></script>
<script src="/resources/main/js/jquery.stellar.min.js"></script>
<script src="/resources/main/js/jquery.countdown.min.js"></script>
<script src="/resources/main/js/jquery.magnific-popup.min.js"></script>
<script src="/resources/main/js/bootstrap-datepicker.min.js"></script>

<script src="/resources/main/js/rangeslider.min.js"></script>
<script src="/resources/main/js/api.js"></script>

</head>
<style>
input {
	border-color: pink;
	border: 1px solid #333;
}

#box1 {
	position: relative;
	top: 60px;
	border: 1px solid black;
	width: 900px;
	height: 600px;
	margin: auto;
}

#box2 {
	position: relative;
	top: 5px;
	border: 1px solid black;
	width: 400px;
	height: 400px;
	margin: 40px;
}

#box3 {
	border: 1px solid black;
}

#box4 {
	position: relative;
	top: 5px;
	margin: 40px;
	float: right;
	width: 400px;
	height: 400px;
	border: 1px solid red;
}
</style>
<script>
	$(function() {
		$("#del").on("click", function() {
			var del = confirm("삭제하시겠습니까");
			if (del == true) {
				location.href = "/mypage/petdel?seq=${dto.petseq}"
			} else {
				return false;
			}
		})

		$("#mod").on(
				"click",
				function() {

					location.href='/mypage/modfiy?seq=${dto.petseq}'
					

				})

	})
</script>
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
								<li class="active"><a href="#"> <span>Home</span>
								</a></li>
								<li class="active"><a href="#"> <span>AboutUs</span>
								</a></li>
								<li><a href="test"> <span>PetService</span>
								</a></li>
								<li><a href="#"> <span>About</span>
								</a></li>
								<li><a href="/mypage/mypage"> <span>MyPage</span>
								</a></li>
								<li><a href="#"> <span>Sing Up</span>
								</a></li>
								<li><a href="#"> <span>Login</span>
								</a></li>
							</ul>
						</nav>
					</div>

					<div class="d-inline-block d-xl-none ml-md-0 mr-auto py-3"
						style="position: relative; top: 3px;">
						<a href="#" class="site-menu-toggle js-menu-toggle text-white">
							<span class="icon-menu h3"></span>
						</a>
					</div>

				</div>

			</div>
		</header>

		<div class="site-blocks-cover inner-page-cover overlay"
			style="background-image: url(/resources/main/images/dig.jpg);"
			data-aos="fade">
			<div class="container">
				<div
					class="row align-items-center justify-content-center text-center">

					<div class="col-md-10" data-aos="fade-up" data-aos-delay="400">

						<div class="row justify-content-center">
							<div class="col-md-8 text-center">
								<h1>마이펫페이지_한 마리 view /등록/수정</h1>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>


		<div class="site-section">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">

						<div class="mb-5 border-bottom pb-5">

							<div class="mb-5 border-bottom pb-5">
								<div class="d-block d-md-flex listing-horizontal">
									<div class="lh-content">

										<div class="border p-3 rounded mb-2">
											<div>펫 소개</div>
											<div style="position: relative; float: left;">
												<img src="/upload/${dto.pet_photo}"
													style="width: 300px; height: 300px;">
											</div>
											<div style="display: inline-block; padding: 30px;">
												<p class="mb-0">
													펫 이름 : <label>${dto.pet_name}</label>
												</p>
												<p class="mb-0">
													성별 : <label>${dto.pet_gender}</label>
												</p>
												<p class="mb-0">
													중성호 여부 : <label>${dto.pet_ox}</label>
												</p>
												<p class="mb-0">
													펫 나이 : <label>${dto.pet_age}</label>
												</p>
												<p class="mb-0">
													견종 : <label>${dto.pet_sort}</label>
												</p>
												<p class="mb-0">
													펫 크기 : <label>${dto.pet_type}</label>
												</p>
												<p class="mb-0">
													동거여부 : <label>${dto.pet_family}</label>
												</p>
												<p class="mb-0">
													종류(개인지 고양이 인지) : <label>${dto.pet_animal}</label>
												</p>
												<p class="mb-0">
													반려견 성격 : <label>${dto.pet_character}</label>
												</p>
												<p class="mb-0">
													특이사항 : <label>${dto.pet_details}</label>
												</p>

											</div>


										</div>

									</div>

								</div>

								<button type="button" id="del" class="btn btn-danger "
									style="border-radius: 5px; float: right;">삭제하기</button>
								<button type="button" id="mod" class="btn btn-success "
									style="border-radius: 5px; float: right;">수정하기</button>
							</div>


							<h2 class="mb-5 text-primary">자신의 나머지 펫</h2>

							<div class="d-block d-md-flex listing-horizontal">

								<a href="#" class="img d-block"
									style="background-image: url('images/img_2.jpg')"> <span
									class="category">Restaurants</span>
								</a>

								<div class="lh-content">
									<a href="#" class="bookmark"><span class="icon-heart"></span></a>
									<h3>
										<a href="#">Jones Grill &amp; Restaurants</a>
									</h3>
									<p>Don St, Brooklyn, New York</p>
									<p>
										<span class="icon-star text-warning"></span> <span
											class="icon-star text-warning"></span> <span
											class="icon-star text-warning"></span> <span
											class="icon-star text-warning"></span> <span
											class="icon-star text-secondary"></span> <span>(492
											Reviews)</span>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="py-5 bg-primary">
				<div class="container">
					<div class="row">
						<div class="col-lg-7 mr-auto mb-4 mb-lg-0">
							<h2 class="mb-3 mt-0 text-white">Let's get started. Create
								your account</h2>
							<p class="mb-0 text-white">Far far away, behind the word
								mountains, far from the countries Vokalia and Consonantia, there
								live the blind texts.</p>
						</div>
						<div class="col-lg-4">
							<p class="mb-0">
								<a href="signup.html"
									class="btn btn-outline-white text-white btn-md px-5 font-weight-bold btn-md-block">Sign
									Up</a>
							</p>
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
							<a href="#" class="pl-0 pr-3"> <span class="icon-facebook"></span>
							</a> <a href="#" class="pl-3 pr-3"> <span class="icon-twitter"></span>
							</a> <a href="#" class="pl-3 pr-3"> <span class="icon-instagram"></span>
							</a> <a href="#" class="pl-3 pr-3"> <span class="icon-linkedin"></span>
							</a>
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

		</div>






		<div class="row pt-5 mt-5">
			<div class="col-12 text-md-center text-left">
				<p>
					<!-- Link back to Free-Template.co can't be removed. Template is licensed under
                                                                                                                                                CC BY 3.0. -->
					&copy; 2020 <strong class="text-black">Browse</strong> Free
					Template. All Rights Reserved. <br> Design by <a
						href="https://free-template.co/" target="_blank"
						class="text-black">Free-Template.co</a>
				</p>
			</div>
		</div>

	</footer>

	<script src="/resources/main/js/aos.js"></script>
	<script src="/resources/main/js/main.js"></script>
</body>
</html>
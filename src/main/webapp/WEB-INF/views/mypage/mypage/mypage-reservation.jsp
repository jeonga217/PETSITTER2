<<<<<<< HEAD:RETSITTER/src/main/webapp/WEB-INF/views/mypage/mypage-reservation.jsp
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
<link rel="stylesheet" href="/resources/main/css/owl.theme.default.min.css">

<link rel="stylesheet" href="/resources/main/css/bootstrap-datepicker.css">

<link rel="stylesheet" href="/resources/main/fonts/flaticon/font/flaticon.css">

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
<link rel="stylesheet" type="text/css" href="/resources/main/css1/util.css">
<link rel="stylesheet" type="text/css" href="/resources/main/css1/main.css">

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
<script>
	$(function() {
		function block(obj) {
			var a = $("#type").val().replace(/ /gi, '');
			$("#type").val(a);
		}

		$(function() {
			$('textarea.texts').keyup(function() {
				bytesHandler(this, "character");
			});
			$('textarea.texts1').keyup(function() {
				bytesHandler(this, "special");
			});
			$('input.name').keyup(function() {
				bytesHandler(this, "name");
			});
		});

		function getTextLength(str) {
			var len = 0;

			for (var i = 0; i < str.length; i++) {
				if (escape(str.charAt(i)).length == 6) {
					len++;
				}
				len++;
			}
			return len;
		}

		function bytesHandler(obj, k) {
			var text = $(obj).val();
			if (k == "character") {
				if (getTextLength(text) > 3000) {
					alert("반려견 성격에서 3000글자를 넘었습니다 내용을 줄여 주세요");
					return false;
				} else {
					$('label.bytes1').text(getTextLength(text));
				}

			} else if (k == "special") {
				if (getTextLength(text) > 3000) {
					alert("특이사항에서 3000글자를 넘었습니다 내용을 줄여 주세요");
					return false;
				} else {
					$('label.bytes2').text(getTextLength(text));
				}

			} else if (k == "name") {
				if (getTextLength(text) > 300) {
					alert("이름에서 300글자를 넘었습니다 내용을 줄여 주세요");
					var name = $("#name").val("");
					return false;
				} else {
					$('label.bytes3').text(getTextLength(text));
				}

			}

		}

	})
</script>
<style>
input {
	border-color: pink;
	border: 1px solid #333;
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
								<li class="active"><a href="#"> <span>Home</span>
								</a></li>
								<li class="active"><a href="#"> <span>AboutUs</span>
								</a></li>
								<li><a href="test"> <span>PetService</span>
								</a></li>
								<li><a href="#"> <span>About</span>
								</a></li>
								<li><a href="mypage"> <span>MyPage</span>
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

		<div class="site-section bg-light" style="background-color: black">
			<div class="container">

				<form action="/mypage/mypet_reg" method="post" enctype="multipart/form-data">
				<div class="d-block d-md-flex listing-horizontal">
					<div class="lh-content">

							<div class="form-group">
								<label for="exampleInputEmail1">이름</label> <input type="text"
									class="form-control name" id="name" name="pet_name"
									aria-describedby="emailHelp">
								<div style="position: relative; float: right;">
									글자수 제한 : <label class="bytes3">0</label>/300
								</div>
							</div>

							<div class="form-group">
								<label for="exampleFormControlFile1">파일업로드</label> <input
									type="file" class="form-control-file"
									accept="image/gif,image/jpeg,image/png" id="upload" name="img">
								<div id='preview'>
									<!-- 미리보기 공간 -->
								</div>
							</div>



							<div class="mb-3">
								<label for="username">성별</label>
								<div>
									<input type="radio" style="display: inline-block;"
										id="gender_f" name="pet_gender" value="F">&nbsp;수컷 <input
										type="radio" style="display: inline-block;" id="gender_m"
										name="pet_gender" value="M">&nbsp;암컷
								</div>
							</div>


							<div class="mb-3">
								<label for="username">중성화 여부</label>
								<div>
									<input type="radio" style="display: inline-block;"
										id="castration" name="pet_ox" value="y">&nbsp;유
									<input type="radio" style="display: inline-block;"
										id="castration" name="pet_ox" value="n">&nbsp;무
								</div>
							</div>
							


							<div class="form-group">
								<label for="exampleInputPassword1">펫나이</label> <input
									type="text" class="form-control" id="petage" name="pet_age">
							</div>
							
							
							<div class="mb-3">
								<label for="username">개인지 고양이 인지</label>
								<div>
									<input type="radio" style="display: inline-block;"
										id="castration" name="pet_animal" value="dog">&nbsp;개
									<input type="radio" style="display: inline-block;"
										id="castration" name="pet_animal" value="cat">&nbsp;고양이
								</div>
							</div>
							
							<div class="mb-3">
								<label for="username">펫 크기</label>
								<div>
									<input type="radio" style="display: inline-block;"
										id="castration" name="pet_type" value="소">&nbsp;소
									<input type="radio" style="display: inline-block;"
										id="castration" name="pet_type" value="중">&nbsp;중
										<input type="radio" style="display: inline-block;"
										id="castration" name="pet_type" value="대">&nbsp;대
								</div>
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">견종</label> <input type="text"
									name="pet_sort" class="form-control" id="type"
									onkeyup="block(this);">
							</div>



							<div class="mb-3">
								<label for="username">동거여부</label>
								<div>
									<input type="radio" style="display: inline-block;" id="living"
										name="pet_family" value="M">&nbsp;유 <input type="radio"
										style="display: inline-block;" id="living" name="pet_family"
										value="F">&nbsp;무
								</div>
							</div>

							<div class="form-group">
								<label for="exampleFormControlTextarea1">반려견성격</label>
								<textarea class="form-control texts" id="Person" rows="3"
									style="width: 100%; height: 361px; resize: none;"
									name="pet_character"></textarea>
								<div style="position: relative; float: right;">
									글자수 제한 : <label class="bytes1">0</label>/3000
								</div>
							</div>

							<div class="form-group">
								<label for="exampleFormControlTextarea1">특이사항</label><br>

								<textarea class="form-control texts1" id="special" rows="3"
									style="width: 100%; height: 361px; resize: none;"
									id="special" name="pet_details"></textarea>
								<div style="position: relative; float: right;">
									글자수 제한 : <label class="bytes2">0</label>/3000
								</div>
							</div>
					</div>
				</div>

				<input type="submit" class="btn btn-primary" id="re"
					oninput="numberMaxLength(this);" value="등록하기">
				<button type="button" class="btn btn-secondary">뒤로가기</button>
			</form>
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
			</div>
		</footer>
		</div>
		<script src="/resources/main/js/aos.js"></script>
		<script src="/resources/main/js/main.js"></script>
</body>
=======
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
<link rel="stylesheet" href="/resources/main/css/owl.theme.default.min.css">

<link rel="stylesheet" href="/resources/main/css/bootstrap-datepicker.css">

<link rel="stylesheet" href="/resources/main/fonts/flaticon/font/flaticon.css">

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
<link rel="stylesheet" type="text/css" href="/resources/main/css1/util.css">
<link rel="stylesheet" type="text/css" href="/resources/main/css1/main.css">

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
<script>
	$(function() {
		function block(obj) {
			var a = $("#type").val().replace(/ /gi, '');
			$("#type").val(a);
		}

		$(function() {
			$('textarea.texts').keyup(function() {
				bytesHandler(this, "character");
			});
			$('textarea.texts1').keyup(function() {
				bytesHandler(this, "special");
			});
			$('input.name').keyup(function() {
				bytesHandler(this, "name");
			});
		});

		function getTextLength(str) {
			var len = 0;

			for (var i = 0; i < str.length; i++) {
				if (escape(str.charAt(i)).length == 6) {
					len++;
				}
				len++;
			}
			return len;
		}

		function bytesHandler(obj, k) {
			var text = $(obj).val();
			if (k == "character") {
				if (getTextLength(text) > 3000) {
					alert("반려견 성격에서 3000글자를 넘었습니다 내용을 줄여 주세요");
					return false;
				} else {
					$('label.bytes1').text(getTextLength(text));
				}

			} else if (k == "special") {
				if (getTextLength(text) > 3000) {
					alert("특이사항에서 3000글자를 넘었습니다 내용을 줄여 주세요");
					return false;
				} else {
					$('label.bytes2').text(getTextLength(text));
				}

			} else if (k == "name") {
				if (getTextLength(text) > 300) {
					alert("이름에서 300글자를 넘었습니다 내용을 줄여 주세요");
					var name = $("#name").val("");
					return false;
				} else {
					$('label.bytes3').text(getTextLength(text));
				}

			}

		}

	})
</script>
<style>
input {
	border-color: pink;
	border: 1px solid #333;
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
								<li class="active"><a href="#"> <span>Home</span>
								</a></li>
								<li class="active"><a href="#"> <span>AboutUs</span>
								</a></li>
								<li><a href="test"> <span>PetService</span>
								</a></li>
								<li><a href="#"> <span>About</span>
								</a></li>
								<li><a href="mypage"> <span>MyPage</span>
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

		<div class="site-section bg-light" style="background-color: black">
			<div class="container">

				<form action="/mypage/mypet_reg" method="post" enctype="multipart/form-data">
				<div class="d-block d-md-flex listing-horizontal">
					<div class="lh-content">

							<div class="form-group">
								<label for="exampleInputEmail1">이름</label> <input type="text"
									class="form-control name" id="name" name="pet_name"
									aria-describedby="emailHelp">
								<div style="position: relative; float: right;">
									글자수 제한 : <label class="bytes3">0</label>/300
								</div>
							</div>

							<div class="form-group">
								<label for="exampleFormControlFile1">파일업로드</label> <input
									type="file" class="form-control-file"
									accept="image/gif,image/jpg,image/png" id="upload" name="img">
								<div id='preview'>
									<!-- 미리보기 공간 -->
								</div>
							</div>



							<div class="mb-3">
								<label for="username">성별</label>
								<div>
									<input type="radio" style="display: inline-block;"
										id="gender_f" name="pet_gender" value="F">&nbsp;수컷 <input
										type="radio" style="display: inline-block;" id="gender_m"
										name="pet_gender" value="M">&nbsp;암컷
								</div>
							</div>


							<div class="mb-3">
								<label for="username">중성화 여부</label>
								<div>
									<input type="radio" style="display: inline-block;"
										id="castration" name="pet_ox" value="F">&nbsp;유
									<input type="radio" style="display: inline-block;"
										id="castration" name="pet_ox" value="F">&nbsp;무
								</div>
							</div>
							


							<div class="form-group">
								<label for="exampleInputPassword1">펫나이</label> <input
									type="text" class="form-control" id="petage" name="pet_age">
							</div>
							
							
							<div class="mb-3">
								<label for="username">개인지 고양이 인지</label>
								<div>
									<input type="radio" style="display: inline-block;"
										id="castration" name="pet_animal" value="F">&nbsp;개
									<input type="radio" style="display: inline-block;"
										id="castration" name="pet_animal" value="F">&nbsp;고양이
								</div>
							</div>
							
							<div class="mb-3">
								<label for="username">펫 크기</label>
								<div>
									<input type="radio" style="display: inline-block;"
										id="castration" name="pet_type" value="소">&nbsp;소
									<input type="radio" style="display: inline-block;"
										id="castration" name="pet_type" value="중">&nbsp;중
										<input type="radio" style="display: inline-block;"
										id="castration" name="pet_type" value="대">&nbsp;대
								</div>
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">견종</label> <input type="text"
									name="pet_sort" class="form-control" id="type"
									onkeyup="block(this);">
							</div>



							<div class="mb-3">
								<label for="username">동거여부</label>
								<div>
									<input type="radio" style="display: inline-block;" id="living"
										name="pet_family" value="F">&nbsp;유 <input type="radio"
										style="display: inline-block;" id="living" name="pet_family"
										value="F">&nbsp;무
								</div>
							</div>

							<div class="form-group">
								<label for="exampleFormControlTextarea1">반려견성격</label>
								<textarea class="form-control texts" id="Person" rows="3"
									style="width: 1110px; height: 361px; resize: none;"
									name="pet_character"></textarea>
								<div style="position: relative; float: right;">
									글자수 제한 : <label class="bytes1">0</label>/3000
								</div>
							</div>

							<div class="form-group">
								<label for="exampleFormControlTextarea1">특이사항</label><br>

								<textarea class="form-control texts1" id="special" rows="3"
									style="width: 1110px; height: 361px; resize: none;"
									id="special" name="pet_details"></textarea>
								<div style="position: relative; float: right;">
									글자수 제한 : <label class="bytes2">0</label>/3000
								</div>
							</div>
					</div>
				</div>

				<input type="submit" class="btn btn-primary" id="re"
					oninput="numberMaxLength(this);" value="등록하기">
				<button type="button" class="btn btn-secondary">뒤로가기</button>
			</form>
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
			</div>
		</footer>
		</div>
		<script src="/resources/main/js/aos.js"></script>
		<script src="/resources/main/js/main.js"></script>
</body>
>>>>>>> b2951192f15074ad7e1f045f7cf5b29481d3ebff:src/main/webapp/WEB-INF/views/mypage/mypage-reservation.jsp
</html>
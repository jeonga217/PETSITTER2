<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
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
<script>
	$(function() {

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
				if (getTextLength(text) > 1000) {
					alert("반려견 성격에서 1000글자를 넘었습니다 내용을 줄여 주세요");
					return false;
				} else {
					$('label.bytes1').text(getTextLength(text));
				}

			} else if (k == "special") {
				if (getTextLength(text) > 1000) {
					alert("특이사항에서 1000글자를 넘었습니다 내용을 줄여 주세요");
					return false;
				} else {
					$('label.bytes2').text(getTextLength(text));
				}

			} else if (k == "name") {
				if (getTextLength(text) > 100) {
					alert("이름에서 100글자를 넘었습니다 내용을 줄여 주세요");
					var name = $("#name").val("");
					return false;
				} else {
					$('label.bytes3').text(getTextLength(text));
				}

			}

		}
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

						<div class="mb-5 pb-5">

							<div class="mb-5 pb-5">
								<div>
								
										<div class="d-block d-md-flex listing-horizontal">
											<div class="lh-content">

												<div class="border p-3 rounded mb-2">
													<div style="position: relative; float: left;">
														<img src="/upload/${modresult.pet_photo}"
														class="mb-5 pb-5" style="width: 50%; height: 50%;">

													</div>

													<br>
													<form action="/mypage/resultmodfiy" method="post"
														enctype="multipart/form-data">
														<input type="hidden" name="petseq"
															value="${modresult.petseq}">
														<div class="form-group">
															<input type="hidden" value="${modresult.petseq}">
															
															<div>
															<div>펫 이름</div>
																<input type="text" name="pet_name"
																	class="form-control name" value="${modresult.pet_name}"
																	aria-describedby="emailHelp"> 글자수 제한 : <label
																	class="bytes3">0</label>/100
															</div>
															<div class="form-group">
																<label for="exampleFormControlFile1">파일업로드</label> <input
																	type="file" class="form-control-file"
																	accept="image/gif,image/jpeg,image/png" name="img">
															</div>
															성별
															<div class="select-wrap">
																<span class="icon"><span
																	class="icon-keyboard_arrow_down"></span></span> <select
																	class="form-control" name="pet_gender">
																	<option value="F">수컷</option>
																	<option value="M">암컷</option>
																</select>
															</div>
															중성화 여부
															<div class="select-wrap">
																<span class="icon"><span
																	class="icon-keyboard_arrow_down"></span></span> <select
																	class="form-control" name="pet_ox">
																	<option value="y">유</option>
																	<option value="n">무</option>
																</select>
															</div>
															펫 나이 <input type="text" name="pet_age"
																class="form-control" value="${modresult.pet_age}"
																aria-describedby="emailHelp"> 견종
															<div class="select-wrap">
																<span class="icon"><span
																	class="icon-keyboard_arrow_down"></span></span> <select
																	class="form-control" name="pet_sort">
																	<option value="dog">개</option>
																	<option value="cat">고양이</option>
																</select>
															</div>
															펫 크기
															<div class="select-wrap">
																<span class="icon"><span
																	class="icon-keyboard_arrow_down"></span></span> <select
																	class="form-control" name="pet_type">
																	<option value="소">소</option>
																	<option value="중">중</option>
																	<option value="대">대</option>
																</select>
															</div>


															동거여부
															<div class="select-wrap">
																<span class="icon"><span
																	class="icon-keyboard_arrow_down"></span></span> <select
																	class="form-control" name="pet_family">
																	<option value="y">유</option>
																	<option value="n">무</option>
																</select>
															</div>

															종류(개인지 고양이 인지)
															<div class="select-wrap">
																<span class="icon"><span
																	class="icon-keyboard_arrow_down"></span></span> <select
																	class="form-control" name="pet_animal">
																	<option value="dog">개</option>
																	<option value="cat">고양이</option>
																</select>
															</div>

															<div class="form-group">
																반려견 성격
																<textarea class="form-control texts" rows="3"
																	name="pet_character"
																	style="resize: none; height: 300px;">${modresult.pet_character}</textarea>
															</div>
															글자수 제한 : <label class="bytes1">0</label>/1000
															<div class="form-group">
																특이사항
																<textarea class="form-control texts1" rows="3"
																	name="pet_details" style="resize: none; height: 300px;">${modresult.pet_details}</textarea>
															</div>
															글자수 제한 : <label class="bytes2">0</label>/1000
														</div>
														<button type="submit" class="btn btn-primary">수정완료</button>
													</form>

												</div>


											</div>

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
									<a href="#" class="pl-0 pr-3"> <span class="icon-facebook"></span>
									</a> <a href="#" class="pl-3 pr-3"> <span class="icon-twitter"></span>
									</a> <a href="#" class="pl-3 pr-3"> <span
										class="icon-instagram"></span>
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
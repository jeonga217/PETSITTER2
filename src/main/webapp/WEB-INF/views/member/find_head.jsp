<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="/resources/main/css/bootstrap-datepicker.css">
<!-- 	<link rel="stylesheet" href="/resources/main/css/bootstrap.min.css"> -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Rubik:400,700"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/main/fonts/icomoon/style.css">
<link rel="stylesheet" href="/resources/main/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/main/css/jquery-ui.css">
<link rel="stylesheet" href="/resources/main/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="/resources/main/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="/resources/main/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="/resources/main/css/aos.css">
<link rel="stylesheet" href="/resources/main/css/rangeslider.css">
<link rel="stylesheet" href="/resources/main/css/style.css">



<link href="/resources/mb/icofont/icofont.min.css" rel="stylesheet">
<link href='https://unpkg.com/boxicons@2.0.5/css/boxicons.min.css'
	rel='stylesheet'>
<script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment-with-locales.min.js"></script>
<!-- CSS only -->
<link rel="stylesheet"	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">



<!--===============================================================================================-->
<link rel="stylesheet"
	href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet"
	href="/resources/member/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet"
	href="/resources/member/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet"
	href="/resources/member/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet"
	href="/resources/member/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet"
	href="/resources/member/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" href="/resources/member/css/util.css">
<link rel="stylesheet" href="/resources/member/css/main.css">
<!--===============================================================================================-->


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

		<div class="container-fluid" style="padding:0 100px;">
			<div class="row align-items-center">

				<!-- 통합헤더 -->

				<div class="col-12 col-xl-2">
					<h1 class="mb-2 site-logo">
						<a href="/"><img src="/resources/images/dogss.png"
							style="width: 250px; height: 60px;"></a>
					</h1>
				</div>
                     <div class="col-12 col-md-10 d-none d-xl-block">
								<nav class="site-navigation position-relative text-right"
									role="navigation">
									<ul class="site-menu js-clone-nav mr-auto d-none d-lg-block">
										<li><a href="/admin/adminindex"><span>팀소개</span></a></li>
										<li><a href="#introduce"><span>서비스소개</span></a></li>
										<li><a data-toggle="modal" href="#login1"><span>로그인</span></a></li>
										<li><a href="/member/signup"><span>회원가입</span></a></li>
									</ul>
								</nav>
							</div>
									<div class="modal fade" id="login1" data-keyboard="false"
								tabindex="-1" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-body">
											<div class="limiter">
												<div class="container-login100">
													<div class="wrap-login100">
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
														<form class="login100-form validate-form"
															action="/member/loginProc" name="loginProc" method="post">
															<span class="logo100 p-10">
																<p class="logo">
																	<span class="lnr lnr-paw"></span>뭐하냥 도와주개
																</p>
															</span> <span class="login100-form-title p-b-23"> LOGIN </span>
															<div class="wrap-input100 validate-input"
																data-validate="ID를 입력하세요.">
																<input class="input100" type="text" name="mem_id">
																<span class="focus-input100"></span> <span
																	class="label-input100">ID</span>
															</div>

															<div class="wrap-input100 validate-input"
																data-validate="비밀번호를 입력하세요.">
																<input class="input100" type="password" name="mem_pw">
																<span class="focus-input100"></span> <span
																	class="label-input100">Password</span>
															</div>
															<div class="flex-sb-m w-full p-t-3 p-b-32">
																<div class="contact100-form-checkbox">
																	<a href="/member/findInfo" class="txt1"> Forgot
																		ID/Password? </a>
																</div>
																<div>
																	<a href="/member/signup" class="txt1"> Sign Up </a>
																</div>
															</div>


															<div class="container-login100-form-btn">
																<button class="login100-form-btn"  type="button" id="login">Login</button>
															</div>
															<div class="text-center p-t-46 p-b-20">
																<span class="txt2"> OR SNS LOGIN </span>
															</div>

															<div class="login100-form-social flex-c-m bg2 m-r-5">
																<a class="btns"
																	href="https://kauth.kakao.com/oauth/authorize?client_id=4dd67a91f5b80223eb0934cae5fa4c50&redirect_uri=http://192.168.60.13/member/kakao&response_type=code">
																	<span><img
																		src="/resources/member/images/kakao_icon.png"></span> <span
																	class="txt3">Kakao Login</span>
																</a> <a class="btns" href="/member/naver"> <span><img
																		src="/resources/member/images/naver_icon.PNG"
																		width="34px" height="35px"></span> <span class="txt3">Naver
																		Login</span>
																</a>
															</div>
														</form>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
				<!-- 끝 -->
				<div class="d-inline-block d-xl-none ml-md-0 mr-auto py-3"
					style="position: relative; top: 3px;">
					<a href="#" class="site-menu-toggle js-menu-toggle text-white"><span
						class="icon-menu h3"></span></a>
				</div>
			</div>
		</div>
	</header>



	<div class="site-blocks-cover inner-page-cover overlay"
		style="background-image: url(/resources/member/images/find.jpg);"
		data-aos="fade" data-stellar-background-ratio="0.5">	
	</div>
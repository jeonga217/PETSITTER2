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
<script>
$(function(){
	$(".report").on("click",function(){
		 window.open("/mypage/report","","width=400,height=400");
	})
	
	$(".praise").on("click",function(){
		location.href='/board/board_single_view?reserve_seq';
	})
})
</script>
<style>
td {
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

			<div class="container-fluid" style="padding: 0 100px;">
				<div class="row align-items-center">
					<div class="col-12 col-xl-2">
						<h1 class="mb-2 site-logo">

							<c:choose>
								<c:when
									test="${loginInfo.mem_id eq '관리자' && loginInfo.mem_address1 eq 'admin_address'}">
									<a href="#"><img src="resources/images/dogss.png"
										style="width: 250px; height: 60px;"></a>
								</c:when>
								<c:otherwise>
									<a href="index.html"><img src="/resources/images/dogss.png"
										style="width: 250px; height: 60px;"></a>
								</c:otherwise>
							</c:choose>

						</h1>
					</div>
					<c:choose>
						<c:when test="${empty loginInfo}">
							<div class="col-12 col-md-10 d-none d-xl-block">
								<nav class="site-navigation position-relative text-right"
									role="navigation">
									<ul class="site-menu js-clone-nav mr-auto d-none d-lg-block">
										<li><a href="/admin/adminindex"><span>팀소개</span></a></li>
										<li><a href="#introduce"><span>서비스소개</span></a></li>
										<li><a data-toggle="modal" href="#login"><span>로그인</span></a></li>
										<li><a href="/member/signup"><span>회원가입</span></a></li>
									</ul>
								</nav>
							</div>
							<!-- 로그인-->
							<div class="modal fade" id="login" data-keyboard="false"
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
																<button class="login100-form-btn" type="submit">Login</button>
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
						</c:when>
						<c:otherwise>
							<div class="col-12 col-md-10 d-none d-xl-block">
								<nav class="site-navigation position-relative text-right"
									role="navigation">
									<ul class="site-menu js-clone-nav mr-auto d-none d-lg-block">

										<li><a href="/mypage/Introduction"><span>포인트
													충전소<i class="icofont-money icofont-1x"
													style="color: #17a2b8; padding-right: 8px"></i>
											</span></a></li>
										<li><a href="/mypage/mypage"><span>MY PAGE<i
													class="icofont-live-messenger icofont-1x"
													style="color: #17a2b8; padding-right: 8px"></i></span></a></li>
										<li><a href="/message/recievelist"
											onclick="window.open(this.href,'_blank','width=600, height=600, scrollbars=yes'); return false;">메세지<i
												class="icofont-envelope icofont-1x" style="color: #17a2b8"></i></a></li>

										<li><a href="/member/logout"><span>LOGOUT</span></a></li>
									</ul>
								</nav>
							</div>
							<div class="col-12 col-md-12 d-none d-xl-block">
								<nav class="site-navigation position-relative text-right"
									role="navigation">
									<ul class="site-menu js-clone-nav mr-auto d-none d-lg-block">
										<li><a href="/admin/adminindex"><span
												style="font-size: 20px">팀 소개</span></a></li>
										<li><a href="/mb/mb_board?cpage=1"><span
												style="font-size: 20px">방문 돌봄</span></a></li>
										<li><a href="/board/outputList"><span
												style="font-size: 20px">위탁 돌봄</span></a></li>
										<li><a href="/community/list"><span
												style="font-size: 20px">게시판</span></a></li>

									</ul>
								</nav>
							</div>
						</c:otherwise>
					</c:choose>
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

								펫시터 테이블
								<table>
									<thead>
										<tr class="table100-head">
											<th class="column1">서비스신청날짜</th>
											<th class="column2">서비스이용날짜</th>
											<th class="column3">적립포인트</th>
											<th class="column3">예약번호</th>
											<th class="column3">서비스이용상태</th>
											<th class="column3">신고하기</th>
											<th class="column3">칭찬하기</th>
											<th class="column3">펫시터일지쓰기</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="i" items="${bdto}">
											<tr>
												<td>${i.reserve_day}
												<td>${i.start_day}~${i.end_day}
												<td>${i.reserve_point}
												<td>${i.reserve_seq}
												<td class="status">${i.status}
												<td><button type="button" class="btn btn-danger report">신고하기</button>
												<td><button type="button" class="btn btn-primary praise">칭찬
												하기</button>
												<td><button type="button" class="btn btn-success diaryread">펫시터일지보기</button>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								
								
								
									반려인 테이블
								<table>
									<thead>
										<tr class="table100-head">
											<th class="column1">서비스신청날짜</th>
											<th class="column2">서비스이용날짜</th>
											<th class="column3">사용포인트</th>
											<th class="column3">예약번호</th>
											<th class="column3">서비스이용상태</th>
											<th class="column3">펫시터일지쓰기</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="i" items="${bdto}">
											<tr>
												<td>${i.reserve_day}
												<td>${i.start_day}~${i.end_day}
												<td>${i.reserve_point}
												<td>${i.reserve_seq}
												<td class="status">${i.status}
												<td><button type="button" class="btn btn-success diarywrite">펫시터일지쓰기</button>
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
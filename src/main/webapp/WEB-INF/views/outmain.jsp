
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<link rel="stylesheet" href="resources/main/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/main/css/magnific-popup.css">
<link rel="stylesheet" href="resources/main/css/jquery-ui.css">
<link rel="stylesheet" href="resources/main/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="resources/main/css/owl.theme.default.min.css">

<link rel="stylesheet"
	href="resources/main/css/bootstrap-datepicker.css">

<link rel="stylesheet"
	href="resources/main/fonts/flaticon/font/flaticon.css">

<link rel="stylesheet" href="resources/main/css/aos.css">
<link rel="stylesheet" href="resources/main/css/rangeslider.css">

<link rel="stylesheet" href="resources/main/css/style.css">

<link href="/resources/mb/icofont/icofont.min.css" rel="stylesheet">
<link href='https://unpkg.com/boxicons@2.0.5/css/boxicons.min.css'
	rel='stylesheet'>
<script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment-with-locales.min.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

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

</head>

</head>
<style>
.number:hover {
	background-color: aquamarine;
}

#register_btn {
	margin-top: 20px;
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
							<c:when test="${loginInfo.mem_id eq '관리자' && loginInfo.mem_address1 eq 'admin_address'}">
								<a href="/admin/adminindex"><img src="resources/images/dogss.png"
								style="width: 250px; height: 60px;"></a>
							</c:when>
							<c:otherwise>
								<a href="index.html"><img src="resources/images/dogss.png"
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
										<li><a data-toggle="modal" href="#login1"><span>로그인</span></a></li>
										<li><a href="/member/signup"><span>회원가입</span></a></li>
									</ul>
								</nav>
							</div>
							<!-- 로그인-->
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
																<button class="login100-form-btn" type="button" id="login">Login</button>
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

										<li><a href="/member/login"><span>포인트 충전소<i class="icofont-money icofont-1x" style="color: #17a2b8;padding-right: 8px"></i></span></a></li>
										<li><a href="/mypage/mypage"><span>MY PAGE<i class="icofont-live-messenger icofont-1x" style="color: #17a2b8;padding-right: 8px"></i></span></a></li>
										<li><a href="/message/recievelist" onclick="window.open(this.href,'_blank','width=600, height=600, scrollbars=yes'); return false;"><span>메세지<i
												class="icofont-envelope icofont-1x" style="color: #17a2b8"></i></span></a></li>

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
										<li><a href="/mb/mb_board"><span
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



		<div class="site-blocks-cover overlay"
			style="background-image: url(resources/main/images/outmain_img.jpg);"
			data-aos="fade" data-stellar-background-ratio="0.5">
			<div class="container">
				<div
					class="row align-items-center justify-content-center text-center">
					<div class="col-md-10">
						<div class="row justify-content-center mb-4">
							<div class="col-md-10 text-center">
								<h1 data-aos="fade-up">뭐하냥 도와주개</h1>
								<h1 data-aos="fade-up">
									<span class="typed-words"></span>
								</h1>
							</div>
							<c:if test="${!empty loginInfo}">
								<button id="register_btn"
									class="btn btn-primary text-#878786 btn-md px-5 font-weight-bold btn-md-block">펫시터
									지원하기</button>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section" id="introduce">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-md-6">
						<img src="/resources/main/images/outmain_m1.jpg"
							alt="Free website template by Free-Template.co"
							class="img-fluid rounded">
					</div>
					<div class="col-md-5 ml-auto">
						<h2 class="text-primary mb-3">#맞춤 펫시터가 집으로 방문</h2>
						<p>검증된 방문펫시터가 깨끗한 환경과 안전한 산책을 책임집니다.</p>
						<ul class="ul-check list-unstyled success">
							<li>검증된 펫시터</li>
							<li>최고 전문진과 교육 협업</li>
							<li>안전 보상 프로그램</li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section " data-aos="fade">
			<div class="container">
				<div class="row mb-5">
					<div class="col-md-8">
						<h3 style="color: #81DAD6;">즐겁고 행복한 방문돌봄</h3>
					</div>
				</div>
				<div class="row mb-3">
					<div class="col-md-4 mx-auto">
						<h3>장시간 혼자있을 우리 아이를 위해 자주가던 공원을 펫시터와 함께 산책해요.</h3>
					</div>
				</div>
				<div class="row mb-5">
					<div class="col-md-4 ml-auto">
						<p>전문 펫시터가 방문하여 익숙한 환경에서 돌봄을 진행하기 때문에 낮선 장소에 예민한 반려견도 안심하고 맡길
							수 있습니다.</p>
					</div>
					<div class="col-md-4">
						<p>혼자 남겨진 반려동물을 생각하며, 외출을 망설인 적이 있으신가요? 이제는 펫시터에게 맡기고, 여러분의
							소중한 일상을 마음 편히 보내세요</p>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-md-6">
						<img src="/resources/main/images/outmain_p1.jpg"
							alt="Free website template by Free-Template.co"
							class="img-fluid rounded">
					</div>
					<div class="col-md-5 ml-auto">
						<h2 class="text-primary mb-3">#펫시터 가정집으로 돌봄</h2>
						<p>전문적인 교욱을 받은 펫시터의 가정집 돌봄</p>
						<ul class="ul-check list-unstyled success">
							<li>전문 펫시터의 맞춤돌봄</li>
							<li>신원검증이 완료된 펫시터</li>
							<li>강아지 상태가 적힌 돌봄일지</li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section " data-aos="fade">
			<div class="container">
				<div class="row mb-5">
					<div class="col-md-8">
						<h3 style="color: #81DAD6;">우리 아기 안심 위탁돌봄</h3>
					</div>
				</div>
				<div class="row mb-3">
					<div class="col-md-4 mx-auto">
						<h3>맞춤 펫시터의 집에서 강아지를 케어헤드립니다.</h3>
					</div>
				</div>
				<div class="row mb-5">
					<div class="col-md-4 ml-auto">
						<p>원하는 일정동안 펫시터가 맞춤돌봄을 하기 때문에 안심하고 맡기실 수 있습니다.</p>
					</div>
					<div class="col-md-4">
						<p>전문 펫시터의 산책과 놀이,훈련을 통해 반려견의 운동을 충족 시키고 스트레스를 줄여줍니다.</p>
					</div>
				</div>
			</div>
		</div>


		<div
			style="width: 1800px; display: flex; justify-content: space-between; align-items: center; align-self: center;">
			<div
				style="display: flex; flex-direction: column; margin-left: 400px;"
				class="">
				<p
					style="font-size: 50px; color: rgb(57, 60, 71); line-height: 70px; font-weight: 300; letter-spacing: 0.2px;">
					행복한 하루를<br>선물하세요
				</p>
				<p
					style="margin-top: 55px; font-size: 17px; line-height: 32px; color: rgb(76, 80, 86);">
					<span style="font-weight: 600;">여행, 출장, 늦은 퇴근</span>에도 걱정마세요!<br>가족같은
					펫시터가 내 아이와 함께합니다
				</p>
			</div>
			<div
				style="width: 682px; height: 670px; margin-right: 160px; display: flex; align-items: center; justify-content: center;">
				<div
					style="align-self: flex-end; margin-bottom: 65px; width: 280px; height: 475px; display: flex; justify-content: center; border-radius: 12px; box-shadow: rgba(0, 0, 0, 0.08) 2px 3px 32px; overflow: hidden;">
					<div style="display: flex; flex-direction: column;">
						<img width="280" height="125" src="/resources/images/dog12.jpg">
						<div
							style="display: flex; flex-direction: column; align-items: center;">
							<p
								style="margin-top: 50px; margin-bottom: 12px; font-size: 21px; font-weight: 600;">펫시터방문</p>
							<p style="font-size: 15px; color: rgb(94, 99, 109);">1시간 당</p>
							<div
								style="border-top: 1.5px dashed rgb(235, 235, 235); width: 215px; height: 1px; margin: 25px 0px;"></div>
							<div
								style="flex-direction: row; align-items: center; margin-bottom: 33px; margin-top: 33px;">
								<p
									style="display: flex; font-weight: 600; font-size: 25px; color: #81DAD6; letter-spacing: 0.7px; line-height: 34px;">
									50 point 부터 ~</p>
							</div>
						</div>
					</div>
				</div>
				<div
					style="margin-top: 65px; align-self: flex-start; width: 280px; height: 475px; display: flex; justify-content: center; border-radius: 12px; box-shadow: rgba(0, 0, 0, 0.08) 2px 3px 32px; overflow: hidden; margin-left: 40px;">
					<div style="display: flex; flex-direction: column;">
						<img width="280" height="125" src="/resources/images/dogr.jpg">
						<div
							style="display: flex; flex-direction: column; align-items: center;">
							<p
								style="margin-top: 50px; margin-bottom: 12px; font-size: 21px; font-weight: 600;">반려인방문</p>
							<p style="font-size: 15px; color: rgb(94, 99, 109);">오전 / 오후</p>
							<div
								style="border-top: 1.5px dashed rgb(235, 235, 235); width: 215px; height: 1px; margin: 38px 0px;"></div>
							<div
								style="display: flex; flex-direction: row; align-items: center; margin-bottom: 33px; margin-top: 33px;">
								<p
									style="display: flex; font-weight: 600; font-size: 25px; color: #81DAD6; letter-spacing: 0.7px; line-height: 34px;">
									200 point 부터 ~</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="site-section bg-light">
			<div class="container">
				<div class="row justify-content-center mb-5">
					<div class="col-md-7 text-center border-primary">
						<h2 class="font-weight-light text-info">사이트 후기 리뷰</h2>
					</div>
				</div>

				<div class="slide-one-item home-slider owl-carousel">
					<c:forEach var="i" items="${reviewD}">
						<div>
							<div class="testimonial">
								<figure class="mb-4">
									<p>${i.rw_petsitter_id}</p>
								</figure>
								<blockquote>
									<p>&ldquo;${i.rw_contents}&rdquo;</p>
								</blockquote>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		
		<div class="py-5 bg-info">
			<div class="container">
				<div class="row">
					<div class="col-lg-7 mr-auto mb-4 mb-lg-0">
						<h2 class="mb-3 mt-0 text-white">Let's get started. Create
							your account</h2>
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

		<footer style="padding-bottom: 80px;">
			<div class="container">
				<div class="row pt-5 mt-5">
					<div class="col-12 text-md-center text-left">
						<p>
							<!-- Link back to Free-Template.co can't be removed. Template is licensed under CC BY 3.0. -->
							&copy; 2020 <strong class="text-black">Petsitter</strong>MohaNangdowajulge<br>
							Design by <a href="https://free-template.co/" target="_blank"
								class="text-black">mohanangdowajulge.co</a>
						</p>
					</div>
				</div>
			</div>
		</footer>
	</div>


	<script src="resources/main/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="resources/main/js/jquery-ui.js"></script>
	<script src="resources/main/js/popper.min.js"></script>
	<script src="resources/main/js/bootstrap.min.js"></script>
	<script src="resources/main/js/owl.carousel.min.js"></script>
	<script src="resources/main/js/jquery.stellar.min.js"></script>
	<script src="resources/main/js/jquery.countdown.min.js"></script>
	<script src="resources/main/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/main/js/bootstrap-datepicker.min.js"></script>
	<script src="resources/main/js/aos.js"></script>
	<script src="resources/main/js/rangeslider.min.js"></script>

	<!-- 로그인 -->
	<!--===============================================================================================-->
	<script src="/resources/member/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/member/vendor/bootstrap/js/popper.js"></script>
	<script src="/resources/member/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/member/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/member/vendor/daterangepicker/moment.min.js"></script>
	<script
		src="/resources/member/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/member/js/main.js"></script>
	<!--===============================================================================================-->


	<script src="resources/main/js/typed.js"></script>
	<script>

$("#login").on("click",function(){	
		
		var queryString = $("form[name=loginProc]").serialize();
		$.ajax({
			type: "POST",
			url: "/member/loginProc",
			cache: false,
			data : queryString,
			dataType : "json",
			success: function(data){
				var check = data.result;
				
				if(check == 0 ){
					alert('이메일 인증이 필요합니다. 이메일을 확인해주세요.');				
					location.reload();

				}
				else if(check == 1){
					alert('ID 또는 비밀번호를 확인하세요.');				
				}else{
					location.reload();
				}		
			}	
		});
	})
	
	

		var typed = new Typed('.typed-words', {
			strings : [ "방문돌봄서비스 ", " 위탁돌봄서비스 ", " 펫시터매칭" ],
			typeSpeed : 80,
			backSpeed : 80,
			backDelay : 4000,
			startDelay : 1000,
			loop : true,
			showCursor : true
		});

			
	    $("#register_btn").on("click",function(){
	       if(${sessionScope.loginInfo.mem_type == '2'}){
	          alert("이미 펫시터로 활동 중입니다. 마이페이지로 이동합니다.");
	          location.href="/petsitter/outputSingle";
	       } else if(${sessionScope.loginInfo.mem_type == '1'}){
	          location.href="/petsitter/petsitter_register_form";
	       } 
	     });
			
	</script>

	<script src="resources/main/js/main.js"></script>
</body>
</html>
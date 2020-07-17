<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Browse &mdash; Free Website Template by Free-Template.co</title>
<meta charset="utf-8">
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/mb/dist/tavo-calendar.css">
<link rel="stylesheet" href="/resources/mb/css/style.css">
<link rel="stylesheet" href="/resources/mb/css/checkbox.css">
<link rel="stylesheet" href="/resources/mb/css/calendar.css">

<!-- icon -->
<link href="/resources/mb/icofont/icofont.min.css" rel="stylesheet">
<link href='https://unpkg.com/boxicons@2.0.5/css/boxicons.min.css'
	rel='stylesheet'>
<script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment-with-locales.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!-- Without locals-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="/resources/mb/dist/tavo-calendar.js"></script>

<style>
.petselec {
	display: inline-block;
}

.petselec img {
	width: 250px;
	height: 200px;
}

.services input[type="checkbox"] {
	display: none;
	font-weight: bold;
}

.services input[type="checkbox"]+label {
	cursor: pointer;
}

.services input[type="checkbox"]:checked+label {
	color: #17a2b8;
}

.services {
	display: inline-block;
	border: 1px solid grey;
	width: 150px;
	height: 60px;
	line-height: 60px;
	border-radius: 5px;
	margin: 10px 10px;
}

#uniqueness {
	border: 1px solid #81DAD6;
	height: 200px;
}

#title {
	border: 1px solid #81DAD6;
}

.services {
	display: inline-block;
}
</style>
</head>

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

		<!-- 통합헤더 -->
		<header class="site-navbar" role="banner">
			<div class="container-fluid" style="padding:0 100px;">
				<div class="row align-items-center">

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
										<li><a href="/member/login"><span>포인트 충전소<i class="icofont-money icofont-1x" style="color: #17a2b8;padding-right: 8px"></i></span></a></li>
										<li><a href="/member/login"><span>MY PAGE<i class="icofont-live-messenger icofont-1x" style="color: #17a2b8;padding-right: 8px"></i></span></a></li>
										<li><a href="/member/login"><span>메시지<i class="icofont-envelope icofont-1x" style="color: #17a2b8"></i></span></a></li>
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
										<li><a href="/member/login"><span
												style="font-size: 20px">게시판</span></a></li>
									</ul>
								</nav>
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
			style="background-image: url(/resources/mb/images/man.jpg);"
			data-aos="fade" data-stellar-background-ratio="0.5">
			<div class="container">
				<div
					class="row align-items-center justify-content-center text-center">

					<div class="col-md-10" data-aos="fade-up" data-aos-delay="400">


						<div class="row justify-content-center">
							<div class="col-md-8 text-center">
								<h1>방문돌봄 수정</h1>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="site-section bg-light">
			<div class="container">
				<form action="modified_con" method="post" id="save">
					<div class="row">
						<div class="col-lg-7">
							<div class="d-block d-md-flex listing-horizontal">
								<div class="lh-content">
									<div class="title">
										<h3>제목</h3>
										<div contenteditable="true" id="title"></div>
										<input type="hidden" name="mb_title" id="mb_title"
											value="${modlist.mb_title}">
									</div>
								</div>
							</div>

							<div class="d-block d-md-flex listing-horizontal">
								<div class="petselec">
									<img src="/resources/mb/images/mypet.jpg">
								</div>

								<div class="lh-content">
									<div class="pet">
										<c:forEach var="j" items="${tmp}">
											<c:forEach items="${list}" var="i">
												<c:if test="${i.pet_name eq j}">
													<input type="hidden" name="mb_petphoto" id="petphoto">
													<input type="checkbox" data-imgsrc="${i.pet_photo}"
														class="petname" name="mb_pet_name" id="${i.pet_name}"
														value="${i.pet_name}" />
													<label for="${i.pet_name}"><span></span>${i.pet_name}</label>
												</c:if>
											</c:forEach>
										</c:forEach>
									</div>
								</div>

							</div>

							<div class="d-block d-md-flex listing-horizontal">
								<div class="lh-content">
									<h5 class="mb-3">서비스</h5>
									<div class="d-block my-3">
										<div class="service_list" style="text-align: center">
											<div>
												<span class="services"> <input type="checkbox"
													class="mb_service" name="mb_service" id="service1"
													value=service1 /> <label for="service1"> <i
														class="icofont-tasks-alt"></i>장기 예약
												</label>
												</span> <span class="services"> <input type="checkbox"
													class="mb_service" name="mb_service" id="service2"
													value=service2 /> <label for="service2"> <i
														class="icofont-pills"></i> 약물 복용
												</label>
												</span> <span class="services"> <input type="checkbox"
													class="mb_service" style="" name="mb_service" id="service3"
													value=service3 /> <label for="service3"><i
														class='bx bx-bone'></i>실내 놀이</label>
												</span>
											</div>

											<div>
												<span class="services"> <input type="checkbox"
													class="mb_service" name="mb_service" id="service4"
													value=service4 /> <label for="service4"><i
														class="icofont-bathtub"></i>목욕 가능</label>
												</span> <span class="services"> <input type="checkbox"
													class="mb_service" name="mb_service" id="service5"
													value=service5 /> <label for="service5"><i
														class="icofont-first-aid"></i>응급 처치</label>
												</span> <span class="services"> <input type="checkbox"
													class="mb_service" name="mb_service" id="service6"
													value=service6 /> <label for="service6"><i
														class='bx bx-walk'></i>야외 산책</label>
												</span>
											</div>
											<div>
												<span class="services"> <input type="checkbox"
													class="mb_service" name="mb_service" id="service7"
													value=service7 /> <label for="service7"><i
														class="icofont-tasks-alt"></i>발톱 관리</label>
												</span> <span class="services"> <input type="checkbox"
													class="mb_service" name="mb_service" id="service8"
													value=service8 /> <label for="service8"><i
														class="icofont-ui-cut"></i>모발 관리</label>
												</span> <span class="services"> <input type="checkbox"
													class="mb_service" name="mb_service" id="service9"
													value=service9 /> <label for="service9"><i
														class="icofont-car-alt-3"></i>집앞 픽업</label>
												</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="d-block d-md-flex listing-horizontal">
								<div class="lh-content">
									<h3>요구사항</h3>
									<div contenteditable="true" id="uniqueness"></div>
									<input type="hidden" name="mb_request" id="mb_request"
										value="${modlist.mb_request}">
								</div>
							</div>
							<div class="conb">
								<a href="/mb/mb_board" class="text-white" id="modified">목록</a>
							</div>
						</div>
						<div class="col-lg-4 ml-5">
							<div data-brackets-id='1'>
								<div data-brackets-id='2'
									style="width: 375px; border-radius: 8px; border: 1px solid #DFE3EA; box-shadow: 1px 3px 7px rgba(0, 0, 0, 0.07); padding-left: 32px; padding-right: 32px; padding-bottom: 32px">
									<p data-brackets-id='3'
										style="font-family: Noto Sans KR; font-size: 14px; letter-spacing: -0.2px; line-height: 20px; color: #393C47; margin-top: 38px">언제
										펫시터가 필요한가요?</p>
									<div data-brackets-id='4'
										style="display: flex; flex-grow: 1; margin-top: 24px">
										<div class="reserve_calendar">
											<div id="my-calendar"></div>
											<input type="hidden" name="mb_startday" id="mb_startday"
												value="${modlist.mb_startday}"> <input type="hidden"
												name="mb_endday" id="mb_endday" value="${modlist.mb_endday}">

										</div>
									</div>
									<p data-brackets-id='18'
										style="font-family: Noto Sans KR; font-size: 14px; letter-spacing: -0.2px; line-height: 20px; color: #393C47; margin-top: 38px">시간선택</p>
									<div data-brackets-id='16'
										style="display: flex; flex-direction: row; justify-content: space-between;">

										<div id="timelist">
											<div class="timebox">
												<div class="timestar">
													<div>
														<div class="stime bu">시작시간</div>
													</div>
													<div class="stimelist timestyle">
														<ul>
															<li data-time="1">09:00</li>
															<li data-time="2">10:00</li>
															<li data-time="3">11:00</li>
															<li data-time="4">12:00</li>
															<li data-time="5">13:00</li>
															<li data-time="6">14:00</li>
															<li data-time="7">15:00</li>
															<li data-time="8">16:00</li>
															<li data-time="9">17:00</li>
															<li data-time="10">18:00</li>
															<li data-time="11">19:00</li>
															<li data-time="12">20:00</li>
															<li data-time="13">21:00</li>
															<li data-time="14">22:00</li>
															<li data-time="15">23:00</li>
															<li data-time="16">24:00</li>
														</ul>
													</div>
												</div>
												<div class="timeend">
													<div>
														<div class="etime bu">끝시간</div>
													</div>
													<div class="etimelist timestyle">
														<ul>
															<li data-time="1">09:00</li>
															<li data-time="2">10:00</li>
															<li data-time="3">11:00</li>
															<li data-time="4">12:00</li>
															<li data-time="5">13:00</li>
															<li data-time="6">14:00</li>
															<li data-time="7">15:00</li>
															<li data-time="8">16:00</li>
															<li data-time="9">17:00</li>
															<li data-time="10">18:00</li>
															<li data-time="11">19:00</li>
															<li data-time="12">20:00</li>
															<li data-time="13">21:00</li>
															<li data-time="14">22:00</li>
															<li data-time="15">23:00</li>
															<li data-time="16">24:00</li>
														</ul>
													</div>
												</div>
											</div>
										</div>
										<input type="hidden" id="stime" name="mb_stime"> <input
											type="hidden" id="etime" name="mb_etime">
									</div>
									<div class="mb-5">
										<div class="custom-pagination">
											<input type="hidden" name="mb_seq" value="${modlist.mb_seq}">
											<button class="btn btn-primary text-white save">수정하기</button>
										</div>
									</div>
									<div class="mb-5">
										<div id="map" style="width: 100%; height: 350px;"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<script>
			$("#uniqueness").on("keyup", function() {
				var uniquetext = $("#uniqueness").html();
				console.log(uniquetext);
				$("#mb_request").val(uniquetext);
			})

			$("#title").on("keyup", function() {
				var title = $("#title").html();
				$("#mb_title").val(title);
			})
		</script>
	<div class="py-5 bg-info">
			<div class="container">
				<div class="row">
					<div class="col-lg-7 mr-auto mb-4 mb-lg-0">
						<h2 class="mb-3 mt-0 text-white">전문적인 펫시터가 될 수 있습니다.</h2>
					</div>
					<div class="col-lg-4">
						<p class="mb-0">
							<a href="signup.html"
								class="btn btn-outline-white text-white btn-md px-5 font-weight-bold btn-md-block">펫시터 지원하기</a>
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
	<script src="/resources/mb/js/checkbox.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=673fb72de94724a273da597b59cd588d&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch("${add}", function(result, status) {

			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {

				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

				// 지도에 표시할 원을 생성합니다
				var circle = new kakao.maps.Circle({
					center : new kakao.maps.LatLng(result[0].y, result[0].x), // 원의 중심좌표 입니다 
					radius : 50, // 미터 단위의 원의 반지름입니다 
					strokeWeight : 1, // 선의 두께입니다 
					strokeColor : '#75B8FA', // 선의 색깔입니다
					strokeOpacity : 0.5, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
					fillColor : '#CFE7FF', // 채우기 색깔입니다
					fillOpacity : 0.5
				// 채우기 불투명도 입니다   
				});

				// 지도에 원을 표시합니다 
				circle.setMap(map);
				map.setCenter(coords);
			}
		});
	</script>
	<script>
		$(function() {

			$(".selectime").each(function(index, items) {
				<c:forEach var = "i" items="${times}">
				if ("${i}" == $(items).val()) {
					$(this).prop("checked", true);
				}
				</c:forEach>
			})

			$(".petname").each(function(index, items) {
				<c:forEach var = "j" items="${petnames}">
				if ("${j}" == $(items).val()) {
					$(this).prop("checked", true);
				}
				</c:forEach>
			})

			var title = "${modlist.mb_title}";
			$("#title").html(title);

			var text = "${modlist.mb_request}";
			$("#uniqueness").html(text);

			$(".mb_service").each(function(index, items) {
				<c:forEach var = "l" items="${services}">
				if ("${l}" == $(items).val()) {
					$(this).prop("checked", true);
				}
				</c:forEach>
			})

			$(".petname").on("click", function() {
				var src = [];
				$(".petname:checked").each(function(index, item) {
					src.push($(this).data("imgsrc"));
				})
				$("#petphoto").val(src);
			})
		})
	</script>
	<script>
		$(function() {
			var my_calendar = new TavoCalendar('#my-calendar', {
				date : moment().format("YYYY-MM-DD"),
				date_start : "${modlist.mb_startday}",
				date_end : "${modlist.mb_endday}",
				format : "YYYY-MM-DD",
				locale : "de",
				range_select : true
			})

			var days = [];
			var start_day = 0;
			var end_day = 0;
			$("#my-calendar").on("calendar-range", function() {

				var range = my_calendar.getRange();
				start_day = range.start;
				end_day = range.end;
				var start = moment(range.start);
				var end = moment(range.end);
				$("#mb_startday").val(start_day);
				$("#mb_endday").val(end_day);

			});
			$(".selectime").on(
					"click",
					function() {
						if ($(this).prop("checked") == true
								&& $("#am").prop("checked") == true) {
							$(".ba").prop("checked", false);
							$("#full").prop("checked", false);
						}
						if ($(this).prop("checked") == true
								&& $("#pm").prop("checked") == true) {
							$(".ba").prop("checked", false);
							$("#full").prop("checked", false);
						}
						if ($(this).prop("checked") == true
								&& $("#full").prop("checked") == true) {
							$(".ba").prop("checked", false);
							$("#am").prop("checked", false);
							$("#pm").prop("checked", false);
						}
					})
		})
	</script>
	<script>
		$(function() {
			$(".stimelist").hide();
			$(".etimelist").hide();

			$(".stime").on("click", function() {
				$(".stimelist").show(100);
			})

			$("li").on("click", function() {
				$(this).parent().parent().hide();
				var bu = $(this).parent().parent().siblings().children();
				var htmlV = $(this).html();
				bu.html(htmlV);
			})
			var dataTime = '';
			$(".stimelist  li").on("click", function() {
				dataTime = $(this).data("time");
				$(".stime").attr("data-time", dataTime)
			});

			$(".etimelist  li").on("click", function() {
				var edata = $(this).data("time");
				if (dataTime >= edata) {
					alert("다시선택하세요");
					$(".etime").html("끝시간");
				} else {
					$("#stime").val($(".stime").html());
					$("#etime").val($(".etime").html());
					return true
				}
			});

			$(".etime").on("click", function() {
				$(".etimelist").show(100);
			})

		})
	</script>
	<script>
		$("#save").on("submit", function() {
			var titleVal = $("#mb_title").val();
			var timeVal = $(".bu").data("time");
			var petVal = $(".petname:checked").val();
			var serviceVal = $(".mb_service:checked").val();
			var startdayVal = $("#mb_startday").val();
			var requestVal = $("#mb_request").val();

			if (titleVal == "") {
				alert("제목을 입력 해주세요");
				return false;
			}

			if (timeVal == null) {
				alert("시간을 선택 해주세요");
				return false;
			}

			if (petVal == null) {
				alert("강아지를 선택 해주세요");
				return false;
			}

			if (serviceVal == null) {
				alert("서비스를 선택 해주세요");
				return false;
			}

			if (startdayVal == "") {
				alert("날짜를 선택 해주세요");
				return false;
			}

			if (requestVal == "") {
				alert("특이 사항을 입력 해주세요");
				return false;
			}
		})
	</script>
	<!-- <script>
		$("#send").on("submit", function() {
			var count=0;
			<c:forEach var="i" items="${petexc}">
				$(".petname:checked").each(function(index, item) {
					console.log($(item).val());
					if ("${i}" == $(item).val()) {
						alert("이미 강아지가 존재 합니다.")
						return false;
					}
				})
			</c:forEach>
				return false;
		})
	</script> -->

</body>
</html>
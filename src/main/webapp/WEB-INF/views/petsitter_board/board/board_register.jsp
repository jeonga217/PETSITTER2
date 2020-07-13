<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/8.7/highlight.min.js"></script>

<link rel="stylesheet"
	href="/resources/main/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="/resources/mb/icofont/icofont.min.css">
<link rel="stylesheet"
	href='https://unpkg.com/boxicons@2.0.5/css/boxicons.min.css'>
<!-- <link rel="stylesheet" href="/resources/petsiter/css/datepickk.min.css"> -->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/8.7/styles/zenburn.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway:400,600">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<script src="/resources/petsiter/js/datepickk.min.js"></script>
<script src="/resources/petsiter/js/datepickk.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700" rel="stylesheet">

<link rel="stylesheet" href="/resources/petsiter/css/datepickk.min.css">
<link rel="stylesheet" href="/resources/petsiter/css/datepickk.css">
<link rel="stylesheet" href="/resources/petsiter/css/doc.css">


</head>
<style>
#datePicker .d-table {
	display: flex !important;
}

#div_psb_contents {
   border: 1px solid grey;
   width: 100%;
   overflow-y: auto;
   word-wrap: break-word;
   word-break: break-all;
   padding: 5px;
}

.services input[type="checkbox"] {
   display: none;
   font-weight: bold;
}

.services input[type="checkbox"]+label {
   cursor: pointer;
}

.services input[type="checkbox"]:checked+label {
   color: #ff4301;
}

.services {
   display: inline-block;
   border: 1px solid grey;
   width: 150px;
   height: 60px;
   line-height: 60px;
   border-radius: 5px;
   margin: 10px 10px;
   font-weight: bold;
}

.filebox input[type="file"] {
   position: absolute;
   width: 1px;
   height: 1px;
   padding: 0;
   margin: -1px;
   overflow: hidden;
   clip: rect(0, 0, 0, 0);
   border: 0;
}

.filebox label {
   display: inline-block;
   padding: .5em .75em;
   color: #01a9b4;
   font-size: inherit;
   line-height: normal;
   vertical-align: middle;
   background-color: #fdfdfd;
   cursor: pointer;
   border: 1px solid #01a9b4;
   border-bottom-color: #01a9b4;
   border-radius: .25em;
} /* named upload */
.filebox .upload-name {
   display: inline-block;
   padding: .5em .75em; /* label의 패딩값과 일치 */
   font-size: inherit;
   font-family: inherit;
   line-height: normal;
   vertical-align: middle;
   background-color: #f5f5f5;
   border: 1px solid #ebebeb;
   border-bottom-color: #e2e2e2;
   border-radius: .25em;
   -webkit-appearance: none; /* 네이티브 외형 감추기 */
   -moz-appearance: none;
   appearance: none;
}

ul {
	padding-inline-start: 5px;
}

ul>li, input {
	style: none !important;
	display: inline-block;
	padding-right: 20px;
}
</style>

<script>
		$(function() {
			$("input[name='ps_gender']").each(function(index, item) {
				if ('${petsitter_Info.ps_gender}' == $(item).val()) {
					$(this).prop('checked', true);
					$("input[name='ps_gender']").prop('disabled', true);
				}
			});
		
			$("input[name='ps_resident_type']").each(function(index, item) {
				if ('${petsitter_Info.ps_resident_type}' == $(item).val()) {
					$(this).prop("checked", true);
					$("input[name='ps_resident_type']").prop('disabled', true);
				}
			});
		
			var list = "${petsitter_Info.ps_service}";
			var listarr = list.split(",");
			console.log(listarr[0]);
			console.log(listarr[1]);
			$("input[name='psb_service']").each(function(index, item) {
				for (var i = 0; i < listarr.length; i++) {
					if (listarr[i] == $(item).val()) {
						$(this).prop("checked", true);
					}
				}
			});

			var fileTarget = $('.filebox .upload-hidden');
			fileTarget.on('change', function() {
				if (window.FileReader) {
					var filename = $(this)[0].files[0].name;
				} else {
					var filename = $(this).val().split('/').pop().split(
							'\\').pop();
				}
				$(this).siblings('.upload-name').val(filename);
			});

			$("#psb_thumb").on('change', function() {
				readURL(this);
			});
		});
		
		
			function readURL(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();
		
					reader.onload = function(e) {
						$('#blah').attr('src', e.target.result);
					}
					reader.readAsDataURL(input.files);
				}
			}
</script>
<script type="text/javascript">

function check() {
	if(!$("input:checkbox[name='psb_petType']").is(":checked")){
		alert("돌봄 가능한 펫타입을 선택해주세요.");
		$("input:checkbox[name='psb_petType']").focus();
		 return false;
	}
	if(!$("input:checkbox[name='psb_time']").is(":checked")){
		alert("돌봄 가능한 시간을 선택해주세요.");
		$("input:checkbox[name='psb_time']").focus();
		 return false;
	}
	if($("#div_psb_contents").html()==""){
		var result = confirm("반려인들에게 더 남기고 싶은 말이 없으신가요?");
		if(result){
			retrun true;
		} else{
			$("#div_psb_contents").html("").focus();
			return false;
		}
	}
}

</script>
<body>
	<jsp:include page="/WEB-INF/views/petsitter_board/header.jsp" />

	<div class="site-section">
		<div class="container">
			<form action="/board/insertProc" enctype="multipart/form-data" method="post" onSubmit="return check()">
				<div class="row">
					<div class="col-lg-7">
						<div class="d-block d-md-flex listing-horizontal">
							<div class="lh-content">
								<h5 class="mb-3">글 등록</h5>
								<div class="mb-3">
									<label for="psb_title">제목</label> <input type="text"
										class="form-control" id="psb_title" name="psb_title"
										placeholder="제목을 입력해주세요." required>
								</div>
								<div class="mb-3">
									<label for="psb_thumb">썸네일</label>
									<div class="filebox">
										<input class="upload-name" value="파일선택" disabled="disabled"
											required> <label for="psb_thumb">찾아보기</label> <input
											type="file" id="psb_thumb" class="upload-hidden form-control"
											name="file" value="" required>
									</div>
								</div>

								<hr class="mb-4">

								<h5 class="mb-3">내 정보</h5>
								<div class="mb-3">
									<label for="psb_writer">아이디</label> <input type="text"
										class="form-control" id="psb_writer" name="psb_writer"
										value="${petsitter_Info.ps_id}" readonly>
								</div>
								<div class="mb-3">
									<label for="ps_age">나이</label> <input type="text"
										class="form-control" id="ps_age" name="ps_age" id="ps_age"
										value="${petsitter_Info.ps_age}" readonly>
								</div>
								<div class="mb-3">
									<label for="ps_gender_F">성별</label>
									<div>
										<ul>
											<li><input type="radio" name=ps_gender id="ps_gender_F"
												value="F">&nbsp;남자</li>
											<li><input type="radio" name=ps_gender id="ps_gender_M"
												value="M">&nbsp;여자</li>
										</ul>
									</div>
								</div>
								<div class="mb-3">
									<label for="ps_address1">주소</label> <input type="text"
										class="form-control" id="ps_address1" name="ps_address1"
										value="${petsitter_Info.ps_address1}" readonly>
								</div>
								<div class="mb-3">
									<label for="psb_petType">돌봄 가능한 강아지 타입</label>
									<div>
										<ul>
											<li><input type="checkbox" name="psb_petType" value="소"
												id="소형견" > <label for="소형견">&nbsp;&nbsp;소형견</label></li>
											<li><input type="checkbox" name="psb_petType" value="중"
												id="중형견"> <label for="중형견">&nbsp;&nbsp;중형견</label></li>
											<li><input type="checkbox" name="psb_petType" value="대"
												id="대형견"> <label for="대형견">&nbsp;&nbsp;대형견</label></li>
										</ul>
									</div>
								</div>

								<hr class="mb-4">

								<h5 class="mb-3">거주 유형</h5>
								<div class="resident_type_list">
									<ul>
										<li><input type="radio" id="resident_type1"
											name="ps_resident_type" value=단독주택  /> <label
											for="resident_type1"><span></span>단독주택</label></li>
										<li><input type="radio" id="resident_type2"
											name="ps_resident_type" value=아파트  /> <label
											for="resident_type2"><span></span>아파트</label></li>
										<li><input type="radio" id="resident_type3"
											name="ps_resident_type" value=빌라  /> <label
											for="resident_type3"><span></span>빌라</label></li>
										<li><input type="radio" id="resident_type4"
											name="ps_resident_type" value=원룸  /> <label
											for="resident_type4">원룸</label></li>
										<li><input type="radio" id="resident_type5"
											name="ps_resident_type" value=오피스텔  /> <label
											for="resident_type5">오피스텔</label></li>
									</ul>
								</div>

								<hr class="mb-4">

								<h5 class="mb-3">서비스</h5>
								<div class="d-block my-3">
									<div class="service_list" style="text-align: center">
										<div>
											<span class="services"> <input type="checkbox"
												name="psb_service" id="service1" value=service1 /> <label
												for="service1" style="display: block"> <i
													class="icofont-tasks-alt"></i>장기예약
											</label>
											</span> <span class="services"> <input type="checkbox"
												name="psb_service" id="service2" value=service2 /> <label
												for="service2" style="display: block"> <i
													class="icofont-pills"></i>약물 복용
											</label>
											</span> <span class="services"> <input type="checkbox"
												name="psb_service" id="service3" value=service3 /> <label
												for="service3" style="display: block"> <i
													class='bx bx-bone'></i>실내 놀이
											</label>
											</span>
										</div>

										<div>
											<span class="services"> <input type="checkbox"
												name="psb_service" id="service4" value=service4 /> <label
												for="service4" style="display: block"> <i
													class="icofont-bathtub"></i>목욕 가능
											</label>
											</span> <span class="services"> <input type="checkbox"
												name="psb_service" id="service5" value=service5 /> <label
												for="service5" style="display: block"> <i
													class="icofont-first-aid"></i>응급 처치
											</label>
											</span> <span class="services"> <input type="checkbox"
												name="psb_service" id="service6" value=service6 /> <label
												for="service6" style="display: block"> <i
													class='bx bx-walk'></i>야외 산책
											</label>
											</span>
										</div>
										<div>
											<span class="services"> <input type="checkbox"
												name="psb_service" id="service7" value=service7 /> <label
												for="service7" style="display: block"> <i
													class="icofont-tasks-alt"></i>발톱 관리
											</label>
											</span> <span class="services"> <input type="checkbox"
												name="psb_service" id="service8" value=service8 /> <label
												for="service8" style="display: block"> <i
													class="icofont-ui-cut"></i>모발 관리
											</label>
											</span> <span class="services"> <input type="checkbox"
												name="psb_service" id="service9" value=service9 /> <label
												for="service9" style="display: block"> <i
													class="icofont-car-alt-3"></i>집앞 픽업
											</label>
											</span>
										</div>
									</div>
								</div>

								<hr class="mb-4">
								<h5 class="mb-3">전하고 싶은 말</h5>
								<div class="d-block my-3">
									<div id="div_psb_contents" contentEditable="true"></div>
									<input id="psb_contents" type="hidden" name="psb_contents" required>
									<script>
										$(function() {
											$("#div_psb_contents").on("keyup",function() {
																$("#psb_contents").val($(this).html());
															});
										})
									</script>
								</div>
							</div>
						</div>
					</div>



					<div class="col-lg-4 mb-5">
						<div class='mb-5'
							style="width: 375px; border-radius: 8px; border: 1px solid #DFE3EA; box-shadow: 1px 3px 7px rgba(0, 0, 0, 0.07); padding: 38px 10px 0px;">
							<h3 class="h5 text-black mb-3 " style="text-align: center">
								돌봄 가능일 선택<i class="icofont-calendar"></i>
							</h3>
							<div class="reserve_calendar">
								<div id="datePicker"
									style="height: 600px; width: 100%; max-width: 600px;"></div>
								<div class="select_date">
									<ul class="head_date" style="text-align: center">
										<li style="width: 150px;"><b>시작일</b></li>
										<li style="width: 150px;"><b>종료일</b></li>
									</ul>
									<ul class="head_date" style="text-align: center">
										<li><input type="text" id="start_day" name="psb_start_day"
											style="width: 150px; text-align: center;" placeholder="시작일" required></li>
										<li><input type="text" id="end_day" name="psb_end_day"
											style="width: 150px; text-align: center;" placeholder="종료일" required></li>
									</ul>
								</div>
								<script>
									var arr = [];
									var tmp = 0;
									$(function() {
										var now = new Date();
										var datePicker = new Datepickk1(
												{	
													container : document.querySelector('#datePicker'),
													minDate : now.setDate(now.getDate() - 1),
													inline : true,
													range : true
												}).onSelect = function(checked) {
											var state = (checked) ? 'selected' : 'unselected';
											if (checked) {
												var time = this.toLocaleDateString();
												var timearr = time.split('. ');
												var new_time = timearr[0]+'-'+timearr[1]+'-'+(timearr[2].split('.'))[0];
												//console.log(new_time);
												arr.push(new_time);

												if (arr.length > 2) {
													arr.shift();
												}
												if (arr.length > 1) {
													var start = arr[0];
													var end = arr[1];
													var tmp = '';

													if (start >= end) {
														tmp = start;
														start = end;
														end = tmp;
													}
													
													$("#start_day").val(start);
													$("#end_day").val(end);
													console.log("날짜1:" + start + ", 날짜2:" + end);

												}
											}
										};

									})
									//선택된 두 날짜 비교
								</script>
							</div>
							<hr class="mb-4">
							<h3 class="h5 text-black mb-3 " style="text-align: center">
								돌봄 가능한시간 선택<i class="icofont-clock-time"></i>
							</h3>
							<div id="timelist" style="text-align: center">

								<div>
									<input type="checkbox" name="psb_time" value="am" id="am" >
									<label for="am">&nbsp;&nbsp;오전 09:00 ~ 14:00</label>
								</div>
								<div>
									<input type="checkbox" name="psb_time" value="pm" id="pm">
									<label for="pm">&nbsp;&nbsp;오후 14:00 ~ 21:00</label>
								</div>
							</div>
							
							<hr class="mb-4">
							<h3 class="h5 text-black mb-3" style="text-align: center">
								나의 위치<i class="icofont-location-pin"></i>
							</h3>
							<div id="map" style="width: 350px; height: 350px;"></div>
							
						</div>

						<div class="mb-5">
							<button
								class="btn btn-primary text-#878786 btn-md px-5 font-weight-bold btn-md-block"
								type="submit">등록하기</button>
						</div>
					</div>
				</div>
				</row>
			</form>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/petsitter_board/footer.jsp" />
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=673fb72de94724a273da597b59cd588d&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		};// 지도의 확대 레벨

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('경기도 성남시 분당구 판교로430', function(result, status) {

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
</body>
</html>
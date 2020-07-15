<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<style>
#div_ps_myself {
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
	text-align: center;
}

ul {
	padding-inline-start: 5px;
}

ul>li, input {
	style: none;
	display: inline-block;
	padding-right: 20px;
}

.btn {
	margin: auto;
	text-align: center;
}

#submit_btn, #reset_btn {
	width: 300px;
	border-radius: 10px;
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/petsitter_board/header.jsp" />
	<script>
		$(function() {
			console.log('${petsitterInfo.ps_gender}');
			$("input[name='ps_gender']").each(function(index, item) {
				if ('${petsitterInfo.ps_gender}' == $(item).val()) {
					$(this).prop("checked", true);
				}
			});

			$("input[name='ps_resident_type']").each(function(index, item) {
				if ('${petsitterInfo.ps_resident_type}' == $(item).val()) {
					$(this).prop("checked", true);
				}
			});

			$("input[name='ps_drive']").each(function(index, item) {
				if ('${petsitterInfo.ps_drive}' == $(item).val()) {
					$(this).prop("checked", true);
				}
			});

			$("input[name='ps_license']").each(function(index, item) {
				if ('${petsitterInfo.ps_license}' == $(item).val()) {
					$(this).prop("checked", true);
				}
			});

			var list = "${petsitterInfo.ps_service}";
			var listarr = list.split(",");
			console.log(listarr[0]);
			console.log(listarr[1]);
			$("input[name='ps_service']").each(function(index, item) {
				for (var i = 0; i < listarr.length; i++) {
					if (listarr[i] == $(item).val()) {
						$(this).prop("checked", true);
					}
				}
			});
		});
	</script>
	<div class="site-section">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-11">
					<div class="d-block d-md-flex listing-horizontal">
						<div class="lh-content">

							<div class="mb-3">
								<label for="ps_id">아이디</label> <input type="text"
									class="form-control" id="ps_id" name="ps_id"
									value="${petsitterInfo.ps_id}" readonly>
							</div>
							<div class="mb-3">
								<label for="ps_img">프로필 사진</label>
								<div class="filebox">
									<img src="/upload/${petsitterInfo.ps_img}"
										style="width: 300px; height: 300px;">
								</div>
							</div>
							<div class="mb-3">
								<label for="ps_age">나 이</label> <input type="text"
									class="form-control" id="ps_age" name="ps_age"
									value="${petsitterInfo.ps_age}">
							</div>
							<div class="mb-3">
								<label for="ps_gender_F">성 별</label>
								<div>
									<input type="radio" id="ps_gender_M" name="ps_gender" value="M">
									남자 <input type="radio" id="ps_gender_F" name="ps_gender"
										value="F"> 여자
								</div>
							</div>
							<div class="mb-3">
								<label for="Address">주 소</label> <input type="text"
									name="ps_address1" class="form-control"
									value="${petsitterInfo.ps_address1 }" readonly>
							</div>
							<div class="mb-3">
								<label for="Address">상세주소</label> <input type="text"
									name="ps_address2" class="form-control"
									value="${petsitterInfo.ps_address2 }" readonly>
							</div>
							<div class="mb-3">
								<label for="">거주 유형</label>
								<div class="resident_type_list">
									<input type="radio" name="ps_resident_type" id="resident_type1"
										value=단독주택 /> <label for="resident_type1">단독주택</label> <input
										type="radio" name="ps_resident_type" id="resident_type2"
										value=아파트 /> <label for="resident_type2">아파트</label> <input
										type="radio" name="ps_resident_type" id="resident_type3"
										value=빌라 /> <label for="resident_type3">빌라</label> <input
										type="radio" name="ps_resident_type" id="resident_type4"
										value=원룸 /> <label for="resident_type4">원룸</label> <input
										type="radio" name="ps_resident_type" id="resident_type5"
										value=오피스텔 /> <label for="resident_type5">오피스텔</label>
								</div>
							</div>
							<div class="mb-3">
								<label for="ps_drive_Y">운전 유무</label>
								<div>
									<input type="radio" id="ps_drive_Y" name="ps_drive" value="Y">
									<label for="ps_drive_Y"><span></span>YES</label> <input
										type="radio" id="ps_drive_N" name="ps_drive" value="N">
									<label for="ps_drive_N"><span></span>NO</label>
									</td>
								</div>
							</div>
							<div class="mb-3">
								<label for="ps_license_Y">자격증 유무</label>
								<div>
									<input type="radio" id="ps_license_Y" name="ps_license"
										value="Y"> <label for="ps_license_Y"><span></span>YES</label>
									<input type="radio" id="ps_license_N" name="ps_license"
										value="N"> <label for="ps_license_N"><span></span>NO</label>
								</div>
							</div>
							<div class="mb-3">
								<label for="ps_img">자격증 이미지 첨부</label>
								<div class="filebox">
									<img src="/upload/${petsitterInfo.ps_license_img}"
										style="width: 300px; height: 300px;">
								</div>
							</div>
							<div class="mb-3">
								<label for="div_ps_myself">내 소개글</label>
								<div id="div_ps_myself"
									style='border: solid; width: 800px; min-height: 100px; margin: 10px 10px;'>${petsitterInfo.ps_myself}
								</div>

							</div>

							<div class="mb-3">
								<label for="">서비스</label>
								<div class="service_list">
									<input type="checkbox" id="service1" class="service"
										name="ps_service" value=service1 /> <label for="service1"><span></span>장기예약</label>
									<input type="checkbox" id="service2" class="service"
										name="ps_service" value=service2 /> <label for="service2"><span></span>약물복용</label>
									<input type="checkbox" id="service3" class="service"
										name="ps_service" value=service3 /> <label for="service3"><span></span>실내놀이</label>
									<input type="checkbox" id="service4" class="service"
										name="ps_service" value=service4 /> <label for="service4"><span></span>목욕가능</label>
									<input type="checkbox" id="service5" class="service"
										name="ps_service" value=service5 /> <label for="service5"><span></span>응급처치</label>
									<input type="checkbox" id="service6" class="service"
										name="ps_service" value=service6 /> <label for="service6"><span></span>야외산책</label>
									<input type="checkbox" id="service7" class="service"
										name="ps_service" value=service7 /> <label for="service7"><span></span>발톱관리</label>
									<input type="checkbox" id="service8" class="service"
										name="ps_service" value=service8 /> <label for="service8"><span></span>모발
										관리</label> <input type="checkbox" id="service9" class="service"
										name="ps_service" value=service9 /> <label for="service9"><span></span>집앞픽업</label>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/petsitter_board/footer.jsp" />
</body>
</html>
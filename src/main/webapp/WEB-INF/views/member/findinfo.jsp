<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<title>ID 찾기</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<style>
.btn-primary {
	background-color: #81DAD6;
	border-color:;
}

#strong {
	font-weight: bold;
	color: green;
}

.btn {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 16px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
	border-radius: 10px;
}

.btn1 {
	background-color: #81DAD6;
	color: white;
	border: 2px solid #81DAD6;
}

.btn1:hover {
	background-color: turquoise;
	color: white;
}

.main {
	box-shadow: 0 7px 25px 0 rgba(0, 0, 0, 0.1);
	padding-top: 25px;
	padding-left: 25px;
}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/member/find_head.jsp" />

	<div class="site-section">
		<div class="container">
			<div class="row main">
				<div class="col-md-6 mb-5">

					<div class="row form-group">
						<div class="col-12">
							<label class="text-black" for="fname">ID찾기</label>
						</div>
					</div>

					<div class="row form-group">

						<div class="col-md-8">
							<label class="text-black" for="email">Email</label> <input
								type="text" id="email1" class="form-control">
						</div>
					</div>

					<div class="row form-group">
						<div class="col-md-12">

							<button type="button" class="btn btn1" id="findid">ID 찾기</button>
						</div>
					</div>
					<div class="row form-group">
						<div class="col-md-12">
							<div id='yourid'></div>
						</div>
					</div>


				</div>
				<div class="col-md-6 mb-5">
					<div class="row form-group">

						<div class="col-md-12">
							<label class="text-black" for="email">비밀번호 재설정</label>
						</div>
					</div>
					<div class="row form-group">
						<div class="col-md-8">
							<label class="text-black" for="email">ID</label> <input
								type="text" id="id" class="form-control">
						</div>
					</div>
					<div class="row form-group">

						<div class="col-md-8">
							<label class="text-black" for="email">Email</label> <input
								type="text" id="email2" class="form-control">
						</div>
					</div>
					<div class="row form-group">
						<div class="col-md-12">
							<button type="button" id="findpw" class="btn btn1">비밀번호
								재설정</button>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/member/footer.jsp" />
	<script>
		$("#findid")
				.on(
						"click",
						function() {
							var email = $("#email1").val();

							$
									.ajax({
										url : "/member/findIdProc",
										type : "post",
										dataType : "json",
										data : {
											"email" : $("#email1").val()
										},
										success : function(data) {
											var id = data.id

											if (id != null) {

												$("#yourid")
														.html(
																"<p>당신의 아이디는 <span id=strong>"
																		+ id
																		+ "</span> 입니다.")
												$("#email1").val("");

											} else if (id == null) {

												$("#yourid")
														.html(
																"<p>확인 되는 ID가 없습니다. Email 주소를 다시 확인하세요.")
											}
										},
										error : function(request, status, error) {
											alert("code:" + request.status
													+ "\n" + "message:"
													+ request.responseText
													+ "\n" + "error:" + error);
										}

									})
						}); //아이디 찾기

		$("#findpw")
				.on(
						"click",
						function() {
							var email = $("#email2").val()
							var id = $("#id").val()

							if ((id != null && id != "")
									&& (email != null && email != "")) {

								$
										.ajax({
											url : "/member/findPwProc",
											type : "post",
											dataType : "json",
											data : {
												"id" : id,
												"email" : email
											},
											success : function(data) {
												if (data == 1) {

													alert("등록 된 이메일로 임시비밀번호가 발송되었습니다.\n임시비밀번호로 로그인 후, 마이페이지에서 비밀번호를 수정해주세요.")

												} else if (data == 0) {

													alert("확인되는 정보가 없습니다. ID 또는 Email을 확인해주세요.")

												}
											}
										})

							}

						}); //비번찾기
	</script>
	<script>
		$("#login").on("click", function() {

			var queryString = $("form[name=loginProc]").serialize();
			$.ajax({
				type : "POST",
				url : "/member/loginProc",
				cache : false,
				data : queryString,
				dataType : "json",
				success : function(data) {
					var check = data.result;

					if (check == 0) {
						alert('이메일 인증이 필요합니다. 이메일을 확인해주세요.');
						location.href = "/";

					} else if (check == 1) {
						alert('ID 또는 비밀번호를 확인하세요.');
						return false;

					} else {
						location.href = "/";
					}
				}
			});
		})
	</script>


</body>

</html>

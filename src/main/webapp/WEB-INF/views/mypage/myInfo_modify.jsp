<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
.wrap {
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
	margin-top: 30px width: 700px;
	box-shadow: 0 7px 25px 0 rgba(0, 0, 0, 0.1);
	padding-top: 50px;
	padding-bottom: 50px;
	padding-left: 30px !important;
}

* {
	box-sizing: border-box;
}

.menu {
	text-align: left;
	padding: 0;
}

.ans {
	text-align: left;
	margin-bottom: 10px;
	padding: 0;
}

.signup {
	width: 70%;
	border: none;
	border-bottom: 1px solid;
	border-color: #17a2b8;
}

.zipcode {
	width: 58%;
	border: none;
	border-bottom: 1px solid;
	border-color: #17a2b8;
}

.header {
	padding-bottom: 10px;
}

i {
	color: #81DAD6;
}

.btns {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 6px 10px;
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

.btns1 {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 13px 25px;
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
	border-radius: 10px;
}

.btn1:hover {
	background-color: turquoise;
	color: white;
}

@font-face {
	font-family: 'IBMPlexSansKR-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Regular.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.title, .menu, .menu1 {
	font-family: 'IBMPlexSansKR-Regular';
}

.row {
	margin-left: 30px !important;
}

.withdraw {
	float: right;
}
</style>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<!--CDN 링크 -->

</head>

<body>

	<jsp:include page="/WEB-INF/views/mypage/myinfo_header.jsp" />
	<div class="container">
		<div class="wrap col-8" style="margin-top: 80px;">
			<div class="row header">
				<div class="col-12 title">
					<h2>
						<i class="fas fa-user"></i> My Info
					</h2>
				</div>
			</div>
			<form action="/mypage/myinfoProc" name=myinfoProc method="post">
				<div class="row">
					<input type="hidden" name="mem_join_type" value="1">
					<div class="col-12 menu">ID</div>
					<div class="col-12 ans">
						<input type="text" id="id" name="mem_id" class="signup"
							value="${loginInfo.mem_id}" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-12 menu">비밀번호</div>
					<div class="col-12 ans">
						<input type="password" id="pw" name="mem_pw" class="signup"
							placeholder="영문 대소문자, 숫자, 특수문자 하나 이상/최소 8~16자">
					</div>
				</div>
				<div class="row">
					<div class="col-12 menu">비밀번호 확인</div>
					<div class="col-12 ans">
						<input type="password" id="pwcheck" class="signup">
					</div>
					<div class="col-12 menu">
						<span id="pwok" style="display: none; color: green;">비밀번호가
							일치합니다.</span> <span id="pwfail"
							style="display: none; color: #d92742; font-weight: bold;">비밀번호가
							일치하지 않습니다.</span>
					</div>
				</div>
				<div class="row">
					<div class="col-12 menu">이름</div>
					<div class="col-12 ans">
						<input type="text" id="name" name="mem_name" class="signup"
							value="${loginInfo.mem_name}">
					</div>
				</div>
				<div class="row">
					<div class="col-12 menu">Email</div>
					<div class="col-12 ans">
						<input type="text" id="email" name="mem_email" class="signup"
							placeholder="abcd@kh.com 형식으로 입력" value="${loginInfo.mem_email}">
					</div>

					<div class="col-12 menu">
						<span id="emok" style="display: none;">사용 가능한 Email입니다.</span> <span
							id="emfail" style="display: none;">사용 중인 Email입니다. 새로운
							Email을 입력하세요.</span>
					</div>

				</div>
				<div class="row">
					<div class="col-12 menu">연락처</div>
					<div class="col-12 ans">
						<input type="text" id="phone" name="mem_phone" class="signup"
							value="${loginInfo.mem_phone}" placeholder="-를 제외한 숫자 입력">
					</div>
				</div>
				<div class="row">
					<div class="col-12 menu">우편번호</div>
					<div class="col-12 ans">
						<input type="text" id="zipcode" name="mem_zipcode" class="zipcode"
							value="${loginInfo.mem_zipcode}" readonly>
						<button type="button" class="btns1 btn1"
							onclick="sample4_execDaumPostcode()">찾기</button>
					</div>
				</div>
				<div class="row">
					<div class="col-12 menu">주소</div>
					<div class="col-12 ans">
						<input type="text" id="add1" name="mem_address1" class="signup"
							value="${loginInfo.mem_address1}" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-12 menu">상세주소</div>
					<div class="col-12 ans">
						<input type="text" id="add2" name="mem_address2" class="signup"
							value="${loginInfo.mem_address2}">
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-12 menu1">
						<button type="submit" id="modify" class="btns1 btn1">정보 수정</button>
						<button type="button" id="back" class="btns1 btn1">취소</button>
					</div>					
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/member/footer.jsp" />
	<script>
		function sample4_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					document.getElementById('zipcode').value = data.zonecode;
					document.getElementById("add1").value = roadAddr;
				}
			}).open();
		}
	</script>
	<script>
		$(function() {
			$("#pw")
					.on(
							"focusout",
							function() {
								var passwdCheck = RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/g);
								var pw = $("#pw").val();

								if (pw != null && pw != "") {

									if (!passwdCheck.test(pw)) {
										alert("비밀번호는 영문 대소문자, 숫자, 특수문자 하나 이상 포함/최소 8~16자로 입력해야합니다.")
										$("#pw").val("");
										$("#pw").focus();
									}
								}

							})

			$("#email")
					.on(
							"focusout",
							function() {
								var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
								var email = $("#email").val();

								if (email != null && email != "") {

									if (emailCheck.test(email)) {
										$.ajax({
											url : "/member/emailDuplCheck",
											type : "post",
											dataType : "json",
											data : {
												"email" : $("#email").val()
											},
											success : function(data) {
												if (data == 1) {
													$("#emok").css('display',
															'none');
													$("#emfail").css('display',
															'inline-block');
												} else if (data == 0) {
													$("#emok").css('display',
															'inline-block');
													$("#emfail").css('display',
															'none');
												}
											}
										})

									} else {
										alert("Email 양식은 ****@***.*** 입니다.")
										$("#email").val("");
										$("#email").focus();
									}
								}

							})

			$("#pwcheck").on("focusout", function() { //비밀번호 입력 체크
				var pw1 = $("#pw").val();
				var pw2 = $("#pwcheck").val();

				if (pw1 != "" || pw2 != "") {
					if (pw1 == pw2) {
						$("#pwok").css('display', 'inline-block');
						$("#pwfail").css('display', 'none');
					} else {
						alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
						$("#pwok").css('display', 'none');
						$("#pwfail").css('display', 'inline-block');
						$("#pwcheck").val("");

					}
				}

			})

			$("#name").on("focusout", function() {
				var name = $("#name").val();
				var nameCheck = RegExp(/^[가-힣]{2,6}$/);

				if (name != null && name != "") {
					if (!nameCheck.test(name)) {
						alert("이름은 한글 2-6자로만 입력 가능합니다.");
						$("#name").val("");
					}
				}
			})

			$("#phone").on("focusout", function() {
				var phonNumberCheck = RegExp(/^01[0179][0-9]{7,8}$/);
				var phone = $("#phone").val();

				if (phone != null && phone != "") {
					if (!phonNumberCheck.test(phone)) {
						alert("연락처는 01로 시작하여 -없이 숫자만 입력하세요.")
					}
				}
			})

		}) //function 끝
	</script>
	<script>
		$('input[type="text"]').keydown(function() {
			if (event.keyCode === 13) {
				event.preventDefault();
			}
		});
		$('input[type="password"]').keydown(function() {
			if (event.keyCode === 13) {
				event.preventDefault();
			}
		});
	</script>
	<script>
		document.getElementById("modify").onclick = function() {

			if ($("#pw").val() != $("#pwcheck").val()) {
				alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
				$("#pwok").css('display', 'none');
				$("#pwfail").css('display', 'inline-block');
				$("#pwcheck").val("");
				return false;

			} else if ($("#name").val() == "") {
				alert("이름이 없습니다.");
				$("#name").focus();
				return false;

			} else if ($("#phone").val() == "") {
				alert("연락처가 없습니다.");
				$("#phone").focus();
				return false;

			} else if ($("#zipcode").val() == "") {
				alert("주소가 없습니다.");
				$("#zipcode").focus();
				return false;
			} else if ($("#add1").val() == "") {
				alert("주소가 없습니다.");
				$("#add1").focus();
				return false;
			} else if ($("#add2").val() == "") {
				alert("상세주소가 없습니다.\n주소가 없다면 없음 이라고 적어주세요.");
				$("#add2").focus();
				return false;
			} else {

				var email = $("#email").val();
				var ori_email = "${loginInfo.mem_email}";

				if (email != ori_email) {

					alert("Email주소가 변경되었습니다. 새로운 이메일로 인증 후 로그인이 가능합니다.");					

				} else {

					alert("정보 수정이 완료되었습니다.")	
					
				}

			}
		}
	</script>




</body>
</html>
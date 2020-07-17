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
.withdraw{
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
					<div class="col-12 menu">이름</div>
					<div class="col-12 ans">
						<input type="text" id="name" name="mem_name" class="signup" readonly value="${loginInfo.mem_name}">
					</div>
				</div>
				<div class="row">
					<div class="col-12 menu">Email</div>
					<div class="col-12 ans">
						<input type="text" id="email" name="mem_email" class="signup" readonly
							 value="${loginInfo.mem_email}">
					</div>
				</div>
				<div class="row">
					<div class="col-12 menu">연락처</div>
					<div class="col-12 ans">
						<input type="text" id="phone" name="mem_phone" class="signup"
							value="${loginInfo.mem_phone}" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-12 menu">우편번호</div>
					<div class="col-12 ans">
						<input type="text" id="zipcode" name="mem_zipcode" class="zipcode"
							value="${loginInfo.mem_zipcode}" readonly>
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
							value="${loginInfo.mem_address2}" readonly>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-6 menu1">
						<button type="button" id="modify" class="btns1 btn1">수정</button>
						<button type="button" id="back" class="btns1 btn1">취소</button>
					</div>
					<div class="col-6 menu1">
						<button type="button" id="withdraw" class="btns1 btn1">회원 탈퇴</button>						
					</div>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/member/footer.jsp" />
	
						
			
			
	<script>
	
		$(function(){
			$("#modify").on("click", function(){
				
				location.href="/mypage/myInfo_modifys";		
			})
			
			$("#back").on("click", function(){
				location.href="/";
			})
			
			$("#withdraw").on("click", function(){
				var result = confirm("정말 탈퇴하시겠습니까?");
				if(result){
					location.href="/member/withdraw"
				}
				
				
				
			})
			
			
		})	
	
	</script>
</body>
</html>
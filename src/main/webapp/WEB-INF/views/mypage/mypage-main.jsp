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
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

.con {
	width: 800px;
	box-shadow: 0 7px 25px 0 rgba(0, 0, 0, 0.1);
	margin-top: 50px;
}

.row {
	height: 150px;
}

.first, .second {
	width: 50%;
	border: black .2px solid;
	padding: 30px 15px;
}

.second {
	border-top: 0;
}

.left {
	border-left: 0;
}

.col-md-6>a {
	text-decoration: none !important;
	color: black !important;
}
</style>



</head>

<body>

	<jsp:include page="/WEB-INF/views/member/signup_head.jsp" />

	<div class="container con">
		<div class="wrap">
			<div class="row">
				<div class="col-md-6 first">
					<a href="/member/myInfo"><span>
							<p>
								<span>
									<h3>My Info</h3>
								</span>
							</p>
							<p>내 정보를 확인하고 수정이 가능합니다.</p>
					</span></a>
				</div>

				<div class="col-md-6 first left">
					<a href="/mypage/usecontent"><span>
							<p>
								<span>
									<h3>User History</h3>
								</span>
							</p>
					</span> </a>
					<p>이용했던 내역을 확인할 수 있습니다.</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 second">
					<p>
						<span>
							<h3>Community</h3>
						</span>
					</p>
					<p>커뮤니티 게시판에서 내가 쓴 글을 확인합니다.</p>
				</div>
				<div class="col-md-6 second left">
					<p>
						<span>
							<h3>Point</h3>
						</span>
					</p>
					<p>포인트 내역/충전이 가능합니다.</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 second">
					<p>
						<span>
							<h3>Reservation</h3>
						</span>
					</p>
					<p>예약 내역 확인이 가능합니다.</p>
				</div>
				<div class="col-md-6 second left">
					<a href="/mypage/list"><span>
							<p>
								<span>
									<h3>펫 등록</h3>
								</span>
							</p>
							<p>펫 정보를 등록 할 수 있습니다.</p>
					</span> </a>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 second">
					<p>
						<span>
							<h3>예비용</h3>
						</span>
					</p>
					<p>예비용</p>
				</div>
				<div class="col-md-6 second left">
					<p>
						<span>
							<h3>예비용</h3>
						</span>
					</p>
					<p>예비용</p>
				</div>
			</div>
		</div>
	</div>



	<jsp:include page="/WEB-INF/views/member/footer.jsp" />




</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.js"></script>
<script src="/resources/admin/admin_js/navi.js"></script>
<link rel="stylesheet" href="/resources/admin/admin_css/case.css" type="text/css">
<script src="/resources/admin/admin_js/chart.js"></script>
</head>
<body>
	<div class="wrap row bg-light">
		<div class="col-12 ">
			<div class="row " style="margin: 5px;">
				<div class="col-5 d-none d-sm-block" style="height: 40px;">
					<img src="/resources/images/dogss.png" alt="" style="height: 100%">
				</div>
				<div class="col-5" id="nav">
					<input class="btn btn-outline-primary" type="button" value="Menu"
						id="navmenuon"> 
						<input type="button" class="btn btn-outline-primary" value="닫기"
						id="navmenuoff" style="display: none">
				</div>
				<div class="col" style="text-align: right;">
					<button class="btn btn-outline-primary home">홈으로</button>
					<button class="btn btn-outline-primary logout">로그 아웃</button>
				</div>
			</div>
		</div>
		<div class="lside col-12 bg-primary" id="navmenu">
			<div class="row">
				<!--사이드 메뉴바-->
				<div class="col-12 smenu main" id="main">관리자 페이지</div>
				<hr>
				<div class="col-12 smenu member">회원 관리</div>
				<hr>
				<div class="col-12 smenu reservation">예약 관리</div>
				<hr>
				<div class="col-12 smenu petsiter">펫 시터 신청서</div>
				<hr>
				<div class="col-12 smenu black">블랙리스트</div>
				<hr>
				<div class="col-12 smenu baord">게시판 관리</div>
				<hr>
				<div class="col-12 smenu declaration">신고 내역 관리</div>
				<hr>
				<div class="col-12 smenu cash">현금 전환 관리</div>
				<hr>
				<div class="col-12 smenu pass">비밀번호 관리</div>
				<hr>
				<div class="col-12 smenu mess">메세지 관리</div>
				<hr>
				<div class="col-12 smenu chat">QnA 채팅 관리</div>
			</div>
		</div>
		<div class="lside col-sm-3 col-lg-2 d-none d-sm-block bg-primary "
			id="lside">
			<div class="row">
				<!--사이드 메뉴바-->
				<div class="col-12 smenu main">관리자 페이지</div>
				<hr>
				<div class="col-12 smenu member" >회원 관리</div>
				<hr>
				<div class="col-12 smenu  reservation">예약 관리</div>
				<hr>
				<div class="col-12 smenu petsiter">펫 시터 신청서</div>
				<hr>
				<div class="col-12 smenu black">블랙리스트</div>
				<hr>
				<div class="col-12 smenu baord">게시판 관리</div>
				<hr>
				<div class="col-12 smenu declaration">신고 내역 관리</div>
				<hr>
				<div class="col-12 smenu cash">현금 전환 관리</div>
				<hr>
				<div class="col-12 smenu pass">비밀번호 관리</div>
				<hr>
				<div class="col-12 smenu mess">메세지 관리</div>
				<hr>
				<div class="col-12 smenu chat">QnA 채팅 관리</div>
				<hr>
				<div class="col-12 smenu hide" id="hide">◀</div>
				<hr>
			</div>
		</div>
		<div class="lside_hide d-none bg-primary hide" id="view">▶</div>
		<div class="rside col">
			<!--본문 용-->
			<div class="row">
				<div class="maintitle col-12 ">관리자 페이지</div>
				<div class="maincontent col-12">
					<div class="row">
						<div class="col-12 col-lg-6  chart">
							<h3>일 별 방문자 수</h3>
							<div class="bg-white" style="height: 80%; width: 100%">
								<canvas id="myChart" width="500vw" height="200vw"></canvas>
							</div>
						</div>
						<div class="col-12 col-lg-6  chart">
							<h3>월 별 수입 내역</h3>
							<div class="bg-white" style="height: 80%; width: 100%">
								<canvas id="myChart2" width="500vw" height="200vw"></canvas>
							</div>
						</div>
						<div class="col-12 table">
							<div class="row">
								<div class="col-12 bg-light">
									<nav class="navbar navbar-light">
										<a class="navbar-brand">간편 회원 조회</a>
										<form class="form-inline d-none d-sm-block">
											<input class="form-control mr-sm-2" type="search"
												placeholder="Search" aria-label="Search">
											<button class="btn btn-outline-primary my-2 my-sm-0"
												type="submit">Search</button>
										</form>
									</nav>

								</div>
								<div class="col-12 bg-white">
									<div class="row">
										<div class="col-3">회원명</div>
										<div class="col-3">회원 종류</div>
										<div class="col-3">가입 날짜</div>
										<div class="col-3">포인트 현황</div>
									</div>
									
									<hr style="width: 100%; margin: 10px;">
									<c:forEach var="i" items="${memberlist}">
									
									<div class="row">
										<div class="col-3">${i.mem_id}</div>
										<div class="col-3">	<c:choose>
		                                   	<c:when test="${i.mem_type eq 1}">일반회원</c:when>
		                                   	<c:otherwise>펫 시터</c:otherwise>
		                                   	</c:choose>
		                                </div>		
										<div class="col-3">${i.mem_join_date}</div>		
										<div class="col-3">${i.mem_point}</div>
									</div>
									<hr style="width: 100%; margin: 10px;">
									</c:forEach>
								</div>
								<div class="col-12" style="text-align: center">${navi}</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	<script>
	var ctx = document.getElementById('myChart');
    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['일','월', '화', '수', '목', '금', '토'],
            datasets: [{
                label: '이번 주',
                data: [
                	<c:forEach var="i" items="${to_visitor}">
    				${i.v_count},
    				</c:forEach>
    			],
                backgroundColor: [
                    'rgba(255, 255, 100, 0.5)'
                ],
                borderColor: [
                    'rgba(255, 255, 100, 1)'
                ],
                borderWidth: 1
            },
            {
                label: '저번 주',
                data: [
                	<c:forEach var="i" items="${be_visitor}">
				${i.v_count},
				</c:forEach>
				],
                backgroundColor: [
                    'rgba(100, 255, 255, 0.5)'
                ],
                borderColor: [
                    'rgba(100, 255, 255, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            maintainAspectRatio: false,
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            },
        }
    });

    </script>
</body>
</html>
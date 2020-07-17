<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.js"></script>
<script src="/resources/admin/admin_js/navi.js"></script>
<script src="/resources/admin/admin_js/admin.js"></script>
<link rel="stylesheet" href="/resources/admin/admin_css/case.css"
	type="text/css">
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
						id="navmenuon"> <input class="btn btn-outline-primary"
						type="button" value="닫기" id="navmenuoff" style="display: none">
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
				<div class="col-12 smenu main">관리자 페이지</div>
				<hr>
				<div class="col-12 smenu member">회원 관리</div>
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
			</div>
		</div>
		<div class="lside col-sm-3 col-lg-2 d-none d-sm-block bg-primary "
			id="lside">
			<div class="row">
				<!--사이드 메뉴바-->
				<div class="col-12 smenu main">관리자 페이지</div>
				<hr>
				<div class="col-12 smenu member">회원 관리</div>
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
				<div class="maintitle col-12">예약 관리</div>
				<div class="maincontent col-12">
					<div class="row">
						<div class="col-12 table">
							<div class="row">
								<div class="col-12">
									<nav class="navbar navbar-light ">
										<form action="/admin/re_select">
											<select name="boardtype" class="btn btn-info dropdown-toggle btn-sm">
												<option value="mb">반려</option>
												<option value="ps">펫 시터</option>
											</select>
											<button class="btn btn-outline-primary my-2 my-sm-0 btn-sm">선택</button>
										</form>
									</nav>
								</div>
								<div class="col-12">
									<div class="row">
										<div class="col-4 col-md">게시글 번호</div>
										<div class="col-4 col-md">등록자</div>
										<div class="col-4 col-md">신청자</div>
										<div class="col-6 col-md">포인트</div>
										<div class="col-6 col-md">수락/거절</div>
									</div>
									<hr style="width: 100%; margin: 15px;">
									<c:choose>
										<c:when test="${boardtype eq 'mb'}">
											<c:forEach var="i" items="${list}">										
											<div class="row">
													<div class="mb" style="display: none;"></div>
													<div class="col-4 col-md p_seq"><a href="/mb/modfilist?mb_seq=${i.mb_seq}" onclick="window.open(this.href,'_blank','width=600, height=720, scrollbars=yes'); return false;">${i.mb_seq}</a></div>
													<div class="col-4 col-md writer">${i.mb_writer}</div>
													<div class="col-4 col-md booker">${i.mb_booker}</div>
													<div class="col-6 col-md point">${i.mb_point}</div>
													<div class="col-6 col-md">
														<input type="button" value="수락" class="btn btn-outline-primary my-2 my-sm-0 btn-sm mem_accept" id="${i.mb_seq}"> 
														<input type="button" value="거절" class="btn btn-outline-primary my-2 my-sm-0 btn-sm mem_cancel">
													</div>
												</div>
												<hr style="width: 100%; margin: 15px;">
											</c:forEach>
										</c:when>
										<c:when test="${boardtype eq 'ps'}">
											<c:forEach var="i" items="${list}">
												<div class="row">
													<div class="ps" style="display: none;"></div>
													<div class="col-4 col-md p_seq"><a href="/board/board_confirmReserve?mem_id=${i.mem_id}" onclick="window.open(this.href,'_blank','width=600, height=720, scrollbars=yes'); return false;">${i.board_seq}</a></div>
													<div class="col-4 col-md">${i.petsitter_id}</div>
													<div class="col-4 col-md">${i.mem_id}</div>
													<div class="col-6 col-md">${i.rsv_point}</div>
													<div class="col-6 col-md">
														<input type="button" value="수락" id="${i.wait_seq}" class="btn btn-outline-primary my-2 my-sm-0 btn-sm ok pet_accept"> 
														<input type="button" value="거절" id="${i.wait_seq}" class="btn btn-outline-primary my-2 my-sm-0 btn-sm pet_cancel">
													</div>
												</div>
												<hr style="width: 100%; margin: 15px;">
											</c:forEach>
										</c:when>
									</c:choose>			
								</div>
								<div class="col-12" style="text-align: center">${navi}</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
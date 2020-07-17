<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html lang="en">

  <head>
  <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
 	<script>
 	$(function(){
	 // 목록으로 버튼
			$("#tolist").on("click",function(){
			location.href="/board/outputList?cpage=1";
		});
 		
 	})
 	</script>
  </head>
  <body>
	<jsp:include page="/WEB-INF/views/petsitter_board/header.jsp"/>
	    <div class="site-section bg-light">
				<div class="container">
					<div class="d-block d-md-flex listing-horizontal">
						<div class="lh-content" style="text-align:center;">
							<h4 class="font-weight-light text-info">예약 매칭 중입니다.</h4>
							<h5 class="font-weight-light text-info" style="font-color:black;">예약 내역</h5>
								<div>게시글 : ${waitlist.board_seq }</div>
								<div>펫시터 : ${waitlist.petsitter_id }</div>
								<div>반려인 : ${waitlist.mem_id }</div>
								<div>돌봄 맡길 애완견 : ${waitlist.rsv_pet_name }</div>
								<div>결제 포인트 : ${waitlist.rsv_point}  </div>
								<div>시작일 : ${waitlist.rsv_start_day }</div>
								<div>종료일 : ${waitlist.rsv_end_day }</div>
								<div>시간 : ${waitlist.rsv_time }</div>
						</div>
					</div>
				</div>
				<div class="btns" style="text-align:center;">
					<button id="tolist" class="btn btn-primary text-#878786 btn-md px-5 font-weight-bold btn-md-block">목록으로</button>
				</div>
			</div>
	    

	<jsp:include page="/WEB-INF/views/petsitter_board/footer.jsp"/>
	</body>
</html>
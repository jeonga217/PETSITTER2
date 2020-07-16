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
					<div class="row justify-content-center mb-5">
						<div class="col-md-7 text-center border-primary">
							<h4 class="font-weight-light text-info">예약 매칭 중입니다.</h4>
								게시글 : ${waitlist.board_seq }
								펫시터 : ${waitlist.petsitter_id }
								
							
							<button id="tolist" class="btn btn-primary text-#878786 btn-md px-5 font-weight-bold btn-md-block">목록으로</button>
						</div>
					</div>
				</div>
			</div>
	    

	<jsp:include page="/WEB-INF/views/petsitter_board/footer.jsp"/>
	</body>
</html>
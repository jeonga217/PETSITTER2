<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 
////////////////////////////////////////////////////////////////

Author: Free-Template.co
Author URL: http://free-template.co.
License: https://creativecommons.org/licenses/by/3.0/
License URL: https://creativecommons.org/licenses/by/3.0/
Site License URL: https://free-template.co/template-license/
  
Website:  https://free-template.co
Facebook: https://www.facebook.com/FreeDashTemplate.co
Twitter:  https://twitter.com/Free_Templateco
RSS Feed: https://feeds.feedburner.com/Free-templateco

////////////////////////////////////////////////////////////////
-->
<!DOCTYPE html>
<html lang="en">
<head>

<title>Browse &mdash; Free Website Template by Free-Template.co</title>

<style>
#comments {
	width: 100%;
	height: 100px;
	overflow-y: auto;
}
</style>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="Free-Template.co" />

<link rel="shortcut icon" href="ftco-32x32.png">
<link href="https://fonts.googleapis.com/css?family=Rubik:400,700" rel="stylesheet">
<link rel="stylesheet" href="/resources/community/fonts/icomoon/style.css">
<link rel="stylesheet" href="/resources/community/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/community/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/community/css/jquery-ui.css">
<link rel="stylesheet" href="/resources/community/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/community/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/resources/community/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="/resources/community/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="/resources/community/css/aos.css">
<link rel="stylesheet" href="/resources/community/css/rangeslider.css">
<link rel="stylesheet" href="/resources/community/css/style.css">

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

</head>
<body>

	<div class="site-wrap">

		<div class="site-mobile-menu">
			<div class="site-mobile-menu-header">
				<div class="site-mobile-menu-close mt-3">
					<span class="icon-close2 js-menu-toggle"></span>
				</div>
			</div>
			<div class="site-mobile-menu-body"></div>
		</div>

		<header class="site-navbar" role="banner">

			<div class="container">
				<div class="row align-items-center">

					<div class="col-11 col-xl-2">
						<h1 class="mb-0 site-logo">
							<a href="index.html" class="text-white h2 mb-0">Browse</a>
						</h1>
					</div>
					<div class="col-12 col-md-10 d-none d-xl-block">
						<nav class="site-navigation position-relative text-right" role="navigation">

							<ul class="site-menu js-clone-nav mr-auto d-none d-lg-block">
								<li><a href="index.html"><span>Home</span></a></li>
								<li class="has-children"><a href="about.html"><span>Dropdown</span></a>
									<ul class="dropdown arrow-top">
										<li><a href="#">Menu One</a></li>
										<li><a href="#">Menu Two</a></li>
										<li><a href="#">Menu Three</a></li>
										<li class="has-children"><a href="#">Dropdown</a>
											<ul class="dropdown">
												<li><a href="#">Menu One</a></li>
												<li><a href="#">Menu Two</a></li>
												<li><a href="#">Menu Three</a></li>
												<li><a href="#">Menu Four</a></li>
											</ul></li>
									</ul></li>
								<li class="active"><a href="listings.html"><span>Listings</span></a></li>
								<li><a href="about.html"><span>About</span></a></li>
								<li><a href="blog.html"><span>Blog</span></a></li>
								<li><a href="contact.html"><span>Contact</span></a></li>
							</ul>
						</nav>
					</div>

					<div class="d-inline-block d-xl-none ml-md-0 mr-auto py-3" style="position: relative; top: 3px;">
						<a href="#" class="site-menu-toggle js-menu-toggle text-white"></a>
					</div>

				</div>

			</div>
	</div>

	</header>



	<div class="site-blocks-cover inner-page-cover overlay" style="background-image: url(/resources/community/images/hero_1.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
		<div class="container">
			<div class="row align-items-center justify-content-center text-center">

				<div class="col-md-10" data-aos="fade-up" data-aos-delay="400">

					<div class="row justify-content-center">
						<div class="col-md-8 text-center">
							<h1>${view.cu_title}</h1>
							<p class="mb-0">${view.cu_category_type}</p>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>

	<div class="site-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">

					<div class="mb-5 border-bottom pb-5">
						<p>
							<img src="${view.cu_thumb}" alt="Image" class="img-fluid mb-4">
						</p>

						<p>${view.cu_contents}</p>

						<div class="row">
							<div class="col">
								<a href="/community/list?cpage=${cpage}" class="btn btn-primary btn-md text-white">목록으로</a>
							</div>

							<c:choose>
								<c:when test="${view.cu_writer eq id}">
									<div class="col-md-4">
										<a href="/community/update?cu_seq=${view.cu_seq}" class="btn btn-primary btn-md text-white">수정하기</a>
									</div>
									<div class="col-md-4">
										<a href="/community/delete?cu_seq=${view.cu_seq}" class="btn btn-primary btn-md text-white community_delete">삭제하기</a>
									</div>
								</c:when>
								<c:otherwise>
									<div class="col-md-4">
										<!-- Button trigger modal -->
										<button type="button" class="btn btn-primary btn-md text-white" data-toggle="modal" data-target="#staticBackdrop">신고하기</button>
									</div>
								</c:otherwise>
							</c:choose>

						</div>
					</div>





					<h2 class="mb-5 text-primary">댓글</h2>

					<textarea id="comments" name="cm_contents" class="contents" required></textarea>
					<button class="btn btn-primary btn-md text-white" id="comments_insert">댓글입력</button>

					<script>
						$("#comments_insert").on("click", function() {
							var contents = $("#comments").val();
							
							if(contents.trim() == ""){
								alert("댓글 내용을 입력하세요");
								$("#comments").focus();
								return false;
							}
							$.ajax({
								url : "/community/comments_insert",
								type : "POST",
								data : {
									cm_contents : contents
								}
							})
							window.location.reload();
						})
					</script>

					<c:forEach var="i" items="${cm_list}">
						<div class="d-block d-md-flex listing-horizontal">
							<div class="comments">${i.cm_writer}</div>
							<div class="lh-content">
								<div class="contents" id="cm_contents">
									<p>${i.cm_contents}</p>
								</div>
								<p>
									<span>${i.cm_date}</span>
								</p>

								<c:choose>
									<c:when test="${i.cm_writer eq id}">
										<button class="btn btn-primary btn text-white comments_update">댓글수정</button>
										<button class="btn btn-primary btn text-white comments_updatecom" id="${i.cm_seq}" style="display: none">수정완료</button>
										<button class="btn btn-primary btn text-white comments_delete" id="${i.cm_seq}" >댓글삭제</button>
									</c:when>
									<c:otherwise>
										<div class="col-md-4">
											<!-- Button trigger modal -->
											<button type="button" class="btn btn-primary btn-md text-white report" id="${i.cm_seq}" data-toggle="modal" data-target="#staticBackdrop">신고하기</button>
										</div>
									</c:otherwise>
								</c:choose>
							</div>

						</div>


					</c:forEach>

					<!-- Modal -->
					<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="staticBackdropLabel">신고하기</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
								<form name="report_mem">
									<input type="text" id="r_seq" name="r_parent_seq" value=0>
									<input type="text" id="r_target" name="report_target" value=""> 
									<textarea name="report_contents" style="width: 100%" placeholder="신고내용을 간단히 기재해주세요" id="report_text"></textarea>
								</form>
								</div>
								
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소하기</button>
									<button type="button" class="btn btn-primary" id="report_bt">신고하기</button>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 신고하기 -->
					<script>
						$(".report").on("click",function(){
							$("#r_seq").val($(this).attr("id"));
							$("#r_target").val($(this).parent().parent().parent().children(".comments").html());
						})
						
					
					
						$('#myModal').on('shown.bs.modal', function() {
							$('#myInput').trigger('focus')
						})
						
						
						$("#report_bt").on("click",function(){
							var queryString = $("form[name=report_mem]").serialize();
							$.ajax({
								type: "POST",
								url: "/community/report",
								data : queryString,
								cache: false,
								dataType : "json",
								processData : false,
								success: function(data){
									check = data.re;
									if(check > 0 ){
										alert('성공적으로 메세지를 전송하였습니다.');
										location.reload();
									}
									else{
										alert('메세지 전송에 실패했습니다.');
									}		
								}	
							})

						})
				
						
					</script>
					
					<!-- 댓글 수정 -->
					<script>
						$(".comments_update").on( "click", function() {
								$(this).parent().children(".contents") .attr("contenteditable", "true");
								$(this).parent().children( ".comments_updatecom").css( "display", "");
							})
						$(".comments_updatecom").on( "click", function() {
								var cm_contents = $(this).parent() .children(".contents").html();
								var cm_seq = $(this).attr("id");
								console.log(cm_seq);
								$.ajax({
									url : "/community/comments_update",
									type : "POST",
									data : {
									cm_contents : cm_contents,
									cm_seq : cm_seq
										}
									})
									window.location.reload()
								})
					</script>
					
					<!-- 댓글삭제 -->
					<script>
						$(".comments_delete").on("click", function(){
							var comment_del = confirm("정말 삭제하시겠습니까?");
							var cm_seq = $(this).attr("id");
							if(comment_del==true){
								
								$.ajax({
									url : "/community/comments_delete",
									type : "POST",
									data : {
									cm_seq : cm_seq
										}
									})
									window.location.reload()
							} else {
								return false;
							}
						})
					</script>
					
					<!-- 게시글 삭제  -->
					<script>
						$(".community_delete").on("click",function(){
							var community_del = confirm("정말 삭제하시겠습니까?");
							var cu_seq = $(this).attr("id");
							
							if(community_del == true){
								return true;
							} else {
								return false;
							}
						})
					</script> 
					<c:if test="${empty cm_list}">
            		댓글이 없습니다
           			</c:if>
				</div>
			</div>
		</div>
	</div>
	</div>


	<div class="py-5 bg-primary">
		<div class="container">
			<div class="row">
				<div class="col-lg-7 mr-auto mb-4 mb-lg-0">
					<h2 class="mb-3 mt-0 text-white">Let's get started. Create your account</h2>
					<p class="mb-0 text-white">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
				</div>
				<div class="col-lg-4">
					<p class="mb-0">
						<a href="signup.html" class="btn btn-outline-white text-white btn-md px-5 font-weight-bold btn-md-block">Sign Up</a>
					</p>
				</div>
			</div>
		</div>
	</div>

	<footer class="site-footer">
		<div class="container">
			<div class="row">
				<div class="col-md-9">
					<div class="row">
						<div class="col-md-6 mb-5 mb-lg-0 col-lg-3">
							<h2 class="footer-heading mb-4">Quick Links</h2>
							<ul class="list-unstyled">
								<li><a href="#">About Us</a></li>
								<li><a href="#">Services</a></li>
								<li><a href="#">Testimonials</a></li>
								<li><a href="#">Contact Us</a></li>
							</ul>
						</div>
						<div class="col-md-6 mb-5 mb-lg-0 col-lg-3">
							<h2 class="footer-heading mb-4">Products</h2>
							<ul class="list-unstyled">
								<li><a href="#">About Us</a></li>
								<li><a href="#">Services</a></li>
								<li><a href="#">Testimonials</a></li>
								<li><a href="#">Contact Us</a></li>
							</ul>
						</div>
						<div class="col-md-6 mb-5 mb-lg-0 col-lg-3">
							<h2 class="footer-heading mb-4">Features</h2>
							<ul class="list-unstyled">
								<li><a href="#">About Us</a></li>
								<li><a href="#">Services</a></li>
								<li><a href="#">Testimonials</a></li>
								<li><a href="#">Contact Us</a></li>
							</ul>
						</div>
						<div class="col-md-6 mb-5 mb-lg-0 col-lg-3">
							<h2 class="footer-heading mb-4">Follow Us</h2>
							<a href="#" class="pl-0 pr-3"><span class="icon-facebook"></span></a>
							<a href="#" class="pl-3 pr-3"><span class="icon-twitter"></span></a>
							<a href="#" class="pl-3 pr-3"><span class="icon-instagram"></span></a>
							<a href="#" class="pl-3 pr-3"><span class="icon-linkedin"></span></a>
						</div>
					</div>
				</div>
				<div class="col-lg-3">
					<h2 class="footer-heading mb-4">Subscribe Newsletter</h2>
					<p>Far far away, behind the word mountains, far from the
						countries Vokalia and Consonantia, there live the blind texts.</p>
					<form action="#" method="post">
						<div class="input-group mb-3">
							<input type="text" class="form-control bg-transparent"
								placeholder="Enter Email" aria-label="Enter Email"
								aria-describedby="button-addon2">
							<div class="input-group-append">
								<button class="btn btn-primary text-white" type="button"
									id="button-addon2">Send</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="row pt-5 mt-5">
				<div class="col-12 text-md-center text-left">
					<p>
						<!-- Link back to Free-Template.co can't be removed. Template is licensed under CC BY 3.0. -->
						&copy; 2019 <strong class="text-black">Browse</strong> Free Template. All Rights Reserved. <br> Design by <a href="https://free-template.co/" target="_blank" class="text-black">Free-Template.co</a>
					</p>
				</div>
			</div>
		</div>
	</footer>
	</div>

	<script src="/resources/community/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/community/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="/resources/community/js/jquery-ui.js"></script>
	<script src="/resources/community/js/popper.min.js"></script>
	<script src="/resources/community/js/bootstrap.min.js"></script>
	<script src="/resources/community/js/owl.carousel.min.js"></script>
	<script src="/resources/community/js/jquery.stellar.min.js"></script>
	<script src="/resources/community/js/jquery.countdown.min.js"></script>
	<script src="/resources/community/js/jquery.magnific-popup.min.js"></script>
	<script src="/resources/community/js/bootstrap-datepicker.min.js"></script>
	<script src="/resources/community/js/aos.js"></script>
	<script src="/resources/community/js/rangeslider.min.js"></script>

	<script src="/resources/community/js/main.js"></script>


</body>
</html>
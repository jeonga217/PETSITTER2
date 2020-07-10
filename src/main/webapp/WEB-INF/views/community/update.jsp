<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<style>
.wrapper {
	width: 800px;
	margin: 30px auto;
}

#title {
	width: 100%
}
</style>
<title>Insert title here</title>
</head>
<body>
<script>

</script>
	<div class="container-fluid">

		<div class="wrapper">


			<form action="updateProc">
			<input type="text" style="display: none" value="${view.cu_seq}" name="cu_seq">
			<input type="text" style="display: none" value="${view.cu_view_cnt}" name="cu_view_cnt">
			<div class="category">
				
			</div>
				<input type="text" id="title" class="title" name="cu_title" value="${view.cu_title}">
				<hr>
				<textarea id="summernote" name="cu_contents" class="contents">${view.cu_contents}</textarea>
				<input type="submit" value="수정">
			</form>
			<script>
				$('#summernote')
						.summernote(
								{
									toolbar : [
											[ 'style', [ 'style' ] ],
											[ 'font', [ 'bold', 'underline', 'clear' ] ],
											[ 'fontname', [ 'fontname' ] ],
											[ 'color', [ 'color' ] ],
											[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
											[ 'table', [ 'table' ] ],
											[ 'insert', [ 'link', 'picture' ] ],
											[ 'view', [ 'fullscreen', 'codeview', 'help' ] ], ],
									tabsize : 2,
									height : 500,
									disableResizeEditor : true
								});
				
			</script>
		</div>
	</div>
</body>
</html>
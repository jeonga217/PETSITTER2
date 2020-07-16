<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body>

	<input type="button" value="메세지 함 가기" id="go">
	<input type="button" value="관리자 페이지 가기" id="go2">

<script>
	$("#go").on("click",function(){
		location.href="message/recievelist";
	})
	$("#go2").on("click",function(){
		location.href="adminindex";
	})
</script>
</body>
</html>
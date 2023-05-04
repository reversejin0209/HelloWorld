<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<link href="${conPath }/css/board.css" rel="stylesheet">
<link href="${conPath }/css/member/login.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />

	<div class="background-color">
		<div id="login_form">
			<img alt="헬로월드 로고" src="${conPath }/img/logo.png" onclick="location.href='${conPath}/main.do'" style="size: 1.4em;">
			<br>
			<span>관리자님 오늘도 좋은 하루 보내세요</span>
			<form action="${conPath }/admin/adLogin.do" method="post">
				<table>
					<tr>
						<td><input type="text" name="adid" id="adid" required="required" autofocus="autofocus" value="${adid }" placeholder="아이디"></td>
					</tr>
					<tr>
						<td><input type="password" name="adpw" id="adpw" required="required" placeholder="비밀번호"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="로그인" class="btn"></td>
					</tr>
				</table>
			</form>
			<div>
				<a href="${conPath }/member/mLogin.do.do">회원모드</a>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/member/login.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:set var="SUCCESS" value="1" />
	<c:set var="FAIL" value="0" />
	<c:if test="${joinResult eq SUCCESS}">
		<script>
			alert('회원가입되었습니다. 감사합니다');
		</script>
	</c:if>
	<c:if test="${not empty failMsg}">
		<script>
			alert('${failMsg}');
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp" />

	<div class="background-img">
		<div id="login_form" class="center">
			<img alt="헬로월드 로고" src="${conPath }/img/logo.png" onclick="location.href='${conPath}/main.do'" style="size: 1.4em;">
			<br>
			<span>로그인 후 더 많은 서비스를 즐겨보세요.</span>
			<form action="${conPath }/member/mLogin.do" method="post">
				<input type="hidden" name="after" value="${param.after }">
				<table>
					<tr>
						<td><input type="text" name="mid" id="mid" required="required" autofocus="autofocus" value="${member.mid }" placeholder="아이디"></td>
					</tr>
					<tr>
						<td><input type="password" name="mpw" id="mpw" required="required" placeholder="비밀번호"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="로그인" class="btn"></td>
					</tr>
				</table>
			</form>
			<div>
				<a href="${conPath }/member/mJoin.do">회원가입</a>&nbsp; <span class="light">|</span> &nbsp;<a href="${conPath }/admin/adLogin.do">관리자모드</a>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
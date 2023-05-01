<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/member/login.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<c:set var="SUCCESS" value="1" />
	<c:set var="FAIL" value="0" />
	<c:if test="${joinResult eq SUCCESS}">
		<script>
			alert('회원가입되었습니다. 감사합니다');
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp" />
	<div id="login_form">
		<form action="${conPath }/member/mLogin.do" method="post">
			<table>
				<caption>
					<img alt="헬로월드 로고" src="${conPath }/img/logo.png"
						onclick="location.href='${conPath}/main.do'" style="size: 1.4em;"><br>
					<span>로그인 후 더 많은 서비스를 즐겨보세요.</span>
				</caption>
				<tr>
					<td>
						<input type="text" name="mid" id="mid" required="required"
							autofocus="autofocus" value="${member.mid }" placeholder="아이디">
					</td>
				</tr>
				<tr>
					<td>
						<input type="password" name="mpw" id="mpw" required="required"
							placeholder="비밀번호">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="로그인" class="btn">
					</td>
				</tr>
			</table>
			<p>
				<a href="${conPath }/member/mJoin.do">회원가입</a>&nbsp; <span
					class="light">I</span> &nbsp;<a href="${conPath }/admin/adLogin.do">관리자모드</a>
			</p>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
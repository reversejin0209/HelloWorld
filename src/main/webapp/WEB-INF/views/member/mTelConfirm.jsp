<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<c:if test="${telConfirmResult eq 1 }">
		<b style="color: red">중복된 연락처입니다. 사용 불가합니다.</b>
	</c:if>
	<c:if test="${telConfirmResult eq 0 }">
		<b style="color: #9729ff">사용 가능한 연락처입니다</b>
	</c:if>
</body>
</html>
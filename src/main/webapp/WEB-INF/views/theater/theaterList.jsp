<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
		$(document).ready(function() {
			$('tr').click(function() {
				var qanum = $(this).children().eq(0).text().trim();
				if (!isNaN(qanum)) {
					location.href = '${conPath}/qnaBoard/qBoardContent.do?qanum='
									+ qanum
									+ '&pageNum=${paging.currentPage}';
				}
			});
		});
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<h1 class="center">공연</h1>
		
		<table class="list_table">
			<tr>
				<th>번호</th>
				<th>번호</th>
				<th>번호</th>
				<th>번호</th>
			</tr>
		</table>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
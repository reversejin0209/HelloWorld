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
<link href="${conPath }/css/board.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
#wrap .center {
	height: 50px;
}
.detailNotice {
	overflow: hidden;
}
.detailNotice b {
	float: right;
}
</style>
<script>
	$(document).ready(function() {
		
	});
</script>
<c:if test="${empty noticeCn.prewrite }">
	${noticeCn.prewrite } == ${noticeCn.nno }
</c:if>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<h1 class="center">공지사항</h1>
		<hr>
		<div class="detailNotice">
			<h3 style="display: inline;">${noticeCn.ntype }</h3> &nbsp;
			<h2 style="display: inline;">${noticeCn.ntitle }</h2>
			<b style="display: inline;" class="right">${noticeCn.nrdate }</b>
		</div>
		<hr>
		<div class="txtArea" style="word-wrap: break-word;">
			<div style="text-align: center;">
				<img alt="공지사항 내용" src="${conPath }/noticeImg/${noticeCn.ncontent }" style="height: auto; max-width: 100%;" />
			</div>
		</div>
		<div class="prevNext">
			<hr>
			<div class="prev">							
				<span>이전글</span>
				<c:if test="${not empty noticeCn.prewrite }">
					<span><a href="${conPath }/notice/noticePre.do?nno=${noticeCn.nno }">이전 글</a></span>
				</c:if>							
			</div>
			<hr>
			<div class="next">
				<span>다음글</span>
				<c:if test="${not empty noticeCn.nextwrite }">
					<span><a href="${conPath }/notice/noticeContent.do?nextwrite=${noticeCn.nextwrite}">다음 글</a></span>
				</c:if>	
			</div>
			<hr>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>

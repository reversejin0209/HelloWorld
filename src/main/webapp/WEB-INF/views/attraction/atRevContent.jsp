<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<link href="${conPath }/css/board.css" rel="stylesheet">
<link href="${conPath }/css/attraction/arvList.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap_padding">
		<h1 class="center">${param.atname } 리뷰 게시판</h1>
		<div class="notice_box flex_wide">
			<h3>${param.atname } 질문 있어요!</h3>
			<br>
			<p><a href="${conPath}/attraction/At_rplyList.do"><b>질문하러가기☜</b></a></p>
		</div>
		
		<!-- 게시판 -->
		<table class="content_table">
			<tr>	
				<td>별점</td>
				<td>
					<c:forEach var="rating" items="${ratingOptions }" varStatus="status" 
					begin="1" end="5">
						<c:choose>
							<c:when test="${status.index <= atRevContent.arvrating }">
								<span class="star-ratings star-ratings-fill">★</span>
							</c:when>
							<c:otherwise>
							    <span class="star-ratings star-ratings-empty">☆</span>
							</c:otherwise>
						</c:choose>
					</c:forEach>${atRevContent.arvrating }
				</td>
			</tr>
			<tr>
				<td class="title">리뷰내용</td>
				<td class="title">${atRevContent.arvcontent }</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<c:if test="${atRevContent.mid != null }">
						${atRevContent.mid }
					</c:if>
				</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td colspan="2"><fmt:formatDate value="${atRevContent.arvrdate }" type="date"
						pattern="yyyy-MM-dd " /></td>
			</tr>
			<tr>
				<td>IP</td>
				<td colspan="2">${atRevContent.arvip }</td>
			</tr>
			
			<!-- 회원: 자신이 작성한 글만 삭제 가능 -->
			<tr>
				<td colspan="3" class="btnBox">
			<c:if test="${member.mid eq atRevContent.mid}">
				<input type="button" onclick="location.href='${conPath}/attraction/atRevDelete.do?&arvnum=${param.arvnum }&atname=${param.atname }&atcode=${param.atcode }&pageNum=${param.pageNum }'" value="삭제" class="btn_grey">
			</c:if>
				<input type="button" onclick="location.href='${conPath}/attraction/atRevList.do?pageNum=${param.pageNum }&atcode=${param.atcode }&atname=${param.atname }'" value="목록" class="btn_grey">
				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>

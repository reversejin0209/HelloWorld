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
<script>
	$(document).ready(function() {
		
	});
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<h1 class="center">공지사항</h1>
		<table class="list_table">
			<tr>
				<th>번호</th>
				<th>구분</th>
				<th class="title">제목</th>
				<th>작성자</th>
				<th>게시일</th>
			</tr>
			<c:if test="${totCnt ==0}">
				<tr>
					<td colspan="5">
						<h4>등록된 게시글이 없습니다</h4>
					</td>
				</tr>
			</c:if>
			<c:if test="${totCnt != 0}">
				<c:forEach var="notice" items="${noticeList }">
					<tr>
						<td>${notice.nno }</td>
						<td>${notice.ntype }</td>
						<td class="title left">
						<a href="${conPath }/notice/noticeContent.do">${notice.ntitle }</a>
						</td>
						<td>${notice.adname }</td>
						<td>${notice.nrdate }</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
	<div id="paging">
         <c:if test="${paging.startPage>paging.blockSize}">
            <a href="${conPath }/noticeList.do?method=noticeList&pageNum=${paging.startPage-1 }">이전</a>
         </c:if>
         <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
            <c:if test="${paging.currentPage==i }">
               <span>${i }</span>
            </c:if>
            <c:if test="${paging.currentPage != i }">
               <a href="${conPath }/noticeList.do?method=noticeList&pageNum=${i }">${i }</a>
            </c:if>
         </c:forEach>
         <c:if test="${paging.endPage<paging.pageCnt }">
            <a ref="${conPath }/noticeList.do?method=noticeList&pageNum=${paging.endPage+1 }">다음</a>
         </c:if>
      </div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
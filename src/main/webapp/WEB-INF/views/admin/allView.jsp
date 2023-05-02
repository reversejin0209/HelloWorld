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
<link href="${conPath }/css/admin/mlist.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	$(document).ready(function() {
		
	});
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<h1 class="center">전체 회원 리스트</h1>
		<div>
			<table class="list_table">
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>방문횟수</th>
					<th>회원등급</th>
					<th>탈퇴여부</th>
				</tr>
				<c:if test="${memberList.size() == 0 }">
					<tr>
						<td colspan="7">
							<h4>등록된 회원이 없습니다.</h4>
						</td>
					</tr>
				</c:if>
			<c:if test="${memberList.size() != 0 }">
				<c:forEach var="mList" items="${memberList }">
					<tr>
						<td onclick="location.href='${conPath}/admin/deleteMember.do'">${mList.mid }</td>
						<td>${mList.mname }</td>
						<td>${mList.mmail }</td>
						<td>${mList.mtel }</td>
						<td>${mList.mvisit }</td>
						<td>${mList.grade }</td>
						<td>${mList.mwith }</td>
					</tr>
				</c:forEach>
			</c:if>
			</table>
		</div>
		<!-- 페이징 -->
		<div id="paging">
			<c:if test="${paging.startPage>paging.blockSize}">
				<a
					href="${conPath }/qnaBoard/qBoardList.do?pageNum=${paging.startPage-1 }&schItem=${param.schItem }&schWord=${param.schWord}">이전</a>
			</c:if>
			<c:forEach var="i" begin="${paging.startPage}"
				end="${paging.endPage }">
				<c:if test="${paging.currentPage==i }">
					<span>${i }</span>
				</c:if>
				<c:if test="${paging.currentPage != i }">
					<a
						href="${conPath }/qnaBoard/qBoardList.do?method=list&pageNum=${i }&schItem=${param.schItem }&schWord=${param.schWord}">${i }</a>
				</c:if>
			</c:forEach>
			<c:if test="${paging.endPage<paging.pageCnt }">
				<a
					href="${conPath }/qnaBoard/qBoardList.do&pageNum=${paging.endPage+1 }&schItem=${param.schItem }&schWord=${param.schWord}">다음</a>
			</c:if>
		</div>
	</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>

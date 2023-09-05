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
<!-- 검색 아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
	<c:if test="${not empty successMsg }">
		<script>
			alert('${successMsg}');
		</script>
	</c:if>
	<c:if test="${not empty failMsg}">
		<script>
			alert('${failMsg}');
		</script>
	</c:if>
	
	<jsp:include page="../main/header.jsp" />
	<div id="wrap_padding">
		<h1 class="center">1:1 문의게시판</h1>

		<div class="search_box">
			<form action="${conPath }/qnaBoard/qBoardList.do" method="get"
				class="right">
				<select name="schItem">
					<option value=""
						<c:if test="${param.schItem eq '' }" >selected="selected"</c:if>>검색
						조건</option>
					<option value="all"
						<c:if test="${param.schItem eq 'all' }" >selected="selected"</c:if>>전체검색</option>
					<option value="title"
						<c:if test="${param.schItem eq 'title' }" >selected="selected"</c:if>>제목</option>
					<option value="writer"
						<c:if test="${param.schItem eq 'writer' }" >selected="selected"</c:if>>작성자</option>
				</select>
				<div class="search">
					<input type="text" name="schWord" value="${param.schWord }"
						placeholder="검색어를 입력하세요">
					<button>
						<!-- <span class="material-symbols-rounded"> search </span> -->
						<img alt="검색 아이콘" src="${conPath }/img/search_FILL0_wght400_GRAD0_opsz24.svg">
					</button>
				</div>
			</form>
		</div>

		<!-- 게시판 -->
		<table class="list_table">
			<tr>
				<th>번호</th>
				<th>카테고리</th>
				<th class="title">제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
			<c:if test="${qnaList.size() == 0}">
				<tr>
					<td colspan="6">
						<h4>등록된 게시글이 없습니다.</h4>
					</td>
				</tr>
			</c:if>
			<c:if test="${totCnt != 0}">
				<c:forEach var="qna" items="${qnaList }">
					<tr>
						<td>${qna.qanum }</td>
						<td>${qna.qacat }</td>
						<!-- 제목 -->
						<td class="title left"><c:forEach var="i" begin="1"
								end="${qna.qaindent }">
								<c:if test="${i != qna.qaindent }">
									 &nbsp; &nbsp; 
								</c:if>
								<c:if test="${i == qna.qaindent }">
									 ㄴ
								</c:if>
							</c:forEach> ${qna.qatitle } <%-- 인기글 표시 --%> <c:if test="${qna.qahit > 10}">&#127752;<b
									class="purple">인기글</b>
							</c:if> <!-- 파일첨부 표시 --> <c:if test="${not empty review.rphoto}">&#128196;</c:if>
						</td>
						<td><c:if test="${not empty qna.mid }">
								${qna.writer }
							</c:if> <c:if test="${not empty qna.adid }">
								관리자
							</c:if></td>
						<td>${qna.qahit }</td>
						<td><fmt:formatDate value="${qna.qardate }" type="date"
								dateStyle="short" /></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div class="right">
			<c:if test="${empty member }">
				<b class="grey">글쓰기는 로그인 후 이용할 수 있습니다.</b>
			</c:if>
			<c:if test="${not empty member }">
				<button onclick="location.href='${conPath}/qnaBoard/qBoardWrite.do'" class="btn_submit">글쓰기</button>
			</c:if>
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
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
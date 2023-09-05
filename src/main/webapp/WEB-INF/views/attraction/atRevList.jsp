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
	<link href="${conPath }/css/attraction/arvList.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
		$(document).ready(function() {
			$('tr').click(function() {
				var arvnum = $(this).children().eq(0).text().trim();
				if (!isNaN(arvnum)) {
					location.href = '${conPath}/attraction/atRevContent.do?arvnum='
									+ arvnum
									+ '&atcode=${param.atcode}'
									+ '&atname=${param.atname}'
									+ '&pageNum=${paging.currentPage}';
				}
			});
		});
	</script>
	<style>
	  #head_background {
	  		background-image: url('${conPath}/img/head_background_02.png');
	  }
	</style>

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
	<!-- 상단 배경 이미지 -->
	<div id="head_background">
		<div class="head_background_inner">
			<h1>${param.atname }</h1>
			<p>놀이기구는 어땠나요 다른 분들과 소중한 추억을 나누어 보세요!</p>
		</div>
	</div>
	<div id="wrap_padding">
			<div class="search_box">
				<form action="${conPath }/attraction/atRevList.do?atcode=${param.atcode}&atname=${param.atname}&pageNum=${paging.currentPage}&schItem=${param.schItem}" method="get"
					class="right">
				<input type="hidden" name="atcode" value="${param.atcode}" />
  				<input type="hidden" name="atname" value="${param.atname}" />
  				<input type="hidden" name="pageNum" value="${param.pageNum }">
					<select name="schItem">
						<option value=""
							<c:if test="${param.schItem eq '' }" >selected="selected"</c:if>>검색
							조건</option>
						<option value="arvrating"
							<c:if test="${param.schItem eq 'arvrating' }" >selected="selected"</c:if>>별점순</option>
						<option value="arvhit"
							<c:if test="${param.schItem eq 'arvhit' }" >selected="selected"</c:if>>조회수</option> 
					</select>
					<div class="search">
						<button>
							<!-- <span class="material-symbols-rounded"> search </span> -->
							<img alt="검색 아이콘" src="${conPath }/img/search_FILL0_wght400_GRAD0_opsz24.svg">
						</button>
					</div>
				</form>
			</div>
		<!-- 리뷰리스트 -->
		<table class="list_table">
			<tr>
				<th class="numTh">번호</th>
				<th class="ratingTh">별점</th>
				<th class="idTh">아이디</th>
				<th class="contentTh">리뷰</th>
				<th class="rdateTh">날짜</th>
			</tr>
			<c:if test="${arvList.size() == 0}">
				<tr>
					<td colspan="5">등록된 리뷰가 존재하지 않습니다</td>
				</tr>
			</c:if>
			<c:if test="${arvList.size() != 0}">
				<c:forEach var="arv" items="${arvList }" varStatus="status">
					<tr>
						<td>${arv.arvnum }</td>
						<td>
							<c:forEach var="rating" items="${ratingOptions }" varStatus="status" 
							begin="1" end="5">
							  <c:choose>
							    <c:when test="${status.index <= arv.arvrating }">
							      <span class="star-ratings star-ratings-fill">★</span>
							    </c:when>
							    <c:otherwise>
							      <span class="star-ratings star-ratings-empty">☆</span>
							    </c:otherwise>
							  </c:choose>
							</c:forEach>${arv.arvrating }
						</td>
						<td>${arv.mid}</td>
						<td style="text-align: left;">${arv.arvcontent }</td>
						<td>${arv.arvrdate }</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div class="right">
			<c:if test="${empty member }">
				<b class="grey">글쓰기는 로그인 후 이용할 수 있습니다.</b>
			</c:if>
			<c:if test="${not empty member }">
				<button onclick="location.href='${conPath}/attraction/atRevWrite.do?atcode=${param.atcode}&atname=${param.atname}&pageNum=${paging.currentPage}'" class="btn_submit">글쓰기</button>
			</c:if>
		</div>
	<div id="paging">
		<c:if test="${paging.startPage>paging.blockSize}">
			<a href="${conPath }/attraction/atRevList.do?atcode=${param.atcode }&atname=${param.atname }&pageNum=${paging.startPage-1 }&schItem=${param.schItem }">이전</a>
		</c:if>
		<c:forEach var="i" begin="${paging.startPage}"
			end="${paging.endPage }">
			<c:if test="${paging.currentPage==i }">
				<span>${i }</span>
			</c:if>
			<c:if test="${paging.currentPage != i }">
				<a href="${conPath }/attraction/atRevList.do?method=arv&atcode=${param.atcode }&atname=${param.atname }&pageNum=${i }&schItem=${param.schItem }">${i }</a>
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage<paging.pageCnt }">
			<a href="${conPath }/attraction/atRevList.do?atcode=${param.atcode }&atname=${param.atname }&pageNum=${paging.endPage+1 }&schItem=${param.schItem }">다음</a>
		</c:if>
	</div>
	</div>
	<!-- 페이징 -->
<jsp:include page="../main/footer.jsp" />
</body>
</html>

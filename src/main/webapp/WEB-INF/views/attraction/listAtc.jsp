<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<link href="${conPath }/css/attraction/attraction.css" rel="stylesheet">
<link href="${conPath }/css/board.css" rel="stylesheet">
<style type="text/css">
#head_background {
	background-image: url('${conPath}/img/head_background_02.png');
}
</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	$(document)
			.ready(
					function() {
						$('.atcBox')
								.click(
										function() {
											var atcode = $(this).children().eq(
													0).val().trim();
											location.href = '${conPath }/attraction/detailAtc.do?atcode='
													+ atcode
													+ '&pageNum=${paging.currentPage}';
										});
					});
</script>
</head>
<body>
	<c:if test="${not empty successMsg }">
		<script>
			alert('${successMsg }');
		</script>
	</c:if>
	<c:if test="${not empty failMsg }">
		<script>
			alert('${failMsg }');
			history.back();
		</script>
	</c:if>


	<jsp:include page="../main/header.jsp" />

	<!-- 상단 배경 이미지 -->
	<div id="head_background">
		<div class="head_background_inner">
			<h1>어트랙션</h1>
			<p>언제나 새롭고 즐거운 경험을 주는 Helloworld 어트랙션을 소개합니다!</p>
			<div class="margin"></div>
			<div class="margin"></div>
		</div>
	</div>


	<div id="wrap">

		<!-- 검색박스 -->
		<form action="${conPath }/attraction/listAtc.do" method="get">
			<div class="atc_schBox">
				<h2 class="center">나에게 맞는 어트랙션을 찾아보세요!</h2>

				<div class="flex_wide">
					<div class="schBox_row">
						<h3>위치</h3>
						<select name="zname">
							<option value="" <c:if test="${param.zname == ''}">selected="selected"</c:if>>전체</option>
							<option value="익스트림존" <c:if test="${param.zname == '익스트림존' }">selected="selected"</c:if>>익스트림존</option>
							<option value="매지컬랜드" <c:if test="${param.zname == '매지컬랜드' }">selected="selected"</c:if>>매지컬랜드</option>
							<option value="어드벤처존" <c:if test="${param.zname == '어드벤처존' }">selected="selected"</c:if>>어드벤처존</option>
							<option value="워터월드존" <c:if test="${param.zname == '워터월드존' }">selected="selected"</c:if>>워터월드존</option>
						</select>
					</div>
					<div class="schBox_row">
						<h3>나이</h3>
						<input type="number" name="schOld " value="${param.schOld  }" placeholder="나이를 입력해주세요">
					</div>
					<div class="schBox_row">
						<h3>키</h3>
						<input type="number" name="schHeight " value="${param.schHeight  }" placeholder="키를 입력해주세요">
					</div>
					<div class="schBox_row">
						<h3>인원제한</h3>
						<input type="number" name="schAtnop " value="${param.schAtnop  }" placeholder="인원 수를 입력해주세요">
					</div>
				</div>
				<div class="center">
					<input type="submit" value="조회하기" class="schBox_btn">
					&nbsp;
					<input type="submit" value="되돌리기" class="schBox_btn">
				</div>
			</div>
		</form>
		<!-- <div class="atc_schBox"> -->

		<!-- 놀이기구 출력 3xa -->
		<div class="atcList">
			<c:forEach var="atc" items="${listAtc}" varStatus="status">
				<div class="atcBox">
					<input type="hidden" name="atcode" value="${atc.atcode }">
					<div class="atcBox_img">
						<img src="${conPath }/attractionImg/${atc.atimage}">
					</div>
					<div class="atcBox_content">
						<h2>${atc.atname }</h2>
						<p>${atc.zname }</p>
					</div>
				</div>
			</c:forEach>

			<div class="center">
				<c:if test="${not empty admin }">
					<button onclick="location.href='${conPath}/attraction/insertAtc.do'" class="btn_submit">기구등록</button>
				</c:if>
			</div>
		</div><!-- <div class="atcList"> -->
	</div>

	<br>
	<!-- 페이징 -->
	<div id="paging">
		<c:if test="${paging.startPage>paging.blockSize}">
			<a href="${conPath }/attraction/listAtc.do?pageNum=${paging.startPage-1 }">이전</a>
		</c:if>
		<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
			<c:if test="${paging.currentPage==i }">
				<span>${i }</span>
			</c:if>
			<c:if test="${paging.currentPage != i }">
				<a href="${conPath }/attraction/listAtc.do?method=list&pageNum=${i }">${i }</a>
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage<paging.pageCnt }">
			<a href="${conPath }/attraction/listAtc.do?pageNum=${paging.endPage+1 }">다음</a>
		</c:if>
	</div>
	<div class="margin"></div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>

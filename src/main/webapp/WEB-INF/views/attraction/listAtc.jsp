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
#atcList_background {
	background-image: url(${conPath}/img/atcList_background.png);
}
</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
	<div id="atcList_background">
		<h2 class="cWhite">어트랙션</h2>
		<p class="h2Txt cWhite">
			언제나 새롭고 즐거운 경험을 주는 Helloworld 어트랙션을 소개합니다!
		</p>
	</div>
	<div id="wrap">
		<div id="content">
		<!-- 검색박스 -->
		<div class="atc_schBox">
			<!-- ** 경로 수정 ** -->
			<form action="${conPath }/attraction/listAtc.do" method="get">
				<h3 class="center">나에게 맞는 어트랙션을 찾아보세요!</h3>
				<ul class="atc_schBox_row">
					<li>
						<h3>위치</h3> <select name="schItem">
							<option value="" 
								<c:if test="${param.zname == ''}">selected="selected"</c:if>>
							</option>
							<option value="익스트림존" 
								<c:if test="${param.zname == '익스트림존'}">selected="selected"</c:if>>익스트림존</option>
							<option value="매지컬랜드" <c:if test="${param.zname == '매지컬랜드' }">selected="selected"</c:if>>매지컬랜드</option>
							<option value="어드벤처존" <c:if test="${param.zname == '어드벤처존' }">selected="selected"</c:if>>어드벤처존</option>
							<option value="워터월드존" <c:if test="${param.zname == '워터월드존' }">selected="selected"</c:if>>워터월드존</option>
					</select>
					</li>
					<li>
						<h3>나이</h3> <select name="schItem">
							<option value="" <c:if test="${param.atold == ''}">selected="selected"</c:if>></option>
							<option value="0~5세" <c:if test="${param.atold == '0~5세' }">selected="selected"</c:if>>0~5세</option>
							<option value="6~65세" <c:if test="${param.atold == '6~65세' }">selected="selected"</c:if>>6~65세</option>
							<option value="66세" <c:if test="${param.atold == '66세' }">selected="selected"</c:if>>66세</option>
					</select>
					</li>
					<li>
						<h3>키</h3> <input type="text" name="schWord" value="${param.schWord }" placeholder="키를 입력해주세요">
					</li>
					<li>
						<h3>인원제한</h3> <input type="text" name="schWord" value="${param.schWord }" placeholder="인원 수를 입력해주세요">
					</li>
				</ul>
				<div class="serchBox center">
					<input type="submit" value="검색" class="btn_white">
					&nbsp;
					<input type="reset" value="되돌리기" class="btn_white">
				</div>
			</form>
		</div>
			<div id="listAtc">
				<table>
					<tr>
						<c:forEach var="list" items="${listAtc}" varStatus="status">
							<c:if test="${status.index%5==0}">
								<tr></tr>
							</c:if>
							<td>
								<a href="${conPath }/attraction/detailAtc.do?atcode=${list.atcode}&pageNum=${paging.currentPage}"> <img
									src="${conPath }/attractionImg/${list.atimage}" style="width: 200px; height: 282px;"> <br> ${list.atname }<br> ${list.zname } <br>
								</a>
							</td>
						</c:forEach>
					</tr>
				</table>
			<div class="center">
				<c:if test="${not empty admin }">
					<button onclick="location.href='${conPath}/attraction/insertAtc.do'" class="btn_submit">기구등록</button>
				</c:if>
			</div>
			</div>
		</div>
	</div>
	<!-- 페이징 -->
	<div id="paging">
		<c:if test="${paging.startPage>paging.blockSize}">
			<a href="${conPath }/attraction/listAtc.do?pageNum=${paging.startPage-1 }&schItem=${param.schItem }&schWord=${param.schWord}">이전</a>
		</c:if>
		<c:forEach var="i" begin="${paging.startPage}"
			end="${paging.endPage }">
			<c:if test="${paging.currentPage==i }">
				<span>${i }</span>
			</c:if>
			<c:if test="${paging.currentPage != i }">
				<a href="${conPath }/attraction/listAtc.do?method=list&pageNum=${i }&schItem=${param.schItem }&schWord=${param.schWord}">${i }</a>
			</c:if>
			</c:forEach>
			<c:if test="${paging.endPage<paging.pageCnt }">
				<a href="${conPath }/attraction/listAtc.do?pageNum=${paging.endPage+1 }&schItem=${param.schItem }&schWord=${param.schWord}">다음</a>
			</c:if>
		</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>

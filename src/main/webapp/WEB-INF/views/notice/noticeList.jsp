<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<link href="${conPath }/css/board.css" rel="stylesheet">
<!-- 검색 아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@24,500,0,0" />
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	$(document).ready(function() {
		$('tr').click(function() {
			var qanum = $(this).children().eq(0).text().trim();
			if (!isNaN(nno)) {
				location.href = '${conPath}/notice/noticeContent.do?nno='
								+ nno
								+ '&pageNum=${paging.currentPage}';
			}
		});
	});
</script>
</head>
<body>
	<input type="hidden" name="adid" value="${admin.adid }">
	<c:set var="SUCCESS" value="1" />
	<c:set var="FAIL" value="0" />

	<!-- 게시글 삭제 실행 유무 -->
	<c:if test="${not empty deleteNtc }">
		<script>
			alert("${deleteNtc}");
		</script>
	</c:if>
	
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
		<h1 class="center">공지사항</h1>
	
		<div class="search_box">
			<form action="${conPath }/notice/noticeList.do" method="get"
				class="right">
				<select name="schItem">
					<option value=""
						<c:if test="${param.schItem eq '' }" >selected="selected"</c:if>>검색
						조건</option>
					<option value="all"
						<c:if test="${param.schItem eq 'all' }" >selected="selected"</c:if>>전체검색</option>
					<option value="title"
						<c:if test="${param.schItem eq 'title' }" >selected="selected"</c:if>>제목</option>
					<option value="ntype"
						<c:if test="${param.schItem eq 'ntype' }" >selected="selected"</c:if>>글타입</option>
				</select>
				<div class="search">
					<input type="text" name="schWord" value="${param.schWord }"
						placeholder="검색어를 입력하세요">
					<button>
						<img alt="검색 아이콘" src="${conPath }/img/search_FILL0_wght400_GRAD0_opsz24.svg">
					</button>
				</div>
			</form>
		</div>	
	
		<table class="list_table">
			<tr>
				<th>번호</th>
				<th>구분</th>
				<th class="title">제목</th>
				<th>작성자</th>
				<th>게시일</th>
			</tr>
			<c:if test="${noticeList.size() == 0}">
				<tr>
					<td colspan="5">
						<h4>등록된 게시글이 없습니다</h4>
					</td>
				</tr>
			</c:if>
			<c:if test="${noticeList.size() != 0}">
				<c:forEach var="notice" items="${noticeList }">
					<tr>
						<td>${notice.nno }</td>
						<td>${notice.ntype }</td>
						<td class="title left">
						<a href="${conPath }/notice/noticeContent.do?nno=${notice.nno}&prewrite=${notice.nno-1}&nextwrite=${notice.nno+1}">${notice.ntitle }</a>
						</td>
						<td>${notice.adname }[관리자]</td>
						<td><fmt:formatDate value="${notice.nrdate}" type="date"
								dateStyle="short" /></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div class="center">
			<c:if test="${not empty admin }">
				<button onclick="location.href='${conPath}/notice/noticeWrite.do'" class="btn_submit">공지등록</button>
			</c:if>
		</div>
	</div>
	<div id="paging">
         <c:if test="${paging.startPage>paging.blockSize}">
            <a href="${conPath }/notice/noticeList.do?pageNum=${paging.startPage-1 }">이전</a>
         </c:if>
         <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
            <c:if test="${paging.currentPage==i }">
               <span>${i }</span>
            </c:if>
            <c:if test="${paging.currentPage != i }">
               <a href="${conPath }/notice/noticeList.do?pageNum=${i }">${i }</a>
            </c:if>
         </c:forEach>
         <c:if test="${paging.endPage<paging.pageCnt }">
            <a href="${conPath }/notice/noticeList.do?pageNum=${paging.endPage+1 }">다음</a>
         </c:if>
      </div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
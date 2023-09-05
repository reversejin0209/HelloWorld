<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link href="${conPath }/css/member/member.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
$(document).ready(function() {
	$('tr').click(function() {
		var thrcode = $(this).children().eq(3).text().trim();
		if (thrcode != '주문번호') {
			$.ajax({
				url : '${conPath}/thRes/thResContent.do',
				type : 'get',
				data : 'thrcode=' + thrcode,
				dataType : 'html',
				success: function(data) {
					$('.myPage_right_white').html(data);
				},
			});
		}
	});
});
</script>
</head>
<body>
	<c:if test="${empty member }">
		<script>
			loation.href = '${conPath }/member/mLogin.do';
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
	<div class="background-color">
		<div id="wrap">
			<div id="myPage">

				<!-- left: myContent -->
				<div class="myContent">
					<ul>
						<li>
							<h3>안녕하세요!</h3>
							<h1>
								<a href="${conPath }/member/mMypage.do?mid=${mid}">${member.mname } 님</a>
							</h1> <br>
						</li>
						<li>
							<ul>
								<li><h4>나의 활동관리</h4></li>
								<li><a href="${conPath}/member/tOrderList.do">티켓 예매 내역</a></li>
								<li><a href="${conPath }/thRes/thResList.do?mid=${member.mid }">공연 예매 내역</a></li>
								<li><a href="${conPath }/thRev/mthRevList.do?mid=${member.mid }">공연 리뷰</a></li>
								<li><a href="">어트랙션 리뷰</a></li>
							</ul>

							<ul>
								<li><h4>나의 계정설정</h4></li>
								<li><a href="${conPath }/member/mModify.do">회원정보 수정</a></li>
								<li><a href="">회원등급</a></li>
							</ul>

							<ul>
								<li><h4>고객센터</h4></li>
								<li><a href="">1:1 문의내역</a></li>
								<li><a href="">어트랙션 문의내역</a></li>
								<li><a href="">공지사항</a></li>
								<li><a href="">FAQ</a></li>
								<li><a href="">고객의 소리</a></li>
							</ul>
						</li>
					</ul>
				</div>
				<!-- myContent -->

				<div class="myPage_right_white">
					<h1 class="center">나의 공연 예매 내역</h1>
					<br> 총 수량 : ${paging.totCnt }
					<table class="list_table">
						<tr>
							<th>공연일</th>
							<th class="title">공연 이름</th>
							<th>공연장소</th>
							<th>주문번호</th>
							<th>결제금액</th>
						</tr>

						<!-- 예매 내역이 없는 경우 -->
						<c:if test="${ticketList.size() == 0}">
							<tr>
								<td colspan="5">
									<h4>예매 내역이 없습니다.</h4>
								</td>
							</tr>
						</c:if>

						<c:forEach var="thRes" items="${thResListResult }">
							<tr>
								<td class="eng"><fmt:formatDate value="${thRes.thrdate }" pattern="yy.MM.dd" /></td>
								<td>${thRes.thname }</td>
								<td class="eng">${thRes.thloc }</td>
								<td class="eng">${thRes.thrcode }</td>
								<td class="eng"><fmt:formatNumber pattern="###,###" value="${thRes.thrtotprice }" /></td>
							</tr>
						</c:forEach>
					</table>
					<br>

					<!-- 페이징 -->
					<div id="paging">
						<c:if test="${paging.startPage>paging.blockSize}">
							<a href="${conPath }/thRes/thResList.do?pageNum=${paging.startPage-1 }&mid=${member.mid }">이전</a>
						</c:if>
						<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
							<c:if test="${paging.currentPage==i }">
								<span>${i }</span>
							</c:if>
							<c:if test="${paging.currentPage != i }">
								<a href="${conPath }/thRes/thResList.do?method=list&pageNum=${i }&mid=${member.mid }">${i }</a>
							</c:if>
						</c:forEach>
						<c:if test="${paging.endPage<paging.pageCnt }">
							<a href="${conPath }/thRes/thResList.do&pageNum=${paging.endPage+1 }&mid=${member.mid }">다음</a>
						</c:if>
					</div>

				</div>

			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>

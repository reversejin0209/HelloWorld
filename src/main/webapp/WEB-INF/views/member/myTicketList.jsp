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
			var trcode = $(this).children().eq(3).text().trim();
			if (!isNaN(trcode)) {
				$.ajax({
					url : '${conPath}/ticket/myTicketContent.do',
					type : 'get',
					data : 'trcode=' + trcode,
					dataType : 'html',
					success : function(data) {
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
			location.href = '${conPath }/member/mLogin.do';
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
							<h1><a href="${conPath }/member/mMypage.do?mid=${mid}">${member.mname } 님</a></h1> <br>
						</li>
						<li>
							<ul>
								<li><h4>나의 활동관리</h4></li>
								<li><a href="${conPath}/ticket/myTicketList.do">티켓 예매 내역</a></li>
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
								<li><a href="${conPath }/qnaBoard/myQnaBoardList.do">1:1 문의내역</a></li>
								<li><a href="">어트랙션 문의내역</a></li>
								<li><a href="">공지사항</a></li>
								<li><a href="">FAQ</a></li>
								<li><a href="">고객의 소리</a></li>
							</ul>
						</li>
					</ul>
				</div><!-- myContent -->

				<div class="myPage_right_white">
					<h1 class="center">나의 티켓 예매 내역</h1>
					<br>
					총 수량 : ${paging.totCnt }
					<table class="list_table">
						<tr>
							<th>주문일</th>
							<th colspan="2" class="title">주문내역</th>
							<th>주문번호</th>
							<th>결제금액</th>
							<th>상태</th>
						</tr>

						<!-- 주문 내역이 없는 경우 -->
						<c:if test="${ticketList.size() == 0}">
							<tr>
								<td colspan="6">
									<h4>주문 내역이 없습니다.</h4>
								</td>
							</tr>
						</c:if>

						<c:forEach var="ticket" items="${ticketList }">
							<tr>
								<td class="eng">
									<fmt:formatDate value="${ticket.trorderDate }" pattern="yy.MM.dd" /><br>
									<fmt:formatDate value="${ticket.trorderDate }" pattern="hh:mm:ss" />
								</td>
								<td><img alt="주문내역 이미지" src="../img/${ticket.timg }" style="height: 70px; width: 70px; object-fit: cover;"></td>
								<td>${ticket.tname }</td>
								<td class="eng">${ticket.trcode }</td>
								<td class="eng"><fmt:formatNumber pattern="###,###" value="${ticket.trtotPrice }" /></td>
								<td><c:if test="${ticket.trresult eq 0}">
										주문완료
									</c:if> <c:if test="${ticket.trresult eq 1}">
										<b>취소완료</b>
									</c:if></td>
							</tr>
						</c:forEach>
					</table>
					<br>

					<!-- 페이징 -->
					<div id="paging">
						<c:if test="${paging.startPage>paging.blockSize}">
							<a href="${conPath}/ticket/myTicketList.do?pageNum=${paging.startPage-1 }">이전</a>
						</c:if>
						<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
							<c:if test="${paging.currentPage==i }">
								<span>${i }</span>
							</c:if>
							<c:if test="${paging.currentPage != i }">
								<a href="${conPath}/ticket/myTicketList.do?pageNum=${i }">${i }</a>
							</c:if>
						</c:forEach>
						<c:if test="${paging.endPage<paging.pageCnt }">
							<a href="${conPath }/ticket/myTicketList.do&pageNum=${paging.endPage+1 }">다음</a>
						</c:if>
					</div>

				</div>

			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>

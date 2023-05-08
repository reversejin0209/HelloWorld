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
	<link href="${conPath }/css/theater/theaterContent.css" rel="stylesheet">
	    <style>@font-face {
	        font-family: 'LeferiPoint-WhiteObliqueA';
	        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/LeferiPoint-WhiteObliqueA.woff') format('woff');
	        font-weight: normal;
	        font-style: normal;
	    }
	
	    body {
	        font-family: LeferiPoint-WhiteObliqueA;
	    }
	
	    details {
	        border-bottom: 1px solid #efefef;
	        color: #666;
	        font-size: 16px;
	        padding: 15px;
	    }
	
	
	    details[open] summary {
	        font-weight: 800;
	    }
	    
	    details[open] p {
	        font-size: 14px;
	    }
	
	    details > summary {
	        color: #333;
	        font-size: 16px;
	        padding: 10px 0;
	        cursor: pointer;
	    }
	    </style>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script>
		$(document).ready(function() {
			$('.resButton').click(function(){
				var sessionMember = ${sessionScope.member }
				if(sessionMember == null){ // 체크함
					alert('공연 예매 서비스는 로그인 후 이용 가능합니다.');
					location.href="member/mLogin.do";
				}
			});
		});
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
		<div id="wrap_padding">
		<div class="ticketContent_wrap">

			<!-- 좌측: 공연 상세설명 -->
			<div class="ticket_content">
				<table class="ticketContent_table">
					<tr>
						<td colspan="3"><span class="flag_purple">공연 예매권</span> <br>
							<br>
							<h1>${thcon.thname }</h1>
							<p>${thcon.thcontent }</p></td>
					</tr>
					<tr>
						<td colspan="3">
							<img class="theaterimg" src="${conPath }/theaterFileUp/${thcon.thimg1 }" alt="공연 이미지">
						</td>
					</tr>
					<tr>
						<td>
							요금 안내
						</td>
						<td>
							R석
						</td>
						<td>
							${thcon.thprice }
						</td>
					</tr>
					<tr>
						<td colspan="3"><textarea readonly="readonly">${thcon.thcontent }</textarea></td>
					</tr>

					<!-- 공통 규정 안내 -->
					<tr>
						<td colspan="3">
							공연리뷰
							<c:forEach var="thRevList" items="${thRevList }">
								<details>
							    <summary>${thRevList.thrtitle }</summary>
							    <p><fmt:formatDate value="${thRevList.thrrdate }" pattern="yy.MM.dd" /> <span class="lightgray">ㅣ</span> ${thRevList.mid }</p>
							   	<p>${thRevList.thrcontent }</p>
								</details>
							</c:forEach>
							<div id="paging">
								<c:if test="${paging.startPage>paging.blockSize}">
									<a href="${conPath }/theater/theaterContent.do?pageNum=${paging.startPage-1 }&thname=${param.thname }&schDate=${param.schDate }&thcode=${param.thcode }&thseat=${param.thseat }&thprice=${param.thprice }">이전</a>
								</c:if>
								<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
									<c:if test="${paging.currentPage==i }">
										<span>${i }</span>
									</c:if>
									<c:if test="${paging.currentPage != i }">
										<a href="${conPath }/theater/theaterContent.do?method=list&pageNum=${i }&thname=${param.thname }&schDate=${param.schDate }&thcode=${param.thcode }&thseat=${param.thseat }&thprice=${param.thprice }">${i }</a>
									</c:if>
								</c:forEach>
								<c:if test="${paging.endPage<paging.pageCnt }">
									<a href="${conPath }/theater/theaterContent.do?pageNum=${paging.endPage+1 }&thname=${param.thname }&schDate=${param.schDate }&thcode=${param.thcode }&thseat=${param.thseat }&thprice=${param.thprice }">다음</a>
								</c:if>
							</div>
						</td>
					</tr>
				</table>
			</div>

			<!-- 우측: 주문 박스 -->
			<div class="order_box">
				<div class="order_box_top">
					<h4>예매 날짜</h4>
						<div class="flex_box">
							<span>${param.schDate }</span>
						</div>
					<hr>
					<h4>회차</h4>
						<div class="flex_box">
							<span class="thPartButton">1부 13:00</span>
							<span class="thPartButton">2부 17:00</span>
						</div>
					<hr>
					<h4>남은 좌석</h4>
					<div class="flex_box">
						<span>R석</span> <span style="font-size: 30px;">${param.thseat - seatChk }</span>
					</div>
				</div>
				<!-- div class="order_box" -->
				<div class="order_box_bottom">
					<c:if test="${not empty member && empty admin }">
						<div class="resButton" onclick="location.href='${conPath }/thRes/thReserve.do?thrdatetemp=${param.schDate }&thcode=${param.thcode }&thprice=${param.thprice }&mid=${member.mid }'">
							예약하기
						</div>
					</c:if>
					<c:if test="${empty member && empty admin }">
						<div class="resButton" onclick="location.href='${conPath }/member/mLogin.do'">
							로그인 후 이용할 수 있습니다
						</div>
					</c:if>
					<c:if test="${empty member && not empty admin }">
						<div class="resButton" onclick="location.href='${conPath }/thRes/theaterDelete.do?thcode=${param.thcode }'">
							공연 삭제하기
						</div>
					</c:if>
				</div>
			</div>

		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<link href="${conPath }/css/ticket/ticket.css" rel="stylesheet">
<style type="text/css">
#head_background {
	background-image: url('${conPath}/img/head_background_04.png');
}
</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	/* 상품 이름으로 상세페이지 이동 */
	$(document).ready(function(){
		$('.itemBox').click(function(){
			var tname = $(this).children().eq(1).children().eq(1).text().trim();
			location.href = '${conPath}/ticket/ticketContent.do?tname='
				+ tname;
		
		});
	});
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />

	<!-- 상단 배경 이미지 -->
	<div id="head_background">
		<div class="head_background_inner">
			<h1>스마트 예약</h1>
			<p>우리의 추억이 더욱 특별해지는 꿈과 환상의 나라 헬로월드로 오세요!</p>
		</div>
	</div>
	
	<div id="wrap">
		<div class="margin"></div>
		<div class="title center">
			<p>스마트 예약하고 빠르게 입장하세요</p>
			<h1>헬로월드 스마트 예약</h1>
		</div>
		<br>
		<!-- 티켓 리스트 -->
		<div class="item_list">
			<!-- <div class="itemBox itemBox_rec">
				<p>헬로월드 이용권</p>
				<h1>헬로월드 종일권</h1>
				<h2>특가 할인</h2>
				<p>
					홈페이지에서 제휴카드로 예약 시 기본 제휴 할인에 추가 우대!
					<br>
					(제휴카드 실적 충족 필요/놀이공원 이용 횟수 차감)
				</p>
			</div> -->
			
			<c:forEach var="ticket" items="${ticketList }">
				<div class="itemBox">
					<img alt="티켓 이미지" src="${conPath }/img/${ticket.timg }">
					<div class="itemBox_inner">
						<p>헬로월드 이용권</p>
							<h1>${ticket.tname}</h1>
						<p>
							${ticket.tsub }
						</p>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>

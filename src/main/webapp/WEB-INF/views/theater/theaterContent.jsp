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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
		<div id="wrap">
		<div class="ticketContent_wrap">

			<!-- 좌측: 티켓 상세설명 -->
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
							<textarea readonly="readonly">
[기본정보]
※ 방문일지정 예약상품으로 지정한 날짜에 이용 가능합니다.

※ 기침 등 증세가 있거나, 2주내 확진자와 접촉한 경우가 있는 고객은 마스크를 꼭 착용해 주시고,
자율적인 방역 수칙 실천을 부탁드립니다.
입장 전 에버랜드 APP에 이용권 등록 바랍니다. APP 미등록 시 일부 시설의 예약/탑승이 제한될 수 있습니다.

[취소 및 환불 규정]
* 유효기간 내 미사용티켓 100% 환불가능
* 유효기간 종료 후 미사용티켓 100% 환불
* 사용한 티켓은 환불 불가능합니다.</textarea>
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
						<span>R석</span> <span style="font-size: 30px;">${param.thseat }</span>
					</div>
				</div>
				<!-- div class="order_box" -->
				<div class="order_box_bottom">
					<div class="resButton" onclick="location.href='${conPath }/thRes/thReserve.do?thrdate=${param.schDate }&thcode=${param.thcode }'">
						예약하기
					</div>
				</div>
			</div>

		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>

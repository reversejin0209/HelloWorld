<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<link href="${conPath }/css/ticket/ticket.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	$(document).ready(
		function() {
			$('.qtyplus').click(
				function() {
					fieldName = $(this).attr('field');
					/* alert(fieldName); */
					var currentVal = parseInt($(
							'input[name=' + fieldName + ']').val());
					if (!isNaN(currentVal)) {
						$('input[name=' + fieldName + ']').val(
								currentVal + 1);
					} else {
						$('input[name=' + fieldName + ']').val(0);
					}
					
				});

			$(".qtyminus").click(
				function() {
					fieldName = $(this).attr('field');
					/* alert(fieldName); */
					var currentVal = parseInt($(
							'input[name=' + fieldName + ']').val());
					if (!isNaN(currentVal) && currentVal > 0) {
						$('input[name=' + fieldName + ']').val(
								currentVal - 1);
					} else {
						$('input[name=' + fieldName + ']').val(0);
					}
				});
		});
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<div class="ticketContent_wrap">

			<!-- 좌측: 티켓 상세설명 -->
			<div class="ticket_content">
				<%-- <img alt="티켓 이미지" src="${conPath }/img/${ticket.timg }"> --%>
				<table class="ticketContent_table">
					<tr>
						<td colspan="3"><span class="flag_purple">헬로월드 이용권</span> <br>
							<br>
							<h1>${ticket.tname }</h1>
							<p>${ticket.tsub }</p></td>
					</tr>
					<tr>
						<td>요금 안내</td>
						<td><c:forEach var="ticket" items="${ticketType }">
								${ticket.tname} ${ticket.ttype }<br>
							</c:forEach></td>
						<td><c:forEach var="ticket" items="${ticketType }">
								<b>${ticket.tprice }</b>
								<br>
							</c:forEach></td>
					</tr>
					<tr>
						<td colspan="3"><textarea readonly="readonly">${ticket.tcontent }</textarea></td>
					</tr>

					<!-- 공통 규정 안내 -->
					<tr>
						<td colspan="3"><textarea readonly="readonly">
[기본정보]
※ 방문일지정 예약상품으로 지정한 날짜에 이용 가능합니다.

※ 기침 등 증세가 있거나, 2주내 확진자와 접촉한 경우가 있는 고객은 마스크를 꼭 착용해 주시고,
자율적인 방역 수칙 실천을 부탁드립니다.
입장 전 에버랜드 APP에 이용권 등록 바랍니다. APP 미등록 시 일부 시설의 예약/탑승이 제한될 수 있습니다.

※ 일부 놀이기구 스마트줄서기 안내
(사전예약필수/ 매진되어 조기 마감될 수 있는점 참고 바랍니다.)

[유의사항]
> 방문일지정 예약상품으로 지정한 날짜에 이용 가능합니다.
> 대/소 공통 이용 가능하며 36개월부터 요금 적용됩니다.
> 당일 에버랜드 입장 및 가동중인 시설 이용 가능합니다.
(단, 코인물/대여물/스페셜투어/기획전 등 별도 요금)
> 일부 어트랙션/동물원/식당 이용시간은 에버랜드 마감시간과 다르게 조기 종료될수 있으니 사전에 에버랜드 모바일 앱에서 운영시간 확인 바랍니다.
> 정문주차장은 유료, 외곽주차장은 무료로 운영됩니다.
> QR코드의 사진을 판매사이트에 그대로 올리는 경우 제3자의 무단 도용에 따른 피해가 발생할 수 있습니다.

[취소 및 환불 규정]
* 유효기간 내 미사용티켓 100% 환불가능
* 유효기간 종료 후 미사용티켓 100% 환불
* 사용한 티켓은 환불 불가능합니다.</textarea></td>
					</tr>
				</table>
			</div>

			<!-- 우측: 주문 박스 -->
			<div class="order_box">
				<div class="order_box_top">
					<h4>예약옵션을 선택해 주세요.</h4>

					<hr>
					<h4>상품선택</h4>
					<c:forEach var="ticket" items="${ticketType }">
						<div class="flex_box">
							<span>${ticket.tname} ${ticket.ttype } X ${ticket.tprice }(${ticket.tcode })</span>
							<div class="count_control">
								<input type="button" value="-" class="btn_plus_minus qtyminus" field="${ticket.tcode }" /><input 
									   type="text" class="count_control" name="${ticket.tcode }" value="0"><input 
									   type="button" value="+" class="btn_plus_minus qtyplus" field="${ticket.tcode }" />
							</div>
						</div>
					</c:forEach>
					<hr>
					<h4>합계</h4>
					<div class="flex_box">
						<span>총 0매</span> <span style="font-size: 30px;">0 원</span>
					</div>
				</div>
				<!-- div class="order_box" -->
				<div class="order_box_bottom"></div>
			</div>

		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>

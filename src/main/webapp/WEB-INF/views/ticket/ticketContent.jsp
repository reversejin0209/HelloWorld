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
<link href="${conPath }/css/ticket/ticket.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	$(document).ready(function() {

		// 총 금액, 총 수량
		$('input[type="number"]').change(function() {
			num = $(this).attr('class');
			tprice = $('.tprice_' + num).val();

			var sum = 0;
			var totcnt = 0;

			$('input[type="number"]').each(function(idx, data) {
				sum += ($(this).val() * 1 * tprice);
				totcnt += ($(this).val() * 1);
			});

			$('input[name="trtotPrice"]').val(sum);
			$('.totcnt').html(comma(totcnt));
			$('.totprice').html(comma(sum));
		});

		// 수량 미선택 시 반환
		$('form').submit(function() {
			var trtotPrice = $('input[name="trtotPrice"]').val();
			
			if(${empty member}){
				alert('티켓 구매는 로그인 후 이용 가능합니다.');
				location.href='${conPath}/member/mLogin.do?after=../ticket/ticketContent.do?tname=${ticket.tname}';
				return false;
			}
			
			if (trtotPrice == 0) {
				alert('수량을 선택해 주세요.');
				$('.type1').focus();
				return false;
			}
		});
		
		// 세자리 수마다 콤마 
		function comma(x) {
			x = x + '';
			var tempStr = '';
			var len = x.length;
			for (var i = 0; i < len; i++) {
				tempStr += x[i];
				if (((len - i - 1) % 3 == 0) && (i != (len - 1))) {
					tempStr += ",";
				}
			}
			return tempStr;
		}
	});
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap_padding">
		<div class="ticketContent_wrap">

			<!-- 좌측: 티켓 상세설명 -->
			<div class="ticket_content">
				<img alt="티켓 이미지" src="${conPath }/img/${ticket.timg }">
				<table class="ticketContent_table">
					<tr>
						<td colspan="3"><span class="flag_purple">헬로월드 이용권</span> <br> <br>
							<h1>${ticket.tname }</h1>
							<p>${ticket.tsub }</p></td>
					</tr>
					<tr>
						<td>요금 안내</td>
						<td><c:forEach var="t" items="${ticketList }">
								${t.tname} ${t.ttype }<br>
							</c:forEach></td>
						<td><c:forEach var="ticket" items="${ticketList }">
								<fmt:formatNumber pattern="###,###" value="${ticket.tprice }" />원
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
				<form action="${conPath }/ticketRes/tOrderReserve.do">
					<input type="hidden" name="trdname" value="${ticket.tname }">
					<div class="order_box_top">
						<table class="ticketContent_table">
							<tr>
								<td>
									<h2>예약옵션을 선택해 주세요.</h2>
								</td>
							</tr>
							<tr>
								<td>
									<h2>날짜선택</h2> <input type="date" name="trddate" required="required">
								</td>
							</tr>
							<tr>
								<td>
									<h2>상품선택</h2> <!-- 티켓 종류 출력 --> <c:set var="i" value="1" /> <c:forEach var="ticket" items="${ticketList }">
										<div class="flex_wide">
											<span>${ticket.tname} ${ticket.ttype } X ${ticket.tprice }</span>

											<input type="hidden" name="trdtype" value="${ticket.ttype }">
											<input type="hidden" class="tprice_type${i }" value="${ticket.tprice }" readonly="readonly">
											<input type="number" class="type${i }" name="trdcnt" min="0" value="0">
										</div>
										<c:set var="i" value="${i +1}" />
									</c:forEach>
								</td>
							</tr>
							<tr class="center">
								<td><c:if test="${empty member }">
								로그인 시 할인율을 확인할 수 있습니다.
							</c:if> <c:if test="${not empty member }">
								${member.mname }(${member.mid })님 <b>${member.grade }</b> 등급
							</c:if></td>
							</tr>
							<tr>
								<td>
									<h2>결제 예정 금액</h2>
									<div class="flex_wide">
										&nbsp;
										<input type="hidden" name="trtotPrice" value="0">
										<span><span class="totprice big">0</span>원</span>
									</div>
								</td>
							</tr>
						</table>
					</div>
					<!-- div class="order_box" -->
					<button class="order_box_bottom center">
						총 <span class="totcnt eng font-32">0</span> 매 예약하기
					</button>
				</form>
			</div>

		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>

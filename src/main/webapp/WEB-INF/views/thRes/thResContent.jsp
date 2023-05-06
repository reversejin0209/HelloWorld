<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div id="myTicketContent">
		<h1 class="center">나의 티켓 예매 내역</h1>
		<table class="content_table">
			<tr>
				<td>주문번호: ${order.trcode }</td>
				<td>${order.trorderDate }</td>
				<td>${order.trorderDate }</td>
				<td>${order.trorderDate }</td>
			</tr>
			<tr>
				<th>상품명</th>
				<th>수량</th>
				<th>사용 예정일</th>
				<th>사용 현황</th>
			</tr>
			<c:forEach var="ticket" items="${ticketList }">
			<tr>
					<td>${ticket.trdname }/ ${ticket.trdtype }</td>
					<td>${ticket.trdcnt } 매</td>
					<td class="eng">${ticket.trddate }</td>
					<td><c:if test="${ticket.trdresult eq 0}">
							<b>사용 전</b>
						</c:if> <c:if test="${ticket.trdresult eq 1}">
							<b>사용 후</b>
						</c:if></td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<table class="content_table">
			<tr>
				<td>
					주문 취소
				</td>
				<td>
					<button class="btn_submit"
						onclick="location.href='${conPath}/member/tOrderCancel.do?trcode=${order.trcode}'">주문취소</button>
				</td>
			</tr>
		</table>

	</div>
</body>
</html>

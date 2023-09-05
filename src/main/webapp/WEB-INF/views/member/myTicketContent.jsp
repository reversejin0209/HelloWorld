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
		<h1 class="center">티켓 예매 내역</h1>

		<h2>주문 상세 내역</h2>
		<table class="content_table">
			<tr>
				<th>주문번호</th>
				<th>주문일자</th>
				<c:if test="${order.trresult eq 0}">
					<th colspan="2">주문현황</th>
				</c:if>
				<c:if test="${order.trresult eq 1}">
					<th>주문현황</th>
				</c:if>
			</tr>
			<tr>
				<td>${order.trcode }</td>
				<td><fmt:formatDate value="${order.trorderDate }" pattern="yy.MM.dd hh:mm:ss" /></td>
				<c:if test="${not empty member and order.trresult eq 0}">
					<td>주문완료</td>
					<td>
						<button class="btn_submit" onclick="location.href='${conPath}/ticket/tOrderCancel.do?trcode=${order.trcode}'">주문취소</button>
					</td>
				</c:if>
				<c:if test="${empty member and order.trresult eq 0}">
					<td>주문완료</td>
				</c:if>
				<c:if test="${order.trresult eq 1}">
					<td><b>취소완료</b></td>
				</c:if>
			</tr>
		</table>
		<br>

		<div class="flex_wide">
			<h2>주문 상품 정보</h2>
			<span>총 ${ticketList.size() } 매</span>
		</div>
		<table class="content_table">
			<tr>
				<th colspan="2">상품정보</th>
				<th>수량</th>
				<th>사용 예정일</th>
				<th>사용 현황</th>
			</tr>

			<c:forEach var="ticket" items="${ticketList }">
				<tr>
					<td><img alt="주문내역 이미지" src="../img/${ticket.timg }" style="height: 80px; width: 80px; object-fit: cover;"></td>
					<td>${ticket.trdname }/${ticket.trdtype }</td>
					<td>${ticket.trdcnt }매</td>
					<td>
						<fmt:formatDate value="${ticket.trddate }" pattern="yy년 MM월 dd일"/>
					</td>
					<td><c:if test="${ticket.trdresult eq 0}">
							<b>사용 전</b>
						</c:if> <c:if test="${ticket.trdresult eq 1}">
							<b>사용 후</b>
						</c:if></td>
				</tr>
			</c:forEach>
		</table>
		<br>

		<h2>구매자 정보</h2>
		<table class="content_table">
			<tr>
				<th>구매자 아이디</th>
				<th>구매자 이름</th>
				<th>전화번호</th>
				<th>이메일주소</th>
			</tr>
			<tr>
				<td>${order.mid}</td>
				<td>${order.mname}</td>
				<td>${order.mtel}</td>
				<td>${order.mmail}</td>
			</tr>
		</table>

	</div>
</body>
</html>

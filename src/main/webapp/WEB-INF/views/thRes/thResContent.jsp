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
		<h1 class="center">나의 공연 예매 내역</h1>
		<table class="content_table">
			<tr>
				<td style="text-align: left;" colspan="5">주문번호: ${thResContent.thrcode }</td>
			</tr>
			<tr>
				<th>공연 이름</th>
				<th>공연 장소</th>
				<th>공연 시간</th>
				<th>총가격</th>
				<th>좌석</th>
			</tr>
			<tr>
				<td>${thResContent.thname }</td>
				<td>${thResContent.thloc }</td>
				<td class="eng"><fmt:formatDate value="${thResContent.thrdate }" pattern="yy.MM.dd" /> 13:00</td>
				<td class="eng"><fmt:formatNumber pattern="###,###" value="${thResContent.thrtotprice }" /></td>
				<td>
					<c:forEach var="thResConSeat" items="${thResContentSeat }">
						${thResConSeat.seatcode }
					</c:forEach>
				</td>
				</tr>
		</table>
		<br>
		<table class="content_table">
			<tr>
				<td style="border-bottom: none;">
					<c:if test="${thResContent.thrreview == 0 }">
						<button class="btn_submit"
							onclick="location.href='${conPath}/thRev/thRevWrite.do?mid=${member.mid }&thrcode=${thResContent.thrcode }'">리뷰쓰기</button>
					</c:if>
					<button class="btn_submit"
						onclick="location.href='${conPath}/thRes/thResCancel.do?thrcode=${thResContent.thrcode }'">예매취소</button>
					<button class="btn_submit"
						onclick="location.href='${conPath}/thRes/thResList.do?mid=${member.mid }'">뒤로가기</button>
				</td>
			</tr>
		</table>

	</div>
</body>
</html>

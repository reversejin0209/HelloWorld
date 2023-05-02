<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<link href="${conPath }/css/thRes/thResReserve.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
		$(document).ready(function() {
			
		});
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	${param.thrdate }
	${param.thcode }
	<form action="${conPath }/thRes/thReserve.do">
		<div id="wrap">
			<div class="stage_Box">
				<b>S T A G E<b>
			</div>
			<div class="seat_Box">
			   <span class="small_font">A</span>
			   <c:forEach var="i" begin="1" end="10">
			      <input type="checkbox" class="seat_Num" name="seatcode" value="a${i }">
			   </c:forEach>
			   <br>
			   <span class="small_font">B</span>
			   <c:forEach var="i" begin="1" end="10">
			      <input type="checkbox" class="seat_Num" name="seatcode" value="b${i }">
			   </c:forEach>
			   <br>
			   <span class="small_font">C</span>
			   <c:forEach var="i" begin="1" end="10">
			      <input type="checkbox" class="seat_Num" name="seatcode" value="c${i }">
			   </c:forEach>
			   <br>
			   <span class="small_font">D</span>
			   <c:forEach var="i" begin="1" end="10">
			      <input type="checkbox" class="seat_Num" name="seatcode" value="d${i }">
			   </c:forEach>
			   <br>
			</div>
			<div class="select_Seat">
				선택한 좌석 <span id="select_Result">A1, A2, A3</span> 선택한 총 좌석 <span id="select_TotCnt">2</span>
			</div>
			<hr>
			<div class="submit_Button">
				<input type="submit" value="예매하기">
			</div>
		</div>
	</form>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
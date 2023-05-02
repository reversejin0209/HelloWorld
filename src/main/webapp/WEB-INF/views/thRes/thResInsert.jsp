<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		$("input:checkbox[name='seatcode']").checked(function(){
 			var seatcode = $(this).val();
			$.ajax({
				url : '${conPath }/thRes/SeatCodeConfirm.do',
				type : 'get',
				data : 'seatcode='+seatcode,
				dataType : 'html',
				success : function(data){
					$('#select_Result').html(data);
				}
			}); // ajax함수
  	}); 
	});
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		${param.thrdate } ${param.thcode }  ${param.thcnt } ${param.seatcode }
		<div class="thResInsert">
			<div class="thResInsert_inner">

				<form action="${conPath }/thRes/thReserve.do" method="GET">
					<input type="text" name="thrdate" value="${param.thrdate }">
					<input type="text" name="thcode" value="${param.thcode }">
					<input type="text" name="thcnt" value="2">
					<input type="text" name="thrtotprice" value="24000">
					<div class="stage_Box">
						<b>S T A G E<b>
					</div>

					<div class="seat_Box">
						<span class="small_font">A</span>
						<c:forEach var="i" begin="1" end="10">
							<input type="checkbox" class="seat_Num" name="seatcode" value="a${i }">
						</c:forEach>
						<br> <span class="small_font">B</span>
						<c:forEach var="i" begin="1" end="10">
							<input type="checkbox" class="seat_Num" name="seatcode" value="b${i }">
						</c:forEach>
						<br> <span class="small_font">C</span>
						<c:forEach var="i" begin="1" end="10">
							<input type="checkbox" class="seat_Num" name="seatcode" value="c${i }">
						</c:forEach>
						<br> <span class="small_font">D</span>
						<c:forEach var="i" begin="1" end="10">
							<input type="checkbox" class="seat_Num" name="seatcode" value="d${i }">
						</c:forEach>
						<br>
					</div>
					<hr>
					
					<div class="select_Seat">
						<span class="small_font">선택한 좌석</span> <span id="select_Result">a1 a2 a3</span> <br>
						<span class="small_font">선택한 총 좌석</span> <span id="select_TotCnt">2</span>
						<br>
						<input class="btn_submit" type="submit" value="예매하기">
					</div>

				</form>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
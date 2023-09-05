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
	<style>
		input[type="checkbox"] {display: none;}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
		$(document).ready(function() {
			$('input[type="checkbox"]').click(function(){
				var seatId = $(this).attr('id');
				var checked = $(this).is(':checked');
				if(checked){ // 체크함
					$('.img'+seatId).attr('src','${conPath }/img/seat_chk.png');
				}else { // 언체크함
					$('.img'+seatId).attr('src','${conPath }/img/seat_line.png');
				}
			});
		});
	</script>
</head>
<body>
	<c:if test="${reserveChk >= 1 }">
		<script>
			alert('같은 공연은 한 아이디당 한번만 예매 가능합니다. \n단체 예약은 고객센터로 문의주세요');
			history.back();
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp" />
	<div class="background-color">
	<div id="wrap">
			<div class="thResInsert_inner">

				<form action="${conPath }/thRes/thReserve.do" method="POST">
					<%-- <input type="text" name="thrdate" value="${param.thrdate }"> --%>
					<input type="hidden" name="thcode" value="${param.thcode }">
					<input type="hidden" name="thrcnt" value="2">
					<input type="hidden" name="mid" value="${member.mid }">
					<input type="hidden" name="thrdateStr" value="${param.thrdatetemp }">
					<input type="hidden" name="thprice" value="${param.thprice }">
					<div class="stage_Box">
						<b>S T A G E<b>
					</div>
					<div class="seat_Box">
					
						<b class="small_font">A</b>
						<c:forEach var="i" begin="0" end="9">
							<!-- A석 -->
							<c:if test="${i < 10 }">
								<c:set var="seatCode" value="A${i+1 }"/>
								<c:if test="${seats.get(i) == '' }">
									<label for="A${i+1 }">
									<span>${seatId}</span>
									<img src="${conPath }/img/seat_line.png" class="imgA${i+1 }">
									</label>
									<input type="checkbox" name="seatCode" value="A${i+1}" id="A${i+1 }">
								</c:if>
								
								<c:if test="${seats.get(i) != '' }">
									<label for="A${i+1 }">
									<span>${seatId}</span>
									<img src="${conPath }/img/seat_chkConfirm.png" class="imgA${i+1 }">
									</label>
									<input type="checkbox" name="seatCode" value="A${i+1}" id="A${i+1 }" disabled="disabled">
								</c:if>
							</c:if>
						</c:forEach>
						
						<br>
						<b class="small_font">B</b>
						<c:forEach var="i" begin="10" end="19">	
							<!-- B석 -->
							<c:if test="${i < 20 }">
								<c:set var="seatCode" value="B${i-10+1 }"/>
								<c:if test="${seats.get(i) == '' }">
									<label for="B${i-10+1 }">
									<span>${seatId}</span>
									<img src="${conPath }/img/seat_line.png" class="imgB${i-10+1 }">
									</label>
									<input type="checkbox" name="seatCode" value="B${i-10+1 }" id="B${i-10+1 }">
								</c:if>
								
								<c:if test="${seats.get(i) != '' }">
									<label for="B${i-10+1 }">
									<span>${seatId}</span>
									<img src="${conPath }/img/seat_chkConfirm.png" class="imgB${i-10+1 }">
									</label>
									<input type="checkbox" name="seatCode" value="B${i-10+1 }" id="B${i-10+1 }" disabled="disabled">
								</c:if>
							</c:if>
						</c:forEach>
						
						<br>
						<b class="small_font">C</b>
						<c:forEach var="i" begin="20" end="29">	
							<!-- C석 -->
							<c:if test="${i < 30 }">
								<c:if test="${seats.get(i) == '' }">
									<label for="C${i-20+1 }">
									<span>${seatId}</span>
									<img src="${conPath }/img/seat_line.png" class="imgC${i-20+1 }">
									</label>
									<input type="checkbox" name="seatCode" value="C${i-20+1 }" id="C${i-20+1 }">
								</c:if>
								
								<c:if test="${seats.get(i) != '' }">
									<label for="C${i-20+1 }">
									<span>${seatId}</span>
									<img src="${conPath }/img/seat_chkConfirm.png" class="imgC${i-20+1 }">
									</label>
									<input type="checkbox" name="seatCode" value="C${i-20+1 }" id="C${i-20+1 }" disabled="disabled">
								</c:if>
							</c:if>
						</c:forEach>
						
						<br>
						<b class="small_font">D</b>
						<c:forEach var="i" begin="30" end="39">	
							<!-- D석 -->
							<c:if test="${i < 40 }">
								<c:if test="${seats.get(i) == '' }">
									<label for="D${i-30+1 }">
									<span>${seatId}</span>
									<img src="${conPath }/img/seat_line.png" class="imgD${i-30+1 }">
									</label>
									<input type="checkbox" name="seatCode" value="D${i-30+1 }" id="D${i-30+1 }">
								</c:if>
								
								<c:if test="${seats.get(i) != '' }">
									<label for="D${i-30+1 }">
									<span>${seatId}</span>
									<img src="${conPath }/img/seat_chkConfirm.png" class="imgD${i-30+1 }">
									</label>
									<input type="checkbox" name="seatCode" value="D${i-30+1 }" id="D${i-30+1 }" disabled="disabled">
								</c:if>
							</c:if>
						</c:forEach>
							
					</div>
					
					<div class="select_Seat">
						<input class="btn_submit" type="submit" value="예매하기">
					</div>

				</form>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
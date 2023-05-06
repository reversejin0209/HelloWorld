<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/theater/theater.css" rel="stylesheet">
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<style type="text/css">
		#head_background {
			background-image: url('${conPath}/img/head_background_03.png');
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script>
		// datepicker
		$( function() {
			// 데이터 피커
		  $( "#datepicker" ).datepicker({
		 	 dateFormat: "yy-mm-dd",
		 	 dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
		   	 monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		 	 changeMonth: true,  // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
		 	 changeYear: true,   // 년을 바꿀수 있는 셀렉트 박스를 표시한다.
		     showMonthAfterYear: true,
		     yearSuffix: '년',
		     showOtherMonths: true, // 현재 달이아닌 다른 달 날짜를 회색으로 표시한다.
		     minDate: 0,
		     dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		  });
		  // 
		  $('#schButton').click(function() {
				var datepicker = document.getElementById('datepicker');
				if (datepicker=="") {
					alert('검색하실 날짜를 선택해주세요');
					history.back();
				}
			});
		} );
	</script>
</head>
<body>
	<c:set var="nowDate" value="<%=new Date(System.currentTimeMillis()) %>"/>
	<fmt:formatDate value="${nowDate }" pattern="yyyy-MM-dd" var="today" />
	<jsp:include page="../main/header.jsp" />
	
	<!-- 상단 배경 이미지 -->
	<div id="head_background">
		<div class="head_background_inner">
			<h1>공연</h1>
			<p>우리의 추억이 더욱 특별해지는 꿈과 환상의 나라 헬로월드로 오세요!</p>
		</div>
	</div>
	
	<div id="wrap_padding">
		<div class="search_box">
			<form action="${conPath }/theater/theaterList.do" method="get" class="right">
				<div class="search">
					<input type="hidden" name="thschedule" value="2">
					<c:if test="${param.schDate != '' }">
						<input type="text" name="schDate" id="datepicker" readonly="readonly" value="${param.schDate }">
					</c:if>
					<c:if test="${param.schDate == '' }">
						<input type="text" name="schDate" id="datepicker" readonly="readonly" value="${today }">
					</c:if>
					<button id="schButton">
						<img alt="검색 아이콘" src="${conPath }/img/search_FILL0_wght400_GRAD0_opsz24.svg">
					</button>
				</div>
			</form>
		</div>
		<c:set var="schDate" value="${param.schDate eq '' ? today:param.schDate}"/>
		<table class="list_table"> 
			<tr>
				<th colspan="4">공연정보</th>
				<th colspan="2">공연시간</th>
			</tr>
			<c:if test="${theaterList.size() == 0 }">
				<tr>
					<td colspan="6">
						<h4>금일은 휴연입니다.</h4>
					</td>
				</tr>
			</c:if>
			<c:if test="${theaterList.size() != 0 }">
				<c:forEach var="theater" items="${theaterList }">
					<tr>
						<td>
							<img class="theaterimg" src="${conPath }/theaterFileUp/${theater.thimg1 }" alt="공연 이미지">
						</td>
						<td class="left" colspan="3">
							<ul>
								<li class="thTitle">
									<a href="${conPath}/theater/theaterContent.do?thname=${theater.thname }
									&schDate=${param.schDate eq '' ? today:param.schDate }&thcode=${theater.thcode }&thseat=${theater.thseat }&thprice=${theater.thprice }" 
									class="black">${theater.thname }</a>
								</li>
								<li>
									${theater.thcontent }
								</li>
								<li>
									<span class="greenbox">소요시간</span> &nbsp;${theater.thtime } &nbsp; &nbsp; &nbsp; <span class="greenbox">공연장소</span> &nbsp;${theater.thloc }
								</li>
							</ul>
						</td>
						<td colspan="2">
							13:00 [1회차] <br>
							17:00 [2회차] <br>
							<button onclick="location.href='${conPath}/theater/theaterContent.do?thname=${theater.thname }&schDate=${param.schDate eq '' ? today:param.schDate }&thcode=${theater.thcode }&thseat=${theater.thseat }&thprice=${theater.thprice }'">
								공연 상세보기
							</button>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
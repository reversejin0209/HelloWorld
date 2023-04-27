<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/theater/theaterList.css" rel="stylesheet">
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script>
		// datepicker
		$( function() {
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
		} );
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<h1 class="center">공연 목록</h1>
		
		<div class="search_box">
			<form action="${conPath }/theater/theaterList.do" method="get"
				class="right">
				<div class="search">
					<input type="hidden" name="thschedule" value="2">
					<input type="text" name="schWord" id="datepicker" placeholder="예매 날짜" required="required"
							readonly="readonly" value="${param.schWord }">
					<button>
						<span class="material-symbols-rounded">search</span>
					</button>
				</div>
			</form>
		</div>
		
		<table class="list_table">
			<tr>
				<th colspan="4">공연정보</th>
				<th colspan="2">공연시간</th>
			</tr>
			<c:if test="${theaterList.size() == 0 }">
				<tr>
					<td colspan="6">
						<h4>등록된 게시글이 없습니다</h4>
					</td>
				</tr>
			</c:if>
			<c:if test="${theaterList.size() != 0 }">
				<c:forEach var="theater" items="${theaterList }">
					<tr>
						<td>
							<img src="${conPath }/theaterFileUp/${theater.thimg1 }" alt="공연 이미지">
						</td>
						<td class="left" colspan="3">
							<ul>
								<li><a href="${conPath}/theater/theaterContent.do?thname=${theater.thname }">${theater.thname }</a></li>
								<li>${theater.thcontent }</li>
								<li>${theater.thtime } / ${theater.thloc }</li>
							</ul>
						</td>
						<td colspan="2">
							12:00 [1회차] <br>
							16:00 [2회차] <br>
							<button onclick="location.href='${conPath}/theater/theaterContent.do?thname=${theater.thname }'">공연 상세보기</button>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet" type="text/css">
	<link href="${conPath }/css/main.css" rel="stylesheet" type="text/css">
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			// ex.json내용을 table안에 출력
			var date = new Date();
			var todayDate = date.getFullYear() + ('0'+(date.getMonth()+1)).slice(-2) + ('0'+date.getDate()).slice(-2);
			// 20230426
			var todayTime = date.getHours() + '00';
			// 1600
			$.ajax({
				url : "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?serviceKey=nWZqKfrh%2BZYh8lZYkihm6Bx7az0QutJg%2B6Tw6qrssK64j%2FX4sWNTlRfyi6%2FyYXRnnwziW4S7%2FVADwA5zjN9C5g%3D%3D&pageNo=1&numOfRows=1000&dataType=JSON&base_date="+todayDate+"&base_time=0500&nx=60&ny=120",
				dataType : 'json',
				success : function(data){ 
					let dataItem = data.response.body.items.item;
					var pty;
					var tmn;
					var tmx;
					var sch;
					$.each(dataItem, function(idx, item){
						if(item.fcstDate==todayDate) {
							if(item.fcstTime==todayTime) {
								if(item.category=='PTY' && item.fcstValue>=1) {
									pty = '<td>' + '비' + '</td>'; 
								} else if(item.category=='SNO' && item.fcstValue>=1) {
									pty = '<td>' + '눈' + '</td>'; 
								} else if(item.category=='SKY' && item.fcstValue<=2) {
									pty = '<td>' + '맑음' + '</td>'; 
								} else if(item.category=='SKY' && item.fcstValue>2) {
									pty = '<td>' + '흐림' + '</td>'; 
								}
							}
							if(item.category=='TMP' && item.fcstTime=='0600') { // or 삭제, 첫번째 out 삭제
								tmn = '<td>' + Math.floor(item.fcstValue) + '°' + '</td>';
							}
							if(item.category=='TMP' && item.fcstTime=='1500') {
								sch = '<td>' + '/' + '</td>';
								tmx = '<td>' + Math.floor(item.fcstValue) + '°' + '</td>';
							}
						}
					}); // each()함수
					var out = '<tr>';
					out += tmn;
					out += sch;
					out += tmx;
					out += pty;
					$('table#weatherShow').html(out);
				},
			});
		});
	</script>
</head>
<body>
	<!-- 로그인 처리 -->
	<c:if test="${member.mwith eq 1}">
		<script>
			alert("탈퇴 처리된 회원입니다.");
			location.href="${conPath}/member/mLogout.do?after=member/login";
		</script>
	</c:if>
	
	<c:if test="${loginResult eq 'ID 혹은 PW 오류'}">
		<script>
			alert('${loginResult}');
			history.back();
		</script>
	</c:if>
	
	<!-- 회원 탈퇴 처리 -->
	<c:if test="${withdrawalResult eq 1}">
		<script>
			alert('회원 탈퇴 성공하였습니다');
		</script>
	</c:if>
	
	<c:if test="${withdrawalResult eq 0}">
		<script>
			alert('회원 탈퇴 실패하였습니다. 다시 확인해주세요');
			history.back();
		</script>
	</c:if>
	
	<jsp:include page="../main/header.jsp" />
	<div id="main">
		<div id="visual">
			<div class="visual_items">
				<div class="main_item">
					<div>
						~ 06.09
						<h1>
							홈페이지 신규가입<br>특별우대
						</h1>
						<p>스마트예약
						<p><br>
						<h2>25,000원 ~</h2>
					</div>
					<div>
						<button class="btn_white" onclick="">예매하러 가기 &#128073;</button>
					</div>
				</div>
				<!-- main_item -->
				<div class="item_box">
					<div class="sub_item item1">
						<h2>날씨</h2>
					</div>
					<div class="sub_item item2">
						<div class="normal_box">
							<h2>별점 기준 가장 인기있는 놀이기구 확인</h2>
						</div>
					</div>
					<div class="sub_item item3">
						<div class="normal_box">
							<h2>렛츠 고! 코딩</h2>
						</div>
					</div>
					<div class="sub_item item4">
						<div class="normal_box">
							<h2>코코의 모험:사이버 어드벤처</h2>
						</div>
					</div>
				</div><!-- main_item -->
				
			</div>
		</div>
		<!-- visual -->

		<div id="main_today">
			<div class="main_today_left">
				<p class="main_today_title">TIME</p>
				<h4>
					<c:set var="now" value="<%=new java.util.Date()%>" />
					<fmt:formatDate value="${now }" dateStyle="full" />
				</h4>
				<h1 class="main_clock">10:00 - 22:00</h1>
			</div>
			<div class="main_today_right">
				<p class="main_today_title">WEATHER</p> 
				<table id="weatherShow"></table>
			</div>
		</div>
		<!-- main_today -->

		<br>
		<hr>
		<div id="main_news">
			<div class="main_news_left">
				공지사항 ${member.mwith }
				<hr>
				<ul>
					<li>01</li>
					<li>02</li>
					<li>03</li>
					<li>04</li>
				</ul>
			</div>
			<div class="main_news_right">
				뉴스
				<hr>
				<ul>
					<li>01</li>
					<li>02</li>
					<li>03</li>
					<li>04</li>
				</ul>
			</div>
		</div>
		<!-- main_news -->

		<div id="notice_box">
			<p>event</p>
			<h1>공연 후기를 작성하고 티켓을 받아가세요!</h1>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
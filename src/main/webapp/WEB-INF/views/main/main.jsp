<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World</title>
<link href="${conPath }/css/style.css" rel="stylesheet" type="text/css">
<link href="${conPath }/css/main.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>

<!-- 메인 item 경로 -->
<script>
	$(document).ready(function() {
		$('.item1').click(function() {
			location.href = '${conPath}/ticket/ticketList.do';
		});
		$('.qBoardListBtn').click(function() {
			location.href = '${conPath}/qnaBoard/qBoardList.do?pageNum=${param.pageNum}&schItem=${param.schItem}&schWord=${param.schDate}';
		});
	});
</script>

<!-- 날씨 출력 -->
<script>
	$(document)
			.ready(
					function() {
						// ex.json내용을 table안에 출력
						var date = new Date();
						var todayDate = date.getFullYear()
								+ ('0' + (date.getMonth() + 1)).slice(-2)
								+ ('0' + date.getDate()).slice(-2);
						// 20230426
						var todayTime = date.getHours() + '00';
						// 1600
						$
								.ajax({
									url : "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?serviceKey=nWZqKfrh%2BZYh8lZYkihm6Bx7az0QutJg%2B6Tw6qrssK64j%2FX4sWNTlRfyi6%2FyYXRnnwziW4S7%2FVADwA5zjN9C5g%3D%3D&pageNo=1&numOfRows=1000&dataType=JSON&base_date="
											+ todayDate
											+ "&base_time=0500&nx=60&ny=120",
									dataType : 'json',
									success : function(data) {
										let dataItem = data.response.body.items.item;
										var pty;
										var tmn;
										var tmx;
										var sch;
										$
												.each(
														dataItem,
														function(idx, item) {
															if (item.fcstDate == todayDate) {
																if (item.fcstTime == todayTime) {
																	if (item.category == 'PTY'
																			&& item.fcstValue >= 1) {
																		pty = '<td>'
																				+ '비'
																				+ '</td>';
																	} else if (item.category == 'SNO'
																			&& item.fcstValue >= 1) {
																		pty = '<td>'
																				+ '눈'
																				+ '</td>';
																	} else if (item.category == 'SKY'
																			&& item.fcstValue <= 2) {
																		pty = '<td>'
																				+ '맑음'
																				+ '</td>';
																	} else if (item.category == 'SKY'
																			&& item.fcstValue > 2) {
																		pty = '<td>'
																				+ '흐림'
																				+ '</td>';
																	} else {
																		pty = '<td>'
																				+ '흐림'
																				+ '</td>';
																	}
																}
																if (item.category == 'TMP'
																		&& item.fcstTime == '0600') { // or 삭제, 첫번째 out 삭제
																	tmn = '<td>'
																			+ Math
																					.floor(item.fcstValue)
																			+ '°'
																			+ '</td>';
																}
																if (item.category == 'TMP'
																		&& item.fcstTime == '1500') {
																	sch = '<td>'
																			+ '/'
																			+ '</td>';
																	tmx = '<td>'
																			+ Math
																					.floor(item.fcstValue)
																			+ '°'
																			+ '</td>';
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
	<c:if test="${not empty successMsg}">
		<script>
			alert('${successMsg}');
		</script>
	</c:if>
	<c:if test="${not empty failMsg}">
		<script>
			alert('${failMsg}');
			history.back();
		</script>
	</c:if>

	<!-- 회원 탈퇴 처리 -->
	<c:if test="${member.mwith eq 1}">
		<script>
			alert("탈퇴 처리된 회원입니다.");
			location.href = "${conPath}/member/mLogout.do?after=member/login";
		</script>
	</c:if>

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

	<!-- 공연 날짜 계산 -->
	<c:set var="nowDate" value="<%=new Date(System.currentTimeMillis()).getDate()%>" />
	<c:set var="nowSchedule" value="${nowDate%2 }" />

	<jsp:include page="../main/header.jsp" />
	<div id="main">
		<div id="visual">
			<div class="visual_items">
				<div class="main_item">
					<p class="eng">EVENT</p>
					<img alt="이벤트 아이콘" src="https://em-content.zobj.net/source/microsoft-teams/337/party-popper_1f389.png" width="240px;">
					<div>
						<h1>
							홈페이지 신규가입
							<br>
							특별우대
						</h1>
						<h2>25,000원 ~</h2>
					</div>
					<div>
						<button class="btn_white" onclick="">예매하러 가기 ></button>
					</div>
				</div>
				<!-- main_item -->
				<div class="item_box">
					<div class="sub_item item1">
						<img alt="티켓 예매 아이콘" src="https://em-content.zobj.net/source/microsoft-teams/337/ticket_1f3ab.png">
						<div class="sub_item_text">
							<p>
								홈페이지에서 예약하면 언제 취소해도
								<br>
								이용하지 못해도 100% 환불!
							</p>
							<h1>티켓 예매</h1>
						</div>
					</div>
					<div class="sub_item item2" onclick="location.href='${conPath }/attraction/listAtc.do'">
						<img alt="회전목마 아이콘" src="https://em-content.zobj.net/source/microsoft-teams/337/carousel-horse_1f3a0.png">
						<div class="sub_item_text">
							<p>
								언제나 새롭고 즐거운 경험을 주는
								<br>
								헬로월드 어트랙션
							</p>
							<h2>HOT 어트랙션</h2>
						</div>
					</div>
					<div class="sub_item item3" onclick="location.href='${conPath }/theater/theaterList.do?thschedule=${nowSchedule }&schDate='">
						<img alt="공연 아이콘" src="https://em-content.zobj.net/source/microsoft-teams/337/admission-tickets_1f39f-fe0f.png">
						<div class="sub_item_text">
							<p>
								다양한 공연 및 퍼레이드 정보를 한눈에!
								<br>
								다양한 공연 정보를 확인해 보세요.
							</p>
							<h2>공연 정보 확인</h2>
						</div>
					</div>
					<div class="sub_item item4">
						<img alt="이 달의 공연 아이콘" src="https://em-content.zobj.net/source/microsoft-teams/337/sparkles_2728.png">
						<div class="sub_item_text">
							<p>
								위험에 빠진 딩딩이를
								<br>
								구하러 가는 코코의 모험!
							</p>
							<h2>코코의 모험: 코딩 어드벤처</h2>
						</div>
					</div>
				</div>
				<!-- main_item -->

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
				<h2 class="flex_wide">
					<span onclick="location.href='${conPath }/notice/noticeList.do'">공지사항</span> <span onclick="location.href='${conPath }/notice/noticeList.do'">+</span>
				</h2>
				<ul class="list_box">
					<c:forEach var="nList" items="${noticeMain }" end="4">
						<li class="flex_wide"><span> <a href="${conPath }/notice/noticeContent.do?nno=${nList.nno }&pageNum=${pageNum}">${nList.ntitle }</a>
						</span> <span> <fmt:formatDate value="${nList.nrdate }" pattern="yyyy.MM.dd" />
						</span></li>
					</c:forEach>
				</ul>
			</div>
			<div class="main_news_right">
				<h2 class="flex_wide">
					<span>최근 리뷰 내역</span> +
				</h2>
				<ul class="list_box">
					<c:forEach var="threvList" items="${threvMainList }" end="4">
						<li class="flex_wide"><span>${threvList.thrtitle }</span> <span>${threvList.thname }</span> <fmt:formatDate value="${threvList.thrrdate }"
								pattern="yy.MM.dd" /></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<!-- main_notice -->
		<div id="notice_box">&nbsp;</div>
		<div class="margin"></div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
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
</head>
<body>
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
						<!-- <div class="hover_box">
							<h2>코코의 모험:사이버 어드벤처</h2>
							<p>사이버 대마왕 자바에게 붙잡힌 딩딩을 구출하기 위해 모험을 떠나는 코코의 모험</p>
							<button class="btn_white">예약하러가기</button>
						</div> -->

					</div>
				</div>
			</div>
		</div>
		<!-- visual -->

		<div id="main_today">
			<div class="main_today_left">
				<p class="main_today_title">TIME</p>
				<h3>
					<c:set var="now" value="<%=new java.util.Date()%>" />
					<fmt:formatDate value="${now }" dateStyle="full" />
				</h3>
				<h1 class="main_clock">10:00 - 22:00</h1>
			</div>
			<div class="main_today_right">
				<p class="main_today_title">WEATHER</p> 날씨
			</div>
		</div>
		<!-- main_today -->

		<br>
		<hr>
		<div id="main_news">
			<div class="main_news_left">
				공지사항
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
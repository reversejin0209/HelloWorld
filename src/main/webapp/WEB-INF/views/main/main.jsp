<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
					<p>스마트예약<p><br>
					<h2>25,000원 ~</h2>
					</div>
					<div>
						<button class="btn_white" onclick="">예매하러 가기 &#128073;</button>
					</div>
				</div>
				<!-- main_item -->
				<div class="item_box">
					<div class="item">날씨</div>
					<div class="item">별점 기준 가장 인기있는 놀이기구 또는 놀이기구 위치 확인</div>
					<div class="item">공연정보 01</div>
					<div class="item">공연정보 02</div>
				</div>
			</div>
		</div>
		<!-- visual -->

		<div id="main_today">
			<div class="main_today_left">
				<p class="main_today_title">TIME</p>
				<h3>
					<c:set var="now" value="<%=new java.util.Date()%>" />
					<fmt:formatDate value="${now }" dateStyle="full"/>
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

		<div id="notice_box"></div>
	</div>
</body>
</html>
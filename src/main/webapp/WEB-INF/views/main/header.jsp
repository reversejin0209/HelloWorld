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
<title>Hello World</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<link href="${conPath }/css/header.css" rel="stylesheet">
</head>
<body>

	<!-- 공연 날짜 계산 -->
	<c:set var="nowDate" value="<%=new Date(System.currentTimeMillis()).getDate() %>"/>
	<c:set var="nowSchedule" value="${nowDate%2 }"/>
	
	<div class="util">
		<div class="utill_inner">
			<div class="utill_inner_left">KOR▾</div>
			<div class="login">
				<c:if test="${empty sessionScope.member and empty sessionScope.admin }">
					<ul>
						<li><a href="${conPath }/member/mLogin.do">로그인</a></li>
						<li><a href="${conPath }/member/mJoin.do">회원가입</a></li>
					</ul>
				</c:if>
				<c:if test="${not empty sessionScope.member }">
					<ul>
						<li><a href="${conPath }/member/mMypage.do">${member.mname }님 ▾</a><li>
						<li><a href="${conPath }/member/mLogout.do?after=main.do">로그아웃</a></li>
					</ul>
				</c:if>
				<c:if test="${not empty sessionScope.admin }">
					<ul>
						<li><a href="${conPath }/admin/aMypage.do">관리자(${sessionScope.admin.adname })님 ▾</a><li>
						<li><a href="${conPath }/admin/adLogout.do?after=main/main">로그아웃</a></li>
					</ul>
				</c:if>
			</div>
		</div>
	</div>

	<nav>
		<div class=nav_inner>
			<div class="logo">
				<img alt="헬로월드 로고" src="${conPath }/img/logo.png"
					onclick="location.href='${conPath}/main.do'">
			</div>
			<ul class="menu_item">
				<li><a href="#">이용정보</a></li>
				<li><a href="#">요금/프로모션</a>
					<ul class="drop-menu">
						<li><a href="${conPath }/ticket/ticketList.do">이용요금</a></li>
						<li><a href="${conPath }/ticket/ticketList.do">이달의 혜택</a></li>
						<li><a href="#">연간이용</a></li>
						<li><a href="#">운영/운휴</a></li>
					</ul></li>
				<li><a href="#">즐길거리</a>
					<div class="mega-box">
						<div class="content">
							<div class="row">
								<img alt="시계 아이콘" src="https://em-content.zobj.net/source/microsoft-teams/337/ferris-wheel_1f3a1.png">
								<c:set var="now" value="<%=new java.util.Date()%>" />
								<h4>오늘의 파크 운영시간</h4>
								<h1 class="eng">10:00 - 22:00</h1>
								<fmt:formatDate value="${now }" dateStyle="long" />
							</div>
							<div class="row">
								<header>어트랙션</header>
								<ul class="mega-items">
									<li><a href="${conPath }/attraction/listAtc.do">어트랙션 소개</a></li>
									<li><a href="${conPath }/attraction/listAtc.do">어트랙션 위치 확인</a></li>
									<li><a href="#">어트랙션 QnA</a></li>
									<li><a href="#">추천코스</a></li>
								</ul>
							</div>
							<div class="row">
								<header>공연</header>
								<ul class="mega-items">
									<li><a href="${conPath }/theater/theaterList.do?thschedule=${nowSchedule }&schDate=">공연목록</a></li>
									<li><a href="#">스테이지</a></li>
									<li><a href="#">퍼레이드</a></li>
									<li><a href="#">공연후기</a></li>
								</ul>
							</div>
							<div class="row">
								<header>다이닝/쇼핑</header>
								<ul class="mega-items">
									<li><a href="#">레스토랑</a></li>
									<li><a href="#">기프트샵</a></li>
									<li><a href="#">온라인 굿즈샵</a></li>
								</ul>
							</div>
						</div>
					</div></li>
				<li><a href="#">소통서비스</a>
					<ul class="drop-menu">
						<li><a href="${conPath }/notice/noticeList.do">공지사항</a></li>
						<li><a href="${conPath }/qnaBoard/qBoardList.do">1:1문의</a></li>
						<li><a href="#">고객소리함</a></li>
					</ul></li>
					<li><a href="#">더 알아보기</a></li>
			</ul>
			<div class="promotion">
				<img alt="할인프로모션" src="${conPath }/img/header_nPay.png">
			</div>
		</div>
	</nav>
</body>
</html>
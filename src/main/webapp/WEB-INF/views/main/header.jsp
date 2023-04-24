<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<link href="${conPath }/css/header.css" rel="stylesheet">
</head>
<body>
	<div class="util">
		<div class="utill_inner">
			<div class="utill_inner_left">KOR▾</div>
			<div class="login">
				<a href="${conPath }/ member/mLogin.do">로그인</a> <a href="">회원가입</a>
			</div>
		</div>
	</div>

	<nav>
		<div class=nav_inner>
			<div class="logo">
				<img alt="헬로월드 로고" src="${conPath }/img/logo.png" onclick="location.href='${conPath}/main.do'">
			</div>
			<ul class="menu_item">
				<li><a href="#">이용정보</a></li>
				<li><a href="#">요금/프로모션</a>
					<ul class="drop-menu">
						<li><a href="#">Drop menu 1</a></li>
						<li><a href="#">Drop menu 2</a></li>
						<li><a href="#">Drop menu 3</a></li>
						<li><a href="#">Drop menu 4</a></li>
					</ul></li>
				<li><a href="#">즐길거리</a>
					<div class="mega-box">
						<div class="content">
							<div class="row">
								<img src="" alt="">
							</div>
							<div class="row">
								<header>어트랙션</header>
								<ul class="mega-items">
									<li><a href="#">추천코스</a></li>
									<li><a href="#">어트랙션 검색</a></li>
									<li><a href="#">어트랙션 위치 확인</a></li>
									<li><a href="#">어트랙션 QnA</a></li>
								</ul>
							</div>
							<div class="row">
								<header>공연</header>
								<ul class="mega-items">
									<li><a href="#">전체</a></li>
									<li><a href="#">스테이지</a></li>
									<li><a href="#">퍼레이드</a></li>
									<li><a href="#">기타공연</a></li>
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
						<li><a href="#">공지사항</a></li>
						<li><a href="#">QnA</a></li>
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
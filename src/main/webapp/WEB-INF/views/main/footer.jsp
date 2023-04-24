<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<link href="${conPath }/css/footer.css" rel="stylesheet">
</head>
<body>
	<div class="quickBox">
		<button class="btn_purple" onclick="location.href='${conPath}/qnaBoard/qBoardList.do'">문의하기</button>
	</div>

	<footer>
		<div class="footer_inner">
			<div class="footer_inner_left">
				<!-- footer 상단 메뉴 -->
				<ul class="footer_menu">
					<li>헬로월드 프로젝트 소개</li>
					<li>이용약관</li>
					<li>이메일 주소 무단수집 거부</li>
					<li>CAST 참여</li>
					<li>사이트맵</li>
				</ul>
				<br>
				<br>

				<!-- 주소 -->
				<div class="address">
					<p>경기도 용인시 처인구 포곡읍 헬로월드 118 헬로월드 &nbsp;|&nbsp; 대표이사 임동은 &nbsp;|&nbsp; 사업자등록번호:118-02-02209</p>
					<p>손님상담센터 031-320-0118 &nbsp;|&nbsp; <b>개인정보처리방침</b> &nbsp;|&nbsp; <b>방침 개정 안내</b></p> <br>
					<p>COPYRIGHT 2023 HELLOWORLD. ALL RIGHTS RESERVED.</p>
				</div>
			</div>
			<div class="footer_inner_right">
				<div>
					<p>본 사이트는 개발 프로젝트를 위한 비상업용 사이트입니다.</p>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>
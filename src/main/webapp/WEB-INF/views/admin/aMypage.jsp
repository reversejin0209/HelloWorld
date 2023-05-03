<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<link href="${conPath }/css/member/member.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	$(document).ready(function() {
		
	});
</script>
</head>
<body>
	<c:if test="${not empty successMsg }">
		<script>
			alert('${successMsg }');
		</script>
	</c:if>
	<c:if test="${not empty failMsg }">
		<script>
			alert('${failMsg }');
			history.back();
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<div id="myPage">
			
			<!-- left: myContent -->
			<div class="myContent">
				<ul>
					<li>
						<h1>안녕하세요<br>${admin.adname } 관리자님</h1>
						<br>
					</li>
					<li>
						<ul>
							<li><h4>나의 활동관리</h4></li>
							<li><a href="">예약내역조회</a></li>
							<li><a href="${conPath }/theater/theaterInsert.do">공연 추가</a></li>
							<li><a href="">어트랙션 리뷰</a></li>
						</ul>

						<ul>
							<li><h4>나의 계정설정</h4></li>
							<li><a href="${conPath }/member/mModify.do">회원정보 수정</a></li>
							<li><a href="">회원등급</a></li>
						</ul>

						<ul>
							<li><h4>고객센터</h4></li>
							<li><a href="">1:1 문의내역</a></li>
							<li><a href="">어트랙션 문의내역</a></li>
							<li><a href="">공지사항</a></li>
							<li><a href="">FAQ</a></li>
							<li><a href="">고객의 소리</a></li>
						</ul>
					</li>
				</ul>
			</div>
			
			<!-- right: myInfo -->
			<div class="myPage_right">
				<div class="info_box">
					<div class="info_box_left">
						<p>연간 방문 횟수</p><br>
					</div>
					<div class="info_box_right">
					</div>
				</div>
				<!-- info_box -->
				
				<!-- main_item -->
				<div class="item_box">
					<div class="sub_item item1">
						<h2>티켓 예매확인/취소</h2>
					</div>
					<div class="sub_item item2">
						<div class="normal_box">
							<h2>공연 예매확인/취소</h2>
						</div>
					</div>
					<div class="sub_item item3">
						<div class="normal_box">
							<h2>1:1 문의내역</h2>
						</div>
					</div>
					<div class="sub_item item4">
						<div class="normal_box">
							<h2>나의 후기</h2>
						</div>
					</div>
				</div><!-- main_item -->
			</div>
		
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>

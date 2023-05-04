<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<c:if test="${empty member }">
		<script>
			loation.href = '${conPath }/member/mLogin.do';
		</script>
	</c:if>

	<c:if test="${thResResult eq true }">
		<script>
			alert('예매 성공했습니다');
		</script>
	</c:if>
	
	<c:if test="${thResResult eq false }">
		<script>
			alert('예매 실패했습니다. \n다시 확인해주세요');
			history.back();
		</script>
	</c:if>
	
	<jsp:include page="../main/header.jsp" />
	<div class="background-color">
		<div id="wrap">
			<div id="myPage">

				<!-- left: myContent -->
				<div class="myContent">
					<ul>
						<li>
							<h3>안녕하세요!</h3>
							<h1><a href="${conPath }/member/mMypage.do?mid=${mid}">${member.mname } 님</a></h1> <br>
						</li>
						<li>
							<ul>
								<li><h4>나의 활동관리</h4></li>
								<li><a href="${conPath}/member/tOrderList.do">티켓 예매 내역</a></li>
								<li><a href="${conPath }/thRes/thResList.do?mid=${member.mid }">공연 예매 내역</a></li>
								<li><a href="">공연 리뷰</a></li>
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
				</div><!-- myContent -->

				<!-- right: myInfo -->
				<div class="myPage_right">
					<div class="info_box">
						<div class="info_box_left">
							<p>연간 방문 횟수</p>
							<h1>${member.mvisit }회</h1>
						</div>
						<div class="info_box_right">
							<p>회원등급</p>
							<h1>${member.grade }</h1>
						</div>
						<div class="info_box_right">
							<h1>${(member.highvi +1) - member.mvisit }회</h1> 추가 방문 시 등급 UP!
						</div>
					</div><!-- info_box -->

					<!-- main_item -->
					<div class="item_box">
						<div class="sub_item item1" onclick="location.href='${conPath}/member/tOrderList.do'">
							<h2>티켓 예매확인/취소</h2>
						</div>
						<div class="sub_item item2">
							<div class="normal_box" onclick="location.href='${conPath }/thRes/thResList.do?mid=${member.mid }'">
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
					</div>
					<!-- main_item -->
				</div>

			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>

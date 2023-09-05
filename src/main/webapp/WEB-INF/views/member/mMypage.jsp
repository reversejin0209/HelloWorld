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
			location.href = '${conPath }/member/mLogin.do';
		</script>
	</c:if>

	<!-- 예매 처리 -->
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

	<!-- 예매권 취소 -->
	<c:if test="${thResCancelResult eq true }">
		<script>
			alert('예매가 취소되었습니다.');
		</script>
	</c:if>

	<c:if test="${thResCancelResult eq false }">
		<script>
			alert('당일 공연 혹은 공연 시간이 지난 예매는 취소가 불가능합니다.');
			history.back();
		</script>
	</c:if>

	<!-- 예매권 리뷰 작성 -->
	<c:if test="${thRevWriteResult eq 1 }">
		<script>
			alert('리뷰가 작성되었습니다.');
		</script>
	</c:if>

	<c:if test="${thRevWriteResult eq 0 }">
		<script>
			alert('리뷰 작성 실패되었습니다. 다시 확인해주세요.');
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
							<h1>
								<a href="${conPath }/member/mMypage.do?mid=${mid}">${member.mname } 님</a>
							</h1> <br>
						</li>
						<li>
							<ul>
								<li><h4>나의 활동관리</h4></li>
								<li><a href="${conPath}/ticket/myTicketList.do">티켓 예매 내역</a></li>
								<li><a href="${conPath }/thRes/thResList.do?mid=${member.mid }">공연 예매 내역</a></li>
								<li><a href="${conPath }/thRev/mthRevList.do?mid=${member.mid }">공연 리뷰</a></li>
								<li><a href="">어트랙션 리뷰</a></li>
							</ul>

							<ul>
								<li><h4>나의 계정설정</h4></li>
								<li><a href="${conPath }/member/mModify.do">회원정보 수정</a></li>
								<li><a href="">회원등급</a></li>
							</ul>

							<ul>
								<li><h4>고객센터</h4></li>
								<li><a href="${conPath }/qnaBoard/myQnaBoardList.do">1:1 문의내역</a></li>
								<li><a href="">어트랙션 문의내역</a></li>
								<li><a href="">공지사항</a></li>
								<li><a href="">FAQ</a></li>
								<li><a href="">고객의 소리</a></li>
							</ul>
						</li>
					</ul>
				</div>
				<!-- myContent -->

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
							<c:if test="${member.grade != 'VIP'}">
								<h1>${(member.highvi +1) - member.mvisit }회</h1> 추가 방문 시 등급 UP!
							</c:if>
							<c:if test="${member.grade eq 'VIP'}">
								${member.mname } 님은
								<h1>최고 등급입니다</h1>
							</c:if>

						</div>
					</div>
					<!-- info_box -->

					<!-- main_item -->
					<div class="item_box">
						<div class="sub_item item1" onclick="location.href='${conPath}/ticket/myTicketList.do'">
							<img alt="티켓 예매 아이콘" src="https://em-content.zobj.net/source/microsoft-teams/337/ticket_1f3ab.png" >
							<h2>티켓 예매확인/취소</h2>
						</div>
						<div class="sub_item item2">
							<img alt="공연 아이콘" src="https://em-content.zobj.net/source/microsoft-teams/337/admission-tickets_1f39f-fe0f.png">
							<div class="normal_box" onclick="location.href='${conPath }/thRes/thResList.do?mid=${member.mid }'">
								<h2>공연 예매확인/취소</h2>
							</div>
						</div>
						<div class="sub_item item3">
							<img alt="문의 아이콘" src="https://em-content.zobj.net/source/microsoft-teams/337/open-mailbox-with-raised-flag_1f4ec.png">
							<div class="normal_box" onclick="location.href='${conPath }/qnaBoard/myQnaBoardList.do'">
								<h2>1:1 문의내역</h2>
							</div>
						</div>
						<div class="sub_item item4">
							<img alt="후기 아이콘" src="https://em-content.zobj.net/source/microsoft-teams/337/pencil_270f-fe0f.png">
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

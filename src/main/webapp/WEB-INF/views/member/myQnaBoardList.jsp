<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<link href="${conPath }/css/board.css" rel="stylesheet">
<link href="${conPath }/css/member/member.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	$(document).ready(function() {
		$('tr').click(function() {
			var qanum = $(this).children().eq(0).text().trim();
			if (!isNaN(qanum)) {
				$.ajax({
					url : '${conPath}/qnaBoard/myQnaBoardContent.do',
					type : 'get',
					data : 'qanum=' + qanum,
					dataType : 'html',
					success : function(data) {
						$('.myPage_right_white').html(data);
					},
				});
			}
		});
	});
</script>
</head>
<body>
	<c:if test="${empty member }">
		<script>
			location.href = '${conPath }/member/mLogin.do';
		</script>
	</c:if>

	<c:if test="${not empty successMsg }">
		<script>
			alert('${successMsg}');
		</script>
	</c:if>
	<c:if test="${not empty failMsg}">
		<script>
			alert('${failMsg}');
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
				</div><!-- myContent -->

				<div class="myPage_right_white">
					<h1 class="center">나의 1:1 문의 내역</h1>
					<br>
					글 갯수 : ${paging.totCnt }
					<table class="list_table">
						<tr>
							<th>글번호</th>
							<th>카테고리</th>
							<th class="title">제목</th>
							<th>작성일</th>
						</tr>

						<!-- 예매 내역이 없는 경우 -->
						<c:if test="${ticketList.size() == 0}">
							<tr>
								<td colspan="5">
									<h4>예매 내역이 없습니다.</h4>
								</td>
							</tr>
						</c:if>

						<c:forEach var="qna" items="${qnaList }">
							<tr>
								<td class="eng">${qna.qanum }</td>
								<td>${qna.qacat }</td>
								<td class="title left"><c:forEach var="i" begin="1" end="${qna.qaindent }">
										<c:if test="${i != qna.qaindent }">
											 &nbsp; &nbsp; 
										</c:if>
										<c:if test="${i == qna.qaindent }">
											 ㄴ
										</c:if>
									</c:forEach> ${qna.qatitle }</td>
								<td class="eng"><fmt:formatDate value="${qna.qardate }" type="date" dateStyle="short" /></td>
							</tr>
						</c:forEach>
					</table>
					<div class="right">
						<button onclick="location.href='${conPath}/qnaBoard/qBoardWrite.do'" class="btn_submit">글쓰기</button>
					</div>

					<!-- 페이징 -->
					<div id="paging">
						<c:if test="${paging.startPage>paging.blockSize}">
							<a href="${conPath }/qnaBoard/myQnaBoardList.do?pageNum=${paging.startPage-1 }">이전</a>
						</c:if>
						<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
							<c:if test="${paging.currentPage==i }">
								<span>${i }</span>
							</c:if>
							<c:if test="${paging.currentPage != i }">
								<a href="${conPath }/qnaBoard/myQnaBoardList.do?method=list&pageNum=${i }">${i }</a>
							</c:if>
						</c:forEach>
						<c:if test="${paging.endPage<paging.pageCnt }">
							<a href="${conPath }/qnaBoard/myQnaBoardList.do&pageNum=${paging.endPage+1 }">다음</a>
						</c:if>
					</div>

				</div>

			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>

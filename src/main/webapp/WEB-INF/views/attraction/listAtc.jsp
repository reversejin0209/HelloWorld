<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<link href="${conPath }/css/attraction/attraction.css" rel="stylesheet">
<style type="text/css">
#atcList_background {
	background-image: url(${conPath}/img/atcList_background.png);
}
</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	$(document).ready(function() {
		$('#onDisplay').click(function name() {
			if ($('#noneDiv').css("display") == "none") {
				$('#noneDiv').show();
			}
		});
		$('#onDisplay').click(function name() {
			if ($('#noneDiv').css("display") == "none") {
				$('#noneDiv').hide();
			}
		});
	});
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="atcList_background">
		<h2 class="cWhite">어트랙션</h2>
		<p class="h2Txt cWhite">
			언제나 새롭고 즐거운 경험을 주는 Helloworld 어트랙션을 소개합니다!
		</p>
	</div>
	<!-- <div id=ListAtcMain> 배경이미지 
		<h2 class="cWhite">어트랙션</h2>
		<p class="h2Txt cWhite">언제나 새롭고 즐거운 경험을 주는<br>&nbsp; Helloworld 어트랙션을 소개합니다!</p>
	</div> -->
	<div id="wrap">
		<!-- 검색박스 -->
		<div class="atc_schBox">
			<!-- ** 경로 수정 ** -->
			<form action="${conPath }/@@.do">
				<h3 class="center">나에게 맞는 어트랙션을 찾아보세요!</h3>
				<ul class="atc_schBox_row">
					<li>
						<h3>위치</h3> <select name="abreed">
							<option value="" <c:if test="${param.abreed == ''}">selected="selected"</c:if>>ALL</option>
							<option value="개" <c:if test="${param.abreed == '개' }">selected="selected"</c:if>>개</option>
							<option value="고양이" <c:if test="${param.abreed == '고양이' }">selected="selected"</c:if>>고양이</option>
					</select>
					</li>
					<li>
						<h3>나이</h3> <select name="abreed">
							<option value="" <c:if test="${param.abreed == ''}">selected="selected"</c:if>>ALL</option>
							<option value="개" <c:if test="${param.abreed == '개' }">selected="selected"</c:if>>개</option>
							<option value="고양이" <c:if test="${param.abreed == '고양이' }">selected="selected"</c:if>>고양이</option>
					</select>
					</li>
					<li>
						<h3>키</h3> <input type="text">
					</li>
					<li>
						<h3>나이</h3> <select name="abreed">
							<option value="" <c:if test="${param.abreed == ''}">selected="selected"</c:if>>ALL</option>
							<option value="개" <c:if test="${param.abreed == '개' }">selected="selected"</c:if>>개</option>
							<option value="고양이" <c:if test="${param.abreed == '고양이' }">selected="selected"</c:if>>고양이</option>
					</select>
					</li>
				</ul>
				<div class="serchBox center">
					<input type="submit" value="검색" class="btn_white">
					&nbsp;
					<input type="reset" value="되돌리기" class="btn_white">
				</div>
			</form>


		</div>
		<div class="col-md-5" id="noneDiv">
			<button id="onDisplay">숨은 DIV보기</button>
			<button id="ofDisplay">DIV 숨기기</button>
		</div>
		<div id="content">
			<div>
				<form action="${conPath }/attraction/listAtc.do">
					<input type="hidden" name="method" value="ListAtc">
					<select name="schItem">
						<option value="" <c:if test="${param.schItem eq '' }">selected="selected"</c:if>>조건검색</option>
						<option value="all" <c:if test="${param.schItem eq 'all' }">selected="selected"</c:if>>존+나이+키</option>
						<option value="zname" <c:if test="${param.schItem eq 'zname' }">selected="selected"</c:if>>존이름</option>
						<option value="atold" <c:if test="${param.schItem eq 'atold' }">selected="selected"</c:if>>나이</option>
						<option value="atheight" <c:if test="${param.schItem eq 'atheight' }">selected="selected"</c:if>>키</option>
					</select>
					<input type="text" name="schWord" value="${param.schWord }">
					<input type="submit" value="검색">
				</form>
			</div>
			<div id="listAtc">
				<table>
					<tr>
						<c:forEach var="list" items="${ListAtc}" varStatus="status">
							<c:if test="${status.index%5==0}">
								<tr></tr>
							</c:if>
							<td>
								<a href="${conPath }/attraction/detailAtc.do?atcode=${list.atcode}&pageNum=${paging.currentPage}"> <img
									src="${conPath }/attractionImg/${list.atimage}"> <br> ${list.atname }<br> ${list.zname } <br>
								</a>
							</td>
						</c:forEach>
					</tr>
				</table>
			</div>
		</div>
		<div class="container">
			<div id="srchzone">
				<a href="javascript:" id="schItem" class="firstBt" style="display: block;"><span>조건검색</span></a>
				<div class="after attr" style="display: none;">
					<div class="">
						<div class="valueDiv">
							<p class="tit">위치</p>
							<p class="value location">전체</p>
						</div>
						<!--
						-->
						<div class="valueDiv">
							<p class="tit">나이</p>
							<p class="value">전체</p>
						</div>
						<!--
						-->
						<div class="valueDiv">
							<p class="tit">키</p>
							<p class="value cm"></p>
						</div>
						<!--
						-->
						<div class="valueDiv chk">
							<p class="tit">보호자</p>
							<p class="value ">보호자 탑승</p>
						</div>
					</div>
					<a href="javascript:" class="srchBt"><img src="/common/images/btn/srch_btn2.png" alt="검색하기" /></a> <a
						href="javascript:" class="resetBt reset"><img src="/common/images/btn/srch_reset2.png" alt="리셑" /></a>
				</div>

				<div class="openDiv">
					<p class="tit">
						<span class="fBold">나에게 맞는</span> 어트랙션을 찾아보세요!
					</p>
					<div class="selArea">
						<div class="">
							<p class="selTit">위치</p>
							<div class="openSel">
								<a href="javascript:" class="value">전체</a>
								<ul id="pstnCd" class="option">
									<li><a href="javascript:" class="selected" data-pstn-cd="">전체</a></li>
									<li><a href="javascript:" class="" data-pstn-cd="A0201">익스트림존</a></li>
									<li><a href="javascript:" class="" data-pstn-cd="A0202">쿼리어려워존</a></li>
									<li><a href="javascript:" class="" data-pstn-cd="A0203">JAVA배워존</a></li>
									<li><a href="javascript:" class="" data-pstn-cd="A0204">GIT충돌존</a></li>
								</ul>
							</div>
						</div>
						<div class="">
							<p class="selTit">나이</p>
							<div class="openSel">
								<a href="javascript:" class="value">전체</a>
								<ul id="age" class="option">
									<li><a href="javascript:" class="" data-min-age="0" data-max-age="5">0~5세</a></li>
									<li><a href="javascript:" class="" data-min-age="6" data-max-age="65">6~65세</a></li>
									<li><a href="javascript:" class="" data-min-age="66" data-max-age="99">66세 이상</a></li>
								</ul>
							</div>
						</div>
						<div class="">
							<p class="selTit">키</p>
							<div class="inputDiv">
								<input type="text" value="" id="tall" class="value" maxlength="3" style="text-align: right;" />
								<p class="cmFix">cm</p>
							</div>
						</div>
						<div class="">
							<p class="selTit">보호자</p>
							<div class="chkBtn">
								<a href="javascript:" id="cmpn" class="value ">보호자 탑승</a>
							</div>
						</div>
					</div>
					<div class="btnArea">
						<a href="javascript:" id="search">조회하기</a> <a href="javascript:" class="resetBtn reset"><img
							src="/common/images/btn/srch_reset.png" alt="" /></a>
					</div>
					<a href="javascript:" class="closeBt"><img src="/common/images/btn/srch_close.png" alt="" /></a>
				</div>
			</div>

			<form name="frm" method="get" action="./view.do">
				<input type="hidden" name="pstnCd" value="" />
				<input type="hidden" name="minAge" value="" />
				<input type="hidden" name="maxAge" value="" />
				<input type="hidden" name="tall" value="" />
				<input type="hidden" name="cmpnYn" value="" />
				<input type="hidden" name="checkSrch" value="N" />
				<input type="hidden" name="detailsKey" value="" />

				<div id="attrctnList" class="listType2"></div>
				<div class="noData" style="display: none;">
					<p class="txt">검색된 어트랙션이 없습니다.</p>
				</div>
			</form>
		</div>
	</div>
	<div id="paging">
		<c:if test="${paging.startPage>paging.blockSize}">
			<a
				href="${conPath }/qnaBoard/qBoardList.do?pageNum=${paging.startPage-1 }&schItem=${param.schItem }&schWord=${param.schWord}">이전</a>
		</c:if>

		<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
			<c:if test="${paging.currentPage==i }">
				<span>${i }</span>
			</c:if>
			<c:if test="${paging.currentPage != i }">
				<a
					href="${conPath }/qnaBoard/qBoardList.do?method=list&pageNum=${i }&schItem=${param.schItem }&schWord=${param.schWord}">${i }</a>
			</c:if>
		</c:forEach>

		<c:if test="${paging.endPage<paging.pageCnt }">
			<a
				href="${conPath }/qnaBoard/qBoardList.do&pageNum=${paging.endPage+1 }&schItem=${param.schItem }&schWord=${param.schWord}">다음</a>
		</c:if>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>

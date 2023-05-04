<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloWorld</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<link href="${conPath }/css/board.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="//cdn.ckeditor.com/4.21.0/standard/ckeditor.js"></script>
<script src="${conPath }/ckeditor/ckeditor.js"></script>
<script>
	$(document).ready(function() {
		CKEDITOR.replace('qacontent', {
			filebrowserUploadUrl : '${conPath }/fileupload.do'
		});
	});
</script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<!-- 비회원: 로그인 페이지로 이동 -->
	<c:if test="${empty member }">
		<script type="text/javascript">
			location.href='${conPath }/member/mLogin.do';
		</script>
	</c:if>

	<jsp:include page="../main/header.jsp" />
	<div id="wrap_padding">
		<h1 class="center">1:1 문의글 작성</h1>
		
		<form action="${conPath }/qnaBoard/qBoardWrite.do" method="post">
			<table class="content_table">
				<tr>
					<td>글제목 <b class="purple"> *</b></td>
					<td><input type="text" name="qatitle" required="required" style="display: block; width: 96%;"></td>
				</tr>
				<tr>
					<td>문의유형<b class="purple"> *</b></td>
					<td class="left"><select name="qacat">
							<option value="이용문의">이용문의</option>
							<option value="분실물문의">분실물문의</option>
							<option value="촬영문의">촬영문의</option>
							<option value="불만/건의">불만/건의</option>
					</select></td>
				</tr>
				<tr>
					<!-- CKEDITOR -->
					<td colspan="2">
						<textarea name="qacontent"></textarea>
				</tr>
				<tr>
					<td>비밀번호<b class="purple"> *</b></td>
					<td><input type="text" name="qapw" required="required"></td>
				</tr>
				<tr>
					<td>개인정보 수집 ·<br>이용동의서<b class="purple"> *</b></td>
					<td style="width: 75%;">
						<textarea>개인 정보 수집, 이용 동의서
본인은 방문 전 이용문의 작성과 관련하여 귀사가 아래와 같이 본인의 개인정보를 수집, 이용하는데 동의합니다.

개인정보 수집, 이용에 관한 사항
1.개인정보의 수집, 이용 목적
   고객의 요청ㆍ문의사항 확인, 사실조사를 위한 연락ㆍ통지, 처리결과 통보 등의 목적
2.수집하는 개인정보의 항목
  ㆍ필수입력사항: 이름, E-mail
  ㆍ서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 생성되어 수집될 수 있습니다.
  ㆍ접속로그, 쿠키, 접속IP정보
3.개인정보의 보유, 이용기간
   수집, 이용에 관한 동의일로부터 1년(이후에는 작성내용만 보관됩니다.)
   
※ 귀하는 개인정보 수집, 이용에 대한 동의를 거부하실 권리가 있으며, 동의를 거부하실 경우 서비스 이용이 제한됩니다.</textarea><br>
						<div class="check right">
							<input type="checkbox" id="agreeChk" name="agreeChk" title="개인 정보 수집 및 이용" required="required">
							<label>개인정보 수집 및 이용에 동의합니다.</label>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="btnBox"><input type="submit" value="글쓰기" class="btn_grey"> <input
							type="button" value="글목록" class="btn_grey" onclick="history.back()'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>

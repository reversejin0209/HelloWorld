<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<c:if test="${empty admin }">
		<script type="text/javascript">
			location.href='${conPath }/admin/adLogin.do';
		</script>
	</c:if>

	<jsp:include page="../main/header.jsp" />
	<div id="wrap_padding">
		<h1 class="center">1:1 답변글 작성</h1>
	
		<form action="${conPath }/qnaBoard/qBoardReply.do" method="post">
		
		<!-- 원 게시글 정보 -->
		<input type="hidden" name="qagroup" value="${originBoard.qagroup }">
		<input type="hidden" name="qastep" value="${originBoard.qastep }">
		<input type="hidden" name="qaindent" value="${originBoard.qaindent }">
		
			<table class="content_table">
				<tr>
					<td>글제목 <b class="purple"> *</b></td>
					<td><input type="text" name="qatitle" required="required" style="display: block; width: 96%;"
						value="안녕하세요 헬로월드입니다."></td>
				</tr>
				<tr>
					<td>문의유형<b class="purple"> *</b></td>
					<td class="left"><select name="qacat">
							<option value="답변" selected="selected">답변</option>
					</select></td>
				</tr>
				<tr>
					<!-- CKEDITOR -->
					<td colspan="2">
						<textarea name="qacontent">${originBoard.qacontent }
[답변]
안녕하세요. ${originBoard.writer }(${originBoard.mid })님, 언제나 즐거움이 가득한 헬로월드입니다.

</textarea>
				</tr>
				<tr>
					<td>비밀번호<b class="purple"> *</b></td>
					<td><input type="text" name="qapw" required="required"></td>
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

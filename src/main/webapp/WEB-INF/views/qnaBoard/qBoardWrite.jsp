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
<script>
	$(document).ready(function(){
		$('#qafile').change(function(){
			if(window.FileReader){
				var filename = $(this)[0].files[0].name;
			}else{
				var filename = $(this).val().split('/').pop().split('\\').pop();
			}
			$(this).siblings('.qafile').val(filename);
		});
	});
</script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<!-- 비회원: 로그인 페이지로 이동 -->
	<c:if test="${empty member }">
		<script type="text/javascript">
			loation.href='${conPath }/member/mLogin.do'
		</script>
	</c:if>

	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<form action="${conPath }/qnaBoard/qBoardWrite.do" method="post" enctype="multipart/form-data">
			<table class="content_table">
				<tr>
					<td>글제목</td>
					<td><input type="text" name="qatitle" required="required" style="display: block; width: 96%;"></td>
				</tr>
				<tr>
					<td colspan="2"><textarea name="qacontent"></textarea>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td><input type="text" class="qafile" style="display: block; float: left; width: 80%;">
						<label for="qafile">
							<span class="btn_grey" style="line-height: 32px;">파일첨부</span>
						</label>
						<input type="file" id="qafile" name="tempQafile" style="display: none;">
				</tr>
				<tr>
					<td colspan="2" class="btnBox">
						<input type="submit" value="글쓰기" class="btn_submit">
						<input type="button" value="글목록" class="btn_submit" onclick="location.href='${conPath}/qnaBoard/qBoardList.do'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>

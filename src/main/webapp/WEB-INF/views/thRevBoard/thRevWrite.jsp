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
		CKEDITOR.replace('thrcontent', {
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
	
	<!-- 리뷰 작성 확인 -->	
	<c:if test="${writeViewResult eq 1 }">
		<script>
			alert('공연 당일 부터 리뷰 작성이 가능합니다.');
			history.back();
		</script>
	</c:if>

	<jsp:include page="../main/header.jsp" />
	<div id="wrap_padding">
		<h1 class="center">공연 리뷰 작성</h1>
		
		<form action="${conPath }/thRev/thRevWrite.do" method="post">
			<input type="hidden" name="thrcode" value="${param.thrcode }">
			<input type="hidden" name="mid" value="${param.mid }">
			<table class="content_table">
				<tr>
					<td>
						글제목 <b class="purple"> *</b>
					</td>
					<td>
						<input type="text" name="thrtitle" required="required" style="display: block; width: 96%;"
										maxlength="23">
					</td>
				</tr>
				<tr>
					<!-- CKEDITOR -->
					<td colspan="2">
						<textarea name="thrcontent" maxlength="1000"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="btnBox">
						<input type="submit" value="글쓰기" class="btn_grey"> 
						<input type="button" value="글목록" class="btn_grey" onclick="history.back()'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>

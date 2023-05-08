<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<link href="${conPath }/css/notice/noticeWrite.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
		<div id="joinForm_wrap">
		<form action="${conPath }/notice/noticeWrite.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="adid" value="${admin.adid }">	
			<div id="join_title">공지 등록</div>
			<table>
				<tr>
					<th><label for="ntitle">공지 이름</label></th>
					<td>
						<input type="text" name="ntitle" id="ntitle" class="ntitle" required="required"
										maxlength="20" placeholder="20자 이내로 적어주세요">
					</td>
				</tr>
				<tr>
					<th><label for="ntype">공지 타입</label></th>
					<td>
						<select name="ntype" id="loc_box">
							<option value="이벤트/뉴스">이벤트/뉴스</option>
							<option value="뉴스/공지">뉴스/공지</option>
							<option value="긴급">긴급</option>
						</select>
					</td>
				</tr>			
				<tr>
					<th><label for="ncontent">공지 이미지</label></th>
					<td><input type="file" name="ncontent1temp" id="ncontent"></td>
				</tr>
				<tr>
					<td colspan="2" id="lasttd">
						<input type="submit" value="등록하기" class="joinBtn_style">
						<input type="button" value="취소" class="joinBtn_style" onclick="history.back()">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
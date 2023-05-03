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
<link href="${conPath }/css/board.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="//cdn.ckeditor.com/4.21.0/standard/ckeditor.js"></script>
<script src="${conPath }/ckeditor/ckeditor.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${conPath }/js/address.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	$(document).ready(function() {
		CKEDITOR.replace('atcontent', {
			filebrowserUploadUrl : '${conPath }/fileUpAtc.do'
		});
		$('.atcDeleteBtn').click(function(){
			location.href='${conPath}/attraction/deleteAtc.do?atcode=${param.atcode }&pageNum=${param.pageNum}';
		});
		$('.atcListBtn').click(function(){
			location.href='${conPath}/attraction/modifyAtc.do?pageNum=${param.pageNum}';
		});
	});
</script>
<style>
.inputSt {display: block; width: 96%;}
</style>
</head>
<body>
	<!-- 관리자가 아닐경우 뒤로이동 -->
	<c:if test="${empty admin}">
		<script type="text/javascript">
			window.history.back(-1)
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp" />
		<div id="wrap">
			<h1>기구 수정</h1>
			<form action="${conPath }/attraction/modifyAtc.do?pageNum=${param.pageNum}" method="post" enctype="multipart/form-data" >
				<input type="hidden" name="pageNum" value="${param.pageNum }">
				<input type="hidden" name="atcode" value="${param.atcode }">
				<table class="content_table"> 
					<tr>
						<td>기구이름 <b class="purple"> *</b></td>
						<td><input type="text" name="atname" required="required" class="inputSt" value="${modifyAtc.atname }" ></td>
						<td>대표사진<b class="purple"> *</b></td>
						<td><input type="file" name="atimagetemp" class="inputSt" value="${modifyAtc.atimage }" ></td>
					</tr>
					<tr>
						<td>대표영상 <b class="purple"> *</b></td>
						<td><input type="text" name="atyoutube" class="inputSt"  value="${modifyAtc.atyoutube }"></td>
						<td>존이름<b class="purple"> *</b></td>
						<td class="left">
							<select name="zname" >	
								<option value="익스트림존" <c:if test="${modifyAtc.zname eq '익스트림존' }">selected="selected"</c:if>>익스트림존</option>
								<option value="매지컬랜드" <c:if test="${modifyAtc.zname eq '매지컬랜드' }">selected="selected"</c:if>>매지컬랜드</option>
								<option value="어드벤처존" <c:if test="${modifyAtc.zname eq '어드벤처존' }">selected="selected"</c:if>>어드벤처존</option>
								<option value="워터월드" <c:if test="${modifyAtc.zname eq '워터월드' }">selected="selected"</c:if>>워터월드</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>인원 제한<b class="purple"> *</b></td>
						<td>
							<input type="number" name="atnop" class="inputSt" placeholder="( ex : 40명이하 탑승가능 )" value="${modifyAtc.atnop }">
						</td>
						<td>나이 제한<b class="purple"> *</b></td>
						<td>
							<input type="number" name="atold" class="inputSt" placeholder="( ex : 6살이상 탑승가능 )" value="${modifyAtc.atold }">
						</td>
					</tr>
					<tr>
						<td>키 제한<b class="purple"> *</b></td>
						<td>
							<input type="number" name="atheight" class="inputSt" placeholder="( ex : 100cm 이하 탑승가능 )" value="${modifyAtc.atheight }">
						</td>
						<td>몸무게 제한<b class="purple"> *</b></td>
						<td>
							<input type="number" name="atweight" class="inputSt" placeholder="( ex : 100kg이하 탑승가능 )" value="${modifyAtc.atweight }">
						</td>
					</tr>
					<tr>
						<td>기구관련<b class="purple"> *</b></td>
						<td>
							<input type="text" id="sample4_postcode" name="atpost" class="text_box"  placeholder="수정위치" value="${modifyAtc.ataddr }">
							<input type="button" onclick="sample4_execDaumPostcode()" value="기구주소 찾기">
						</td>
						<td>상세위치<b class="purple"> *</b></td>
						<td>
							<input type="text" id="sample4_roadAddress" name="ataddr"  placeholder="상세위치 ( 자동출력 )" value="${modifyAtc.atpost }">
							<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소" ><br>
							<span id="guide" style="font-size: 0.8em;"></span>
							<br>
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea name="atcontent">${modifyAtc.atcontent }</textarea>
					</tr>
					<tr>
						<td colspan="4" class="btnBox">
							<input type="submit" value="기구수정" class="btn_submit">
							<input type="button" value="기구삭제" class="btn_submit atcDeleteBtn"> 
							<input type="button" value="등록취소" class="btn_submit atcListBtn"> 
						</td>
					</tr>
				</table>
			</form>
		</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>

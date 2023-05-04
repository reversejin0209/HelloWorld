<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/member/join.css" rel="stylesheet">
	<link href="${conPath }/css/style.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script>
  	$(function(){
  		// keyup event(id 중복 확인용) 
  		$('input[name="mid"]').keyup(function(){
  			var mid = $(this).val().trim();
  			if(mid == "") {
  				$('#idConfirmResult').html('&nbsp; &nbsp; &nbsp;');
  			} else if(mid.length<3 || mid.length>13) {
  				$('#idConfirmResult').html('<b class="purple">아이디는 3글자 이상 혹은 13글자 이하로 입력해주세요</b>');
  			} else {
  				$.ajax({
  					url : '${conPath }/member/mIdConfirm.do',
  					type : 'get',
  					data : 'mid='+mid,
  					dataType : 'html',
  					success : function(data){
  						$('#idConfirmResult').html(data);
  					},
  				}); // ajax함수
  			}  // if
  		}); 
  		// keyup event(tel 중복 확인용) 
  		var patternTel = /^\d{3}-\d{3,4}-\d{4}$/;
  		$('#mtel').keyup(function(){
  			var mtel = $(this).val().trim();
  			if(mtel == "") {
  				$('#telConfirmResult').html('&nbsp; &nbsp; &nbsp;');
  			} else if(!mtel.match(patternTel)) {
  				$('#telConfirmResult').html('<b class="purple">연락처 형식을 지켜주세요</b>');
  			} else {
	  			$.ajax({
	  				url : '${conPath}/member/mTelConfirm.do',
	  				type : 'get',
	  				data : 'mtel='+mtel,
	  				dataType : 'html',
	  				success : function(data) {
	  					$('#telConfirmResult').html(data);
	  				}
	  			}); // ajax 함수
  			}
  		}); 
  		// keyup event(email 중복 확인용)   		
  		var patternMemail = /^[a-zA-Z0-9_\.]+@[a-zA-Z0-9_]+(\.\w+){1,2}$/;
  		$('input[name="mmail"]').keyup(function(){
  			var mmail = $(this).val().trim();
  			if(mmail==""){
  				$('#emailConfirmResult').html('&nbsp; &nbsp; &nbsp;');
  			} else if(!mmail.match(patternMemail) || mmail.length>40){
  				$('#emailConfirmResult').html('<b class="purple">메일 형식을 지켜 주세요</b>');
  			} else{
  				$.ajax({
  					url : '${conPath}/member/mEmConfirm.do',
  					type : 'get',
  					data : 'mmail='+mmail,
  					dataType : 'html',
  					success : function(data){
  						$('#emailConfirmResult').html(data);
  					},
  				});
  			}
  		}); 
  		// // keyup event(pw 일치 확인용) 
  		var patternPw = /^[A-Za-z0-9]{6,12}$/;
  		$('#mpw, #mpwChk').keyup(function(){
  			var mpw = $('#mpw').val().trim();
  			var pwChk = $('#mpwChk').val().trim();  			
  			if(!mpw.match(patternPw)) {
  				$('#pwChkResult').html('<b class="purple">숫자 또는 문자 6~12자리 이내로 입력해주세요</b>'); 
  			} else if(mpw=="" && pwChk=="") {
  				$('#pwChkResult').html('&nbsp; &nbsp; &nbsp;');
  			} else if(mpw == pwChk) {
  				$('#pwChkResult').text('비밀번호 일치');
  			} else if(mpw != pwChk){
  				$('#pwChkResult').html('<b class="purple">비밀번호 불일치</b>');
  			} 
  		}); 
  		// submit 조건
  		$('form').submit(function(){
  	  		var idConfirmResult  = $('#idConfirmResult').text().trim();
  	  		var pwChkResult      = $('#pwChkResult').text().trim();
  	  		var telConfirmResult   = $('#telConfirmResult').text().trim();
  	  		var emailConfirmResult = $('#emailConfirmResult').text().trim();
  	  		if(idConfirmResult != '사용 가능한 ID입니다') {
  	  			alert('ID를 확인하세요');
  	  			return false; // submit 제한
  	  		} else if(pwChkResult != '비밀번호 일치') {
  	  			alert('비밀번호를 확인하세요');
  	  			$('#mpw').focus();
  	  			return false;
  	  		} else if(telConfirmResult != '사용 가능한 연락처입니다') {
  	  			alert('연락처를 확인하세요');
  	  			$('#mtel').focus();
  	  			return false;
  	  		} else if(emailConfirmResult != '사용 가능한 E-Mail입니다') {
  	  			alert('이메일을 확인하세요');
  	  			$('#memail').focus();
  	  			return false;
  	  		}
  		});  		
  	});
  </script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="joinForm_wrap">
		<form action="${conPath }/member/mJoin.do" method="post">
			<div id="join_title">회원가입</div>
			<table>
				<tr>
					<th><label for="mid">아이디 <b class="purple">*</b></label></th>
					<td>
						<input type="text" name="mid" id="mid" class="mid" required="required"
								placeholder="3글자 이상 입력해주세요">
						<div id="idConfirmResult"> &nbsp; &nbsp; &nbsp; </div>
					</td>
				</tr>
				<tr>
					<th><label for="mpw">비밀번호 <b class="purple">*</b></label></th>
					<td>
						<input type="password" name="mpw" id="mpw" class="mpw" 
									 required="required" placeholder="숫자 또는 문자 6~12자리 이내로 입력해주세요">
					</td>
				</tr>
				<tr>
					<th><label for="mpwChk">비밀번호 확인 <b class="purple">*</b></label></th>
					<td>
						<input type="password" name="mpwChk" id="mpwChk" class="mpwChk" required="required">
						<div id="pwChkResult"> &nbsp; &nbsp; &nbsp; </div>
					</td>
				</tr>
				<tr>
					<th><label for="mname">이름 <b class="purple">*</b></label></th>
					<td><input type="text" name="mname" id="mname" class="mname" required="required"></td>
				</tr>
				<tr>
					<th><label for="mtel">연락처 <b class="purple">*</b></label></th>
					<td>
						<input type="text" name="mtel" id="mtel" class="mtel" required="required">
						<div id="telConfirmResult"> &nbsp; &nbsp; &nbsp; </div>
					</td>
				</tr>
				<tr>
					<th><label for="mmail">이메일 <b class="purple">*</b></label></th>
					<td>
						<input type="text" name="mmail" id="mmail" class="mmail" required="required">
						<div id="emailConfirmResult"> &nbsp; &nbsp; &nbsp; </div>
					</td>
				</tr>			
				<tr>
					<td colspan="2" id="lasttd">
						<input type="submit" value="가입하기" class="joinBtn_style">
						<input type="button" value="취소" class="joinBtn_style" onclick="history.back()">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>



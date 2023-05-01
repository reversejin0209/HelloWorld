<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="${conPath }/css/member/modify.css" rel="stylesheet">
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script>
  	$(function(){
  	// keyup event(tel 중복 확인용) 
  		var patternTel = /^\d{3}-\d{3,4}-\d{4}$/;
  		var dbmtel = '${member.mtel }'
  		$('#mtel').keyup(function(){
  			var mtel = $(this).val().trim();
  			if(mtel == "" || mtel == dbmtel) {
  				$('#telConfirmResult').html('&nbsp; &nbsp; &nbsp;');
  			} else if(!mtel.match(patternTel)) {
  				$('#telConfirmResult').html('<b class="red">전화번호 형식을 지켜주세요</b>');
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
  		var dbmemail = '${member.mmail }';
  		$('input[name="mmail"]').keyup(function(){
  			var memail = $(this).val().trim();
  			if(memail=="" || memail == dbmemail){
  				$('#emailConfirmResult').html('&nbsp; &nbsp; &nbsp;');
  			} else if(!memail.match(patternMemail)){
  				$('#emailConfirmResult').html('<b class="red">메일 형식을 지켜 주세요</b>');
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
  		$('#oldMpw, #mpw').keyup(function(){
  			var oldMpw = $('#oldMpw').val().trim();
  			var curMpw = '${member.mpw }';
  			var mpw    = $('#mpw').val().trim();  			
  			if(!oldMpw.match(curMpw)) {
  				$('#pwChkResult').html('<b class="red">현재 비밀번호를 다시 확인해주세요</b>'); 
  			} else if(mpw=="" || oldMpw=="") {
  				$('#pwChkResult').html('&nbsp; &nbsp; &nbsp;');
  			} else if(!mpw.match(patternPw)) {
  				$('#pwChkResult').html('<b class="red">숫자 또는 문자 6~12자리 이내로 입력해주세요</b>'); 
  			} else if(mpw.match(curMpw)){
  				$('#pwChkResult').html('<b class="red">현재 비밀번호와 다른 비밀번호를 입력해주세요</b>');
  			} else {
  				$('#pwChkResult').html('<b class="purple">비밀번호 확인</b>');
  			}
  		}); 
  		// submit 조건
  		$('form').submit(function(){
  	  		var pwChkResult        = $('#pwChkResult').text().trim();
  	  		var telConfirmResult   = $('#telConfirmResult').text().trim();
  	  		var inputMtel          = $('#mtel').value();
  	  		var emailConfirmResult = $('#emailConfirmResult').text().trim();
  	  		var inputMemail        = $('#mmail').value();
  	  		if(pwChkResult != '비밀번호 확인' || pwChkResult == "") {
  	  			alert('비밀번호를 확인하세요');
  	  			$('#mpw').focus();
  	  			return false;
  	  		} else if(dbmtel != inputMtel || telConfirmResult == '중복된 연락처입니다') {
  	  			alert('연락처를 확인하세요');
  	  			$('#mtel').focus();
  	  			return false;
  	  		} else if(dbmemail != inputMemail || emailConfirmResult == '중복된 E-Mail입니다') {
  	  			alert('이메일을 확인하세요');
  	  			$('#mmail').fucos();
  	  			return false;
  	  		}
  		});  		
  	});
   </script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="modifyForm_wrap">
		<form action="${conPath }/member/mModify.do" method="post">
			<div id="modify_title">정보수정</div>
			<table>
				<tr>
					<th>
						<label for="mid">아이디</label>
					</th>
					<td>
						<input type="text" name="mid" id="mid" class="mid" value="${member.mid }" readonly="readonly" style="background-color: #FFFFFF">
					</td>
				</tr>
				<tr>
					<th>
						<label for="oldMpw">현재 비밀번호</label>
					</th>
					<td>
						<input type="password" name="oldMpw" id="oldMpw" class="oldMpw" required="required">
					</td>
				</tr>
				<tr>
					<th>
						<label for="mpw">새 비밀번호</label>
					</th>
					<td>
						<input type="password" name="mpw" id="mpw" class="mpw">
						<div id="pwChkResult">&nbsp; &nbsp; &nbsp;</div>
					</td>
				</tr>
				<tr>
					<th>
						<label for="mname">이름</label>
					</th>
					<td>
						<input type="text" name="mname" id="mname" class="mname" value="${member.mname }" required="required">
					</td>
				</tr>
				<tr>
					<th>
						<label for="mtel">연락처</label>
					</th>
					<td>
						<input type="text" name="mtel" id="mtel" class="mtel" value="${member.mtel }" required="required">
						<div id="telConfirmResult">&nbsp; &nbsp; &nbsp;</div>
					</td>
				</tr>
				<tr>
					<th>
						<label for="mmail">이메일</label>
					</th>
					<td>
						<input type="text" name="mmail" id="mmail" class="mmail" value="${member.mmail }" required="required">
						<div id="emailConfirmResult">&nbsp; &nbsp; &nbsp;</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" id="lasttd">
						<input type="submit" value="정보수정" class="btn"> <input type="button" value="이전" class="btn" onclick="history.back()">
					</td>
				</tr>
			</table>
		</form>
		<p class="withdrawal">
			<a href="${conPath }/member/mWithdrawal.do?mid=${member.mid }">회원탈퇴</a>
		</p>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>

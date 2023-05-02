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
	<link href="${conPath }/css/theater/theaterInsert.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
		$(document).ready(function() {  
			$('input[type="radio"]').click(function(){
  			var thschedule = $(this).val();
 				$.ajax({
 					url : '${conPath }/theater/theaterCntChk.do',
 					type : 'get',
 					data : 'thschedule='+thschedule,
 					dataType : 'html',
 					success : function(data){
 						$('#thConfirmResult').html(data);
 					}
 				}); // ajax함수
  		}); 
		
			$('form').submit(function(){
				var thConfirmResult  = $('#thConfirmResult').text().trim();
				if(thConfirmResult == '한 스케쥴당 4개 이하만 등록할 수 있습니다.') {
					alert('공연 스케쥴을 확인해 주세요');
					$('#thConfirmResult').focus();
					return false;
				}
			});
		});
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
		<div id="joinForm_wrap">
		<form action="${conPath }/theater/theaterInsert.do" method="post" enctype="multipart/form-data">
			<div id="join_title">공연 추가</div>
			<table>
				<tr>
					<th><label for="thname">공연 이름</label></th>
					<td>
						<input type="text" name="thname" id="thname" class="thname" required="required"
										maxlength="16" placeholder="16자 이내로 입력해주세요">
					</td>
				</tr>
				<tr>
					<th><label for="thcontent">공연 한줄 설명</label></th>
					<td>
						<input type="text" name="thcontent" id="thcontent" class="thcontent" 
									 required="required" placeholder="100자 이내로 입력해주세요" maxlength="100">
					</td>
				</tr>
				<tr>
					<th>
						<label for="thtime">공연 소요 시간</label>
					</th>
					<td>
						<input type="number" name="thtime" id="thtime" class="thtime" required="required"
										placeholder="10분 이상 120분 이하로 입력해주세요" min="10" max="120">
					</td>
				</tr>
				<tr>
					<th><label for="thloc">공연 장소</label></th>
					<td>
						<select name="thloc" id="loc_box">
							<option value="익스트림 존">익스트림 존</option>
							<option value="매지컬랜드">매지컬랜드</option>
							<option value="어드벤처존">어드벤처존</option>
							<option value="워터월드">워터월드</option>
						</select>
					</td>
				</tr>
				<tr>
					<th><label for="thseat">공연 좌석 수</label></th>
					<td>
						<input type="number" name="thseat" id="thseat" class="thseat" readonly="readonly" value="40">
					</td>
				</tr>
				<tr>
					<th><label for="thprice">공연 가격</label></th>
					<td>
						<input type="number" name="thprice" id="thprice" class="thprice" required="required">
					</td>
				</tr>			
				<tr>
					<th><label for="thimg1">공연 이미지</label></th>
					<td><input type="file" name="thimg1temp" id="thimg1"></td>
				</tr>
				<tr>
					<th><label for="thschedule">공연 스케쥴</label></th>
					<td>
						<input type="radio" name="thschedule" id="thschedule" class="thschedule" value="0"> 짝수 날
						<input type="radio" name="thschedule" id="thschedule" class="thschedule" value="1"> 홀수 날
						<div id="thConfirmResult"> &nbsp; &nbsp; &nbsp; </div>
					</td>
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
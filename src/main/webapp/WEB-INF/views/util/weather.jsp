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
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
		$(document).ready(function() {
			var xhr = new XMLHttpRequest();
			var url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst'; /*URL*/
			var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'nWZqKfrh%2BZYh8lZYkihm6Bx7az0QutJg%2B6Tw6qrssK64j%2FX4sWNTlRfyi6%2FyYXRnnwziW4S7%2FVADwA5zjN9C5g%3D%3D'; /*Service Key*/
			queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
			queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('1000'); /**/
			queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('JSON'); /**/
			queryParams += '&' + encodeURIComponent('base_date') + '=' + encodeURIComponent('20240425'); /**/
			queryParams += '&' + encodeURIComponent('base_time') + '=' + encodeURIComponent('1200'); /**/
			queryParams += '&' + encodeURIComponent('nx') + '=' + encodeURIComponent('64'); /**/
			queryParams += '&' + encodeURIComponent('ny') + '=' + encodeURIComponent('120'); /**/
			xhr.open('GET', url + queryParams);
			xhr.onreadystatechange = function () {
			    if (this.readyState == 4) {
			        alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
			    }
			};

			xhr.send('');
		});
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
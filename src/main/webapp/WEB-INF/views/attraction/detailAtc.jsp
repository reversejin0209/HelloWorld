<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<link href="${conPath }/css/board.css" rel="stylesheet">
<link href="${conPath }/css/attraction/detailAtc.css" rel="stylesheet">
<style>
.embed-container {
	position: relative;
	padding-bottom: 56.25%;
	height: 0;
	overflow: hidden;
	max-width: 100%;
}

.embed-container iframe, .embed-container object, .embed-container embed
	{
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

.rideInfo {
	background-image: url("${conPath}/attractionImg/parkland.jpg");
	background-size: 100% 100%;
	background-color: rgba(255, 255, 255, 0.5);
	position: relative;
}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ec6aa5d1142e93ea1eaaa8d7ee83b508&libraries=services"></script>
<script>
	var locked = 0;
	function show(star) {
		if(locked)
			return;
		var i;
		var img;
		var e;
		var e = document.getElementById('startext');
		var stateMsg
		
		for (i = 1; i<= star; i++) {
			img = 'img' + i;
			el = document.getElementById(image);
			el.src = "atRevImg/star1.png";
		}
		
		switch (star) {
		case 1:
			stateMsg = "재미없었어요";
			break;
		case 2:
			stateMsg = "기대하지 말아요";
			break;
		case 3:
			stateMsg = "무난했어요";
			break;
		case 4:
			stateMsg = "기대해도 좋아요";
			break;
		case 5:
			stateMsg = "너무 재밌는 놀이기구였어요";
			break;
		default:
			stateMsg = "";
		}
		e.innerHTML = stateMsg;
	}
	
	function noshow(star) {
		if(lokced)
			return;
		var i;
		var img;
		var el;
		
		for(i = 1; i <= star; i++) {
			img = 'img' + i;
			el = document.getElementById(img);
			el.src = "atRevImg/star0.png";
		}
	}
	
	function lock(star) {
		show(star);
		locked = 1;
	}
	
	function mark(star) {
		lock(star);
		alert("선택2"+star);
		document.cmtform.star.value=star;
	}
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<!-- content 시작 -->
	<div class="content">
		<h2>${detailAtc.atname }</h2>
		<div class="container">
			<p class="h2Txt" style="white-space: pre-wrap;">${detailAtc.atcontent }</p>
		</div>
		<!-- youtube 링크 -->
		<div class="youtubeArea attrctn">
			<div class='embed-container'>
				<iframe src='${detailAtc.atyoutube }' frameborder='0'
					allowfullscreen></iframe>
			</div>
		</div>
		<div class="reviewArea">
			<table>
				<tr>
					<c:forEach var="list" items="${arvList}" varStatus="status">
						<c:if test="${status.index%2==0}">
							<tr></tr>
						</c:if>
						<td>
							<a href="${conPath }/attraction/atRevList.do?atcode=${list.atcode}&pageNum=${paging.currentPage}"> </a>
						</td>
					</c:forEach>
				</tr>
			</table>
			<b onclick="location.href='${conPath }/attraction/atRevList.do?atcode=${param.atcode }&atname=${detailAtc.atname }'">리뷰보기</b>					
		</div>
		<div class="rideInfo">
			<div class="cardArea">
				<div class="card">
					<p class="icon">
						<img src="${conPath }/attractionImg/rideInfo_card_icon1.png"
							alt="" />
					</p>
					<p class="txt">탑승인원</p>
					<div class="boldDiv">
						<p class="boldTxt">${detailAtc.atnop }명</p>
					</div>
				</div>
				<div class="card">
					<p class="icon">
						<img src="${conPath }/attractionImg/rideInfo_card_icon2.png"
							alt="" />
					</p>
					<p class="txt">이용정보</p>
					<div class="lightDiv">
						<p class="lightTxt" />
						<div>
							${detailAtc.atheight }cm이상탑승가능<br> ${detailAtc.atweight }kg이하
							탑승 가능
						</div>
					</div>
				</div>
			</div>
			<p class="subTit">탑승제한</p>
			<div class="restArea">
				<p>
					<img src="${conPath }/attractionImg/bear.png" alt="음주" /><br>음주
				</p>
				<p>
					<img src="${conPath }/attractionImg/woman.png" alt="임산부" /><br>임산부
				</p>
				<p>
					<img src="${conPath }/attractionImg/heart.png" alt="심/혈관계 질환자" /><br>심/혈관계
					질환자
				</p>
				<p>
					<img src="${conPath }/attractionImg/dake.png" alt="디스크 환자" /><br>디스크
					환자
				</p>
			</div>
		</div>
		<div class="mapInfo">
			<p class="subTit">위치정보</p>
			<div id="map"></div>
			<!-- 지도 -->
			<script>
				var mapContainer = document.getElementById('map'), // 지도 표시용 div
					mapOption = {
						center : new kakao.maps.LatLng('${detailAtc.atlat}', '${detailAtc.atlng}'), // 지도의 중심좌표
						level : 3 // 지도의 확대 레벨
					};
					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성
					var geocoder = new kakao.maps.services.Geocoder(); // 주소-좌표 변환 객체를 생성
					geocoder.addressSearch('${detailAtc.ataddr}', function(result, status) { // 주소로 좌표를 검색
									if (status === kakao.maps.services.Status.OK) { // searchOk
										var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
										var marker = new kakao.maps.Marker({ // result
											map : map,
											position : coords
										});
										var infowindow = new kakao.maps.InfoWindow({ // atname
											content : '<div style="width:150px;text-align:center;padding:6px 0;">${detailAtc.atname}</div>'
										});
										infowindow.open(map, marker);
										map.setCenter(coords); // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
									}
								});
			</script>
			<div class="btnArea">
				<button class="btn_purple" style="cursor: pointer;"
					onclick="location.href='${conPath}/attraction/listAtc.do?method=ListAtc&schItem=&schWord='">목록</button>
				<c:if test="${not empty admin }">
					<button class="btn_purple" style="cursor: pointer;"
						onclick="location.href='${conPath}/attraction/modifyAtc.do?atcode=${detailAtc.atcode }&pageNum=${param.pageNum }'">수정</button>
				</c:if>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>집 상세 페이지</title>
<meta name="description" content="company is a real-estate template">
<meta name="author" content="Kimarotec">
<meta name="keyword"
	content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800'
	rel='stylesheet' type='text/css'>

<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="icon" href="favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="resources/assets/css/lightslider.min.css">

<style>

.dealer-widget {
	max-height: 300px;
    overflow-y: auto;
	min-height: 200px;
}

.fa-star {
	color: #D27E04;
}

#num {
	color: #D27E04;
}

.fa-star-o{
	margin-right: 3px;	
}

.add-to-fav{
	background-color: transparent;
}

.lSSlideOuter .lSPager.lSGallery img {
    height: 70px;
    width: 100%;
}

#houseImgLikeList .pDetail{
	display : -webkit-box;
	overflow: hidden;
 	 text-overflow: ellipsis;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
    padding: 0px 0px;
    margin: 0;
}

#search-road-result-div {
	max-height: 295px;
    overflow-y: auto;
}

.search-type-btn {
	margin: 25px 0;
}

  .custom-input {
    display: flex;
    align-items: center;
    border: 1px solid #d1d5db;
    border-radius: 8px;
    padding: 8px 16px;
    background-color: #f9fafb;
    margin-bottom: 25px;
  }
  
  .custom-input input {
    flex: 1;
    border: none;
    outline: none;
    padding: 8px 0;
    background-color: transparent;
    margin-left: 8px;
  }

  .bto {
    transition: background-color 0.3s, color 0.3s;
    padding: 8px 16px;
    border: none;
    cursor: pointer;
    width: 32.5%;
  }
  
  .btn-dead {
    background-color: #f3f4f6;
    color: #1f2937;
    font-weight: bold;
  }
  
  .btn-pray {
    background-color: #cca427;
    color: #ffffff;
    font-weight: bold;
  }
  
  .route {
  	display: flex;
    justify-content: space-between;
    margin-bottom: 25px;
  }
</style>
</head>
<body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c9d3f1c90fc1cea85b8bb8303f360c81&libraries=services,clusterer,drawing"></script>
	<%@ include file="../common/header.jsp"%>
	<div id="preloader">
		<div id="status">&nbsp;</div>
	</div>
	<div class="page-head">
		<div class="container">
			<div class="row">
				<div class="page-head-content"></div>
			</div>
		</div>
	</div>

	<div class="content-area single-property"
		style="background-color: #FFF;">
		&nbsp;
		<div class="container">

			<div class="clearfix padding-top-40">

				<div class="col-md-8 single-property-content prp-style-1 ">
					<div class="row">
						<div class="light-slide-item">
							<div class="clearfix">
							<c:if test="${not empty loginUser.userNo}">
							<c:choose>
								<c:when test="${empty jj}">
									<form action="insertJjim.de">
										<div class="favorite-and-print">
											<button class="add-to-fav" style="padding: 5px 3px 4px 5px;"><i class="fa fa-star-o"></i></button>
												<input type="hidden" name="houseNo" id="houseNo" value="${param.houseNo}">
												<input type="hidden" name="userNo" id="userNo" value="${loginUser.userNo}">
										</div>
									</form>
								</c:when>
								<c:otherwise>
									<form action="deleteJjim.de">
										<div class="favorite-and-print">
											<button class="add-to-fav" style="padding: 5px 3px 4px 5px;color:yellow;"><i class="fa fa-star-o"></i></button>
												<input type="hidden" name="houseNo" id="houseNo" value="${param.houseNo}">
												<input type="hidden" name="userNo" id="userNo" value="${loginUser.userNo}">
										</div>
									</form>
								</c:otherwise>
							</c:choose>
							</c:if>
								<ul id="image-gallery" class="gallery list-unstyled cS-hidden">
							<c:forEach var="house" items="${houseImg}" >
									<li data-thumb="${house.changeName}">
										<img src="${house.changeName}" style="width:1500px;height:580px;"/>
									</li>
							</c:forEach>
								</ul>
							</div>
						</div>
					</div>

					<div class="single-property-wrapper">
						<div class="single-property-header">
							<h1 class="property-title pull-left"  style="margin-bottom: 15px;"><b>${house.houseName }</b></h1>
							<c:choose>
								<c:when test="${house.houseStyle == '월세'}">
									<span class="property-price pull-right" style="color:black">(월세) ${house.housePrice}/${house.houseRent}만원</span>
								</c:when>
								<c:otherwise>
									<span class="property-price pull-right" style="color:black">(전세) ${house.housePrice}만원</span>
								</c:otherwise>
							</c:choose>
						</div>
						
						<div>
						
							<c:choose>
								<c:when test="${house.houseAnimals == 'Y'}">
									<img src="resources/houseDetail/dog.png" width="30px"> 
									<span style="margin-left:10px;margin-right: 10px;">애완동물 가능</span>
								</c:when>
								<c:otherwise>
									<img src="resources/houseDetail/dog.png" width="30px">
									<span style="margin-left:10px;margin-right: 10px;">애완동물 불가능</span>
								</c:otherwise>
							</c:choose>
							
							<img src="resources/houseDetail/Toilet.png" width="30px">
								<span style="margin-left:10px;margin-right: 10px;">화장실: ${house.houseToilet} 개</span>
								
							<img src="resources/houseDetail/room.png" width="30px">
								<span style="margin-left:10px;margin-right: 10px;">방 수: ${house.houseRooms} 개</span>
															
							<c:choose>
								<c:when test="${house.houseParkAble >= 1}">
									<img src="resources/houseDetail/parking.png" width="30px">
									<span style="margin-left:10px;margin-right: 10px;">주차 가능: ${house.houseParkAble} 대</span>
								</c:when>
								<c:otherwise>
									<img src="resources/houseDetail/parking.png" width="30px">
									<span style="margin-left:10px;margin-right: 10px;">주차 불가능</span>										
								</c:otherwise>
							</c:choose>							
							
							<c:choose>
								<c:when test="${house.houseBalcony == 'Y'}">
									<img src="resources/houseDetail/balcony.png" width="30px">
									<span style="margin-left:10px;margin-right: 10px;">베란다 : O</span>
								</c:when>
								<c:otherwise>
									<img src="resources/houseDetail/balcony.png" width="30px">
									<span style="margin-left:10px;margin-right: 10px;">베란다 : X</span>								
								</c:otherwise>
							</c:choose>	
							
						</div>
						<div>
							<div>
								
							</div>
							<div>

							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 p0">
					<aside class="sidebar sidebar-property blog-asside-right" style="min-height: 760px;">
						<div class="dealer-widget">
							<c:forEach var="estate" items="${elist}">
    <div class="dealer-content">
        <div class="inner-wrapper">
            <div class="clear" id="${estate.esNo }" onclick="detailEstate(this)">
                <div class="col-xs-4 col-sm-4 dealer-face">
                    <img src="${estate.member.changeName}" class="img-circle" >
                </div>
                <div class="col-xs-8 col-sm-8">
                    <h3 class="dealer-name">
                        <a style="font-size: 16px;">${estate.esName}</a> 
                        <br>
                        <a style="font-size: 14px; color:white;" >${estate.esIntro}</a>
                    </h3>
                </div>
            </div>
            <div class="clear">
                
            </div>
        </div>
    </div>
</c:forEach>
</div>
		<div class="panel panel-default sidebar-menu wow fadeInRight animated">
			<h2>교통정보</h2>
			<div class="search-type-btn">
				<button class="bto btn-pray" id="btn1" onclick="toggleStyle(this)">최소시간</button>
				<button class="bto btn-dead" id="btn2" onclick="toggleStyle(this)">지하철</button>
				<button class="bto btn-dead" id="btn3" onclick="toggleStyle(this)">버스</button>
			</div>
			<div class="custom-input">
				<input id="search-destination" class="search-destination" placeholder="도착지 검색" onkeypress="if( event.keyCode == 13 ){searchLocate();}">			
			</div>
			<div id="search-road-result-div">
				
			</div>
		</div>
		</aside>
	</div>
</div>
<script>
	function toggleStyle(selectedButton) {

	    let buttons = document.querySelectorAll('.bto');

	    buttons.forEach(button => {
	      if(button !== selectedButton) {
	        button.classList.remove('btn-pray');
	        button.classList.add('btn-dead');
	      }
	    });

	    selectedButton.classList.toggle('btn-dead');
	    selectedButton.classList.toggle('btn-pray');
	}
	
	function removeRoute(routeId) {
	    var element = document.getElementById(routeId);
	    element.remove();
	}

</script>
<script>
	function searchLocate(){
		 var ps = new kakao.maps.services.Places(); 
		 var searchLocation = document.getElementById("search-destination").value;
		 const trafic = document.querySelector('.btn-pray').id;
		 
		 var doubleLocation = document.getElementById(searchLocation);
		 
		 if(doubleLocation != null){
			 return showError("오류", "이미 검색하신 장소입니다.", "확인");  
		 }

		ps.keywordSearch(searchLocation, placesSearchCB);
		
		var sx = "${house.houseLongitude}"
		var sy = "${house.houseLatitude}"
		var ex = 0;
		var ey = 0;
		console.log(sx);
		console.log(sy);
		
		function placesSearchCB (data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {
	
		        var bounds = new kakao.maps.LatLngBounds();
	
		        for (var i=0; i<data.length; i++) {
		            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
		        }
		        ex = (bounds.oa + bounds.ha) / 2;
		        ey = (bounds.qa + bounds.pa) / 2;
		        
		        var xhr = new XMLHttpRequest();
		        var url;
		        if(trafic == 'btn1'){
					url = "https://api.odsay.com/v1/api/searchPubTransPathT?SX="+sx+"&SY="+sy+"&EX="+ex+"&EY="+ey+"&OPT=0&SearchType=0&SearchPathType=0&apiKey=cH7JYiCgxsFFcnS8ZV32Uw";	        	
		        } else if(trafic == 'btn2'){
					url = "https://api.odsay.com/v1/api/searchPubTransPathT?SX="+sx+"&SY="+sy+"&EX="+ex+"&EY="+ey+"&OPT=0&SearchType=0&SearchPathType=1&apiKey=cH7JYiCgxsFFcnS8ZV32Uw";	  
		        } else {
					url = "https://api.odsay.com/v1/api/searchPubTransPathT?SX="+sx+"&SY="+sy+"&EX="+ex+"&EY="+ey+"&OPT=0&SearchType=0&SearchPathType=2&apiKey=cH7JYiCgxsFFcnS8ZV32Uw";
				}
		        
				xhr.open("GET", url, true);
				xhr.send();
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {
						var responseObject = JSON.parse(xhr.responseText);
						console.log(responseObject);
						var firstPathValue = responseObject.result.path[0];
						
						const payment = firstPathValue.info.payment; // 교통비
						const totalDistance = firstPathValue.info.totalDistance; //총 거리
						const subwayTransitCount = firstPathValue.info.subwayTransitCount; //지하철 환승 카운트
						const busTransitCount = firstPathValue.info.busTransitCount; //버스 환승 카운트
						const totalTime = firstPathValue.info.totalTime; //총 시간
						const trafficType = firstPathValue.subPath.trafficType; //이동 수단 종류
						const subPath = firstPathValue.subPath; //이동 교통 수단 확장
						const pathType = firstPathValue.pathType;
						
						var walkTime = 0; // 도보 시간
						var passList = [];
						var lane = [];
						for(var i = 0; i < subPath.length; i++){
							if(subPath[i].trafficType == 3){
								walkTime += subPath[i].sectionTime;
							} else {
								if(subPath[i].passStopList){
									passList.push(subPath[i].passStopList);
									if(subPath[i].lane[0].name){
										lane.push(subPath[i].lane[0].name);										
									} else if(subPath[i].lane[0].busNo) {
										lane.push(subPath[i].lane[0].busNo);
									}
								}
							}
						}
						
						var resultDiv = document.getElementById('search-road-result-div');
						var str = '<div class="route" id="'+searchLocation+'">';
							str += '<div>';
							str += '<b style="font-size: 20px;">'+searchLocation+'까지 '+'약 '+totalTime+'분</b>';
							str += '<div>'+formatDistance(totalDistance)+' | 도보'+walkTime+'분 | 환승';
							if(pathType == 1){
								str += subwayTransitCount-1+'회</div>';
							} else if(pathType == 2){
								str += busTransitCount-1+'회</div>';
							} else {
								str += subwayTransitCount+busTransitCount-1+'회</div>';
							}
							for(var i = 0; i < passList.length; i++){
								str += '<div>'+lane[i]+' | '+passList[i].stations[0].stationName+'>>>'+passList[i].stations[passList[i].stations.length - 1].stationName+'</div>';
								if(i != passList.length-1){
									str += '<div>|</div>';									
								}
							}
							str += '</div>';
							str += '<div class="route-close" onclick="removeRoute(\'' + searchLocation + '\')" style="cursor: pointer; width: 24px; height: 24px;"><img src="/dungjip/resources/img/icons/blackX.svg"></div>';
							str += '</div>';
							
						$('#search-road-result-div').append(str);
						
						document.getElementById("search-destination").value = "";
					}
				}
		    }
		}
	}
	
	function formatDistance(distanceInMeters) {
	    if (distanceInMeters >= 1000) {
	        return (distanceInMeters / 1000).toFixed(1) + "km";
	    } else {
	        return distanceInMeters + "m";
	    }
	}
</script>
<div class="col-md-8 single-property-content prp-style-1 " style="width: 1100px;">
<section class="product_description_area">
	<div class="container">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item"><a class="nav-link active" id="home-tab"
				data-toggle="tab" href="#home" role="tab" aria-controls="home"
				aria-selected="true">상세설명</a></li>

			<li class="nav-item"><a class="nav-link" id="profile-tab"
				data-toggle="tab" href="#profile" role="tab"
				aria-controls="profile" aria-selected="false">상세정보</a></li>
			<li class="nav-item" id="houseLikeList"><a class="nav-link" id="contact-tab"
				data-toggle="tab" href="#contact" role="tab"
				aria-controls="contact" aria-selected="false">비슷한 매물 보기</a></li>
			<li class="nav-item"><a class="nav-link active"
				id="review-tab" data-toggle="tab" href="#review" role="tab"
				aria-controls="review" aria-selected="false">Reviews</a></li>
		</ul>
		<div class="tab-content" id="myTabContent" style="background-color: #FFF;">
			<div class="tab-pane fade" id="home" role="tabpanel"
				aria-labelledby="home-tab" style="margin: 20px;">
				
				<p style="font-size: 35px;"><b>${house.houseTitle}</b></p> <br><span style="font-size: 20px;">${house.houseDetails}</span>
			</div>
			<div class="tab-pane fade" id="profile" role="tabpanel"
				aria-labelledby="profile-tab" style="background-color: #FFF;">
				<div class="table-responsive" style="margin: 20px;">
					<table class="table" id="houseDetail">
						<tbody>
							<tr>
								<td>
									<h5>주소</h5>
								</td>
								<td>
									<h5>${house.houseAddress}</h5>
								</td>
							</tr>										
							<tr>
								<td>
									<h5>집 가격 종류</h5>
								</td>
								<td>
								<c:choose>
									<c:when test="${house.houseStyle == '월세'}">
										<h5>월세</h5>
									</c:when>
									<c:otherwise>
										<h5>전세</h5>
									</c:otherwise>
								</c:choose>
								</td>
							</tr>
							<tr>
								<td>
									<h5>관리비</h5>
								</td>
								<td>
									<h5>${house.houseMaintainCost}만원</h5>
								</td>
							</tr>													
							<tr>
								<td>
									<h5>방종류</h5>
								</td>
								<td>
									<h5>${house.houseType}</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>해당층/건물층</h5>
								</td>
								<td>
									<h5>${house.houseFloor}층/${house.houseBuildingFloor}층</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>평수</h5>
								</td>
								<td>
									<h5>${house.houseSquare}평</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>입주가능일</h5>
								</td>
								<td>
								<c:choose>
									<c:when test="${house.houseDoItNow == 'Y'}">
										<h5>즉시 입주</h5>
									</c:when>
									<c:otherwise>
										<h5>즉시 입주 불가</h5>
									</c:otherwise>
								</c:choose>
								</td>
							</tr>
							<tr>
								<td>
									<h5>준공 시기</h5>
								</td>
								<td>
									<h5 id="houseBuildDate"></h5>
								</td>
							</tr>							
							<tr>
								<td>
									<h5>최초등록일</h5>
								</td>
								<td>
									<h5>${house.houseUploadTime}</h5>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<script>
				var hDate = "${house.houseBuildDate}";
					if(hDate.length > 10){
						hDate = hDate.substr(0, 10);
					}
					$("#houseBuildDate").text(hDate);
				</script>
			</div>
			<div class="tab-pane fade" id="contact" role="tabpanel"
				aria-labelledby="contact-tab">
				<div class="row">
					<div class="col-lg">
						<div class="properties-area recent-property" style="background-color: #FFF;">
							<div class="container">
								<div class="row  pr0 padding-top-40 properties-page">
								<div class="col-md-12  clear">
									<div class="col-xs-10 page-subheader sorting pl0">
										<div class="items-per-page">
											<div class="sel">
											</div>
										</div>
									</div>

									<div class="col-xs-2 layout-switcher">
										<a class="layout-list" href="javascript:void(0);"> 
										<i class="fa fa-th-list"></i>
										</a> 
										<a class="layout-grid active" href="javascript:void(0);">
											<i class="fa fa-th"></i>
										</a>
									</div>
								</div>
								<div class="col-md-12 clear">
									<div id="list-type" class="proerty-th">
											<div id="houseImgLikeList">
											<!-- 비슷한 매물 -->
											</div>
									</div>
								</div>
								<div class="col-md-12 clear text-right center"> 
                                   <div id="pagingArea">
                                       <div class="pagination"id="paginationList">
                                           <ul>
                                           <!-- 여기에 페이징 숫자를 추가 -->
                                           </ul>
                                       </div>    
                             	  </div>
                               </div>								
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
<div class="tab-pane fade show active" id="review" role="tabpanel"
	aria-labelledby="review-tab">
	<div class="row">
		<div class="col-lg">
			<div class="row total_rate" style="display: flex;">
				<div class="col-6" style="flex: 1">
					<div class="box_total">
						<br>
						<h3
							style="text-align: center; font-weight: bold; margin: 20px 0 0 0;">Overall</h3>

						<h1
							style="text-align: center; color: #D27E04; font-weight: bold; margin: 0;">4.0</h1>

						<h5 style="text-align: center;">(03 Reviews)</h5>
					</div>
					</div>
					<div class="col-6" style="flex: 1">
						<div class="rating_list" style="margin-top: 25px;">
							<h5 style="text-align: left;">Based on 3 Reviews</h5>
							<ul class="list" style="padding: 0;">
								<li><a href="#" id="num">5 Star <i
										class="fa fa-star"></i><i class="fa fa-star"></i><i
										class="fa fa-star"></i><i class="fa fa-star"></i><i
										class="fa fa-star"></i> 01
								</a></li>
								<li><a href="#" id="num">4 Star <i
										class="fa fa-star"></i><i class="fa fa-star"></i><i
										class="fa fa-star"></i><i class="fa fa-star"></i><i
										class="fa fa-star"></i> 01
								</a></li>
								<li><a href="#" id="num">3 Star <i
										class="fa fa-star"></i><i class="fa fa-star"></i><i
										class="fa fa-star"></i><i class="fa fa-star"></i><i
										class="fa fa-star"></i> 01
								</a></li>
								<li><a href="#" id="num">2 Star <i
										class="fa fa-star"></i><i class="fa fa-star"></i><i
										class="fa fa-star"></i><i class="fa fa-star"></i><i
										class="fa fa-star"></i> 01
								</a></li>
								<li><a href="#" id="num">1 Star <i
										class="fa fa-star"></i><i class="fa fa-star"></i><i
										class="fa fa-star"></i><i class="fa fa-star"></i><i
										class="fa fa-star"></i> 01
								</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="review_list">
					<div class="review_item">
						<div class="media">
							<div class="d-flex">
								<img src="resources/img/product/review-1.png" alt="">
							</div>
							<div class="media-body">
								<h4>Blake Ruiz</h4>
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i>
							</div>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing
							elit, sed do eiusmod tempor incididunt ut labore et dolore
							magna aliqua. Ut enim ad minim veniam, quis nostrud
							exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
					</div>
					<div class="review_item">
						<div class="media">
							<div class="d-flex">
								<img src="resources/img/product/review-2.png" alt="">
							</div>
							<div class="media-body">
								<h4>Blake Ruiz</h4>
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i>
							</div>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing
							elit, sed do eiusmod tempor incididunt ut labore et dolore
							magna aliqua. Ut enim ad minim veniam, quis nostrud
							exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
					</div>
					<div class="review_item">
						<div class="media">
							<div class="d-flex">
								<img src="resources/img/product/review-3.png" alt="">
							</div>
							<div class="media-body">
								<h4>Blake Ruiz</h4>
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i>
							</div>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing
							elit, sed do eiusmod tempor incididunt ut labore et dolore
							magna aliqua. Ut enim ad minim veniam, quis nostrud
							exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	</section>
</div>
</div>
<!-- Footer area-->


	<script src="resources/assets/js/modernizr-2.6.2.min.js"></script>
	<script src="resources/assets/js/jquery-1.10.2.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/js/bootstrap-select.min.js"></script>
	<script src="resources/assets/js/bootstrap-hover-dropdown.js"></script>
	<script src="resources/assets/js/easypiechart.min.js"></script>
	<script src="resources/assets/js/jquery.easypiechart.min.js"></script>
	<script src="resources/assets/js/owl.carousel.min.js"></script>
	<script src="resources/assets/js/wow.js"></script>
	<script src="resources/assets/js/icheck.min.js"></script>
	<script src="resources/assets/js/price-range.js"></script>
	<script type="text/javascript"
		src="resources/assets/js/lightslider.min.js"></script>
	<script src="resources/assets/js/main.js"></script>
	
	<script>
	<!-- 페이징바 -->
    $(document).ready(function() {
        var currentPage = 1; // currentPage 변수를 정의하고 초기화
        // 페이지 번호 클릭 이벤트 핸들러 등록
        $(document).on("click", ".page-link", function() {
            var pageClicked = $(this).text(); // 클릭한 페이지 번호를 가져옴
            if (pageClicked === "Prev") {
                currentPage--;
            } else if (pageClicked === "Next") {
                currentPage++;
            } else {
                currentPage = parseInt(pageClicked); // 클릭한 페이지 번호로 설정
            }
            loadPage(currentPage); // 수정된 currentPage 값을 loadPage 함수에 전달
        });
     	//초기 페이지 로드
        loadPage(currentPage); // 초기 페이지 로드 시 currentPage 값을 전달
    });        
    
    function loadPage(currentPage) {
    	var houseAddress = "${house.houseAddress}"
        $.ajax({
            url: "houseLikeList.ho",
            data: {
            	houseAddress : houseAddress,
                currentPage: currentPage // 수정된 currentPage 값을 전달
            },
            success: function(data) {
            	houseLikeList(data.houseLike, data.houseImgLike);
            	Pagination(data.pi, houseAddress);
            },
            error: function() {
                console.log("매물리스트 실패");
            }
        });
    }
    
	<!-- 비슷한 매물 찾기 -->
	function houseLikeList(houseLike,houseImgLike){
			var str = "";
		for (var i = 0; i < houseLike.length; i++){
			str +=  '<div class="col-sm-6 col-md-3 p0">'
				+   '<div class="box-two proerty-item">'
				+	'<div class="item-thumb">'
				+	'<a href="detail.ho?houseNo='+houseLike[i].houseNo+'">'
				+	'<img src="'+houseImgLike[i].changeName+'" style="width:100%;height:250px;"> </a>'
				+	'</div>'
				+	'<div class="item-entry overflow">'	
				+	'<h5>'
				+	'<a href="detail.ho?houseNo='+houseLike[i].houseNo+'"><p style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;word-break:break-all;">'+houseLike[i].houseName+ '</p> </a>'
				+	'</h5>'
				+	'<div class="dot-hr"></div>'
				+	'<span class="pull-left"><b> 평수 :</b> '+houseLike[i].houseSquare+'평</span><br>';
				if(houseLike[i].houseStyle == '월세'){
			str +=	'<span class="proerty-price pull-right" style="color:black;">'+houseLike[i].housePrice+'/'+houseLike[i].houseRent+'만원</span>';
				}else{
			str += '<span class="proerty-price pull-right" style="color:black;">'+houseLike[i].housePrice+'만원</span>';
				}
			str +=	'<p class="pDetail">'+houseLike[i].houseDetails+'</p>'
				+	'<div class="property-icon">'
				+	'<img src="resources/houseDetail/room.png" width="30px">&nbsp;'+houseLike[i].houseRooms+' &nbsp;&nbsp;' 
				+	'<img src="resources/houseDetail/Toilet.png" width="30px">&nbsp;'+houseLike[i].houseToilet+'&nbsp;&nbsp;';
				if(houseLike[i].houseParkAble == '0'){
			str +=	'<img src="resources/houseDetail/parking.png" width="30px">&nbsp;불가능&nbsp;&nbsp;';
				}else{
			str +=	'<img src="resources/houseDetail/parking.png" width="30px">&nbsp;가능&nbsp;&nbsp;';
				}
			str	+=	'</div> </div> </div> </div> </div>';
		}
			$('#houseImgLikeList').html(str);
	};
	
	function Pagination(pi, houseAddress) {
	    var html = '';
	    if (pi.currentPage > 1) {
	        html += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="loadPage(' + (pi.currentPage - 1) + ')">Prev</a></li>';
	    } else {
	        html += '<li class="page-item disabled"><span class="page-link">Prev</span></li>';
	    }

	    for (var p = pi.startPage; p <= pi.endPage; p++) {
	        html += '<li class="page-item ' + (p === pi.currentPage ? 'active' : '') + '">' +
	            '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + p + ')">' + p + '</a>' +
	            '</li>';
	    }

	    if (pi.currentPage < pi.maxPage) {
	        html += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="loadPage(' + (pi.currentPage + 1) + ')">Next</a></li>';
	    } else {
	        html += '<li class="page-item disabled"><span class="page-link">Next</span></li>';
	    }

	    $('#paginationList').html(html);
	}	
	
	
	</script>
	
	<script>
		$(document).ready(function() {

			$('#image-gallery').lightSlider({
				gallery : true,
				item : 1,
				thumbItem : 9,
				slideMargin : 0,
				speed : 500,
				auto : true,
				loop : true,
				onSliderLoad : function() {
					$('#image-gallery').removeClass('cS-hidden');
				}
			});
		});
	</script>

	<script>
		$(document).ready(function() {
			// Description 탭을 활성화
			$('#myTab a[href="#home"]').tab('show');
		});
	</script>
	
<script>
   function detailEstate(e){
	   location.href="detail.es?esNo="+e.id;
   }
</script>


	<%@ include file="../common/footer.jsp"%>

</body>
</html>
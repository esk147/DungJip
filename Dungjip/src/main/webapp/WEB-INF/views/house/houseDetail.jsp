<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html class="no-js">
<!--<![endif]-->
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
 .boxss{
 border: 1px solid #D27E04;
 padding: 5px 10px;
 margin-right: 5px;
 border-radius : 25px;
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

 .profile{
             width: 45px;
    		 height: 45px;
    		 border-radius: 50%;
             }
             
  .d-flex{
            display: flex;
    		align-items: center;
    	   justify-content: flex-start;
             }
    
    .info{
     display: flex;
    flex-direction: column;
    align-items: flex-start;
    margin: 10px 0 0 10px;
    }
    
    .nick{
    padding: 0px;
    margin: 0px;
    }
 
 .reviewPhoto{
 	padding-top : 10px;
 }
 
 .write{
 display: flex;
    justify-content: flex-end;
    padding-right: 40px;
}
 }
 
 /* 기본 이미지 스타일 */
.zoomable {
    transition: transform 0.3s ease, z-index 0s; /* 부드러운 확대/축소 효과 */
    cursor: pointer; /* 마우스 오버시 커서 변경 */
    z-index: 1; /* 기본 z-index 설정 */
    width:100px;
    height:100px;
}

/* 확대될 때 적용할 스타일 */
.zoomable.zoomed {
    transform: scale(2) translate(-50%, -50%); /* 이미지를 2배로 확대 및 가운데 정렬 */
    z-index: 1000; /* 다른 요소 위에 놓임 */
    position: fixed; /* 고정된 위치 */
    top: 50%; /* 상단에서부터 50%의 위치 */
    left: 50%; /* 좌측에서부터 50%의 위치 */
    transition: transform 0.3s ease, z-index 0s 0.3s; /* 확대/축소 및 z-index 변화 효과 지연 */
}

/* 확대된 이미지의 배경 */
.zoomable.zoomed::after {
    content: '';
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5); /* 어두운 배경 */
    cursor: default;
    z-index: -1; /* 이미지보다 아래에 위치 */
}

 

 
 .big{
 display: flex;
 align-items : center;
 flex-direction: row;
 }
 
 #photo{
 width:300px;
 height:300px;
 }
</style>
</head>
<body>
    <c:if test="${not empty alertMsg }">
        <script>
            var alertMsg = "${alertMsg}";
            alert(alertMsg);
        </script>
        <c:remove var="alertMsg" />
    </c:if>
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
	<!-- End page header -->

	<!-- property area -->
	<div class="content-area single-property"
		style="background-color: #FCFCFC;">
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
							<h1 class="property-title pull-left"  style="margin-bottom: 15px;"><b>상세보기</b></h1>
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
					<aside class="sidebar sidebar-property blog-asside-right">
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
                <!-- 추가적인 내용이 있다면 여기에 추가할 수 있습니다. -->
            </div>
        </div>
    </div>
</c:forEach>
</div>
		<div
			class="panel panel-default sidebar-menu wow fadeInRight animated">
			<div class="panel-heading">
				<h3 class="panel-title">Smart search</h3>
			</div>
			<div class="panel-body search-widget">
				<form action="" class=" form-inline">
					<fieldset>
						<div class="row">
							<div class="col-xs-12">
								<input type="text" class="form-control" placeholder="Key word">
							</div>
							</div>
							</fieldset>
							<fieldset>
								<div class="row">
									<div class="col-xs-6">

										<select id="lunchBegins" class="selectpicker"
											data-live-search="true" data-live-search-style="begins" title="Select Your City">
											<option>New york, CA</option>
											<option>Paris</option>
											<option>Casablanca</option>
											<option>Tokyo</option>
											<option>Marraekch</option>
											<option>kyoto , shibua</option>
										</select>
									</div>
									<div class="col-xs-6">
										<select id="basic"
											class="selectpicker show-tick form-control">
											<option>-Status-</option>
											<option>Rent</option>
											<option>Boy</option>
											<option>used</option>
										</select>
									</div>
								</div>
							</fieldset>
							<fieldset class="padding-5">
								<div class="row">
									<div class="col-xs-6">
										<label for="price-range">Price range ($):</label> <input
											type="text" class="span2" value="" data-slider-min="0"
											data-slider-max="600" data-slider-step="5"
											data-slider-value="[0,450]" id="price-range"><br />
										<b class="pull-left color">2000$</b> <b
											class="pull-right color">100000$</b>
									</div>
									<div class="col-xs-6">
										<label for="property-geo">Property geo (m2) :</label> <input
											type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5"
											data-slider-value="[50,450]" id="property-geo"><br/>
										<b class="pull-left color">40m</b> <b class="pull-right color">12000m</b>
									</div>
								</div>
							</fieldset>
							<fieldset class="padding-5">
								<div class="row">
									<div class="col-xs-6">
										<label for="price-range">Min baths :</label> 
										<input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5"
											data-slider-value="[250,450]" id="min-baths"><br/>
										<b class="pull-left color">1</b> 
										<b class="pull-right color">120</b>
									</div>

									<div class="col-xs-6">
										<label for="property-geo">Min bed :</label> <input
											type="text" class="span2" value="" data-slider-min="0"
											data-slider-max="600" data-slider-step="5"
											data-slider-value="[250,450]" id="min-bed"><br />
										<b class="pull-left color">1</b> 
										<b class="pull-right color">120</b>
									</div>
								</div>
							</fieldset>
							<fieldset class="padding-5">
								<div class="row">
									<div class="col-xs-6">
										<div class="checkbox">
											<label> <input type="checkbox" checked>
												Fire Place
											</label>
										</div>
									</div>

									<div class="col-xs-6">
										<div class="checkbox">
											<label> <input type="checkbox"> Dual Sinks
											</label>
										</div>
									</div>
								</div>
							</fieldset>

							<fieldset class="padding-5">
								<div class="row">
									<div class="col-xs-6">
										<div class="checkbox">
											<label> <input type="checkbox" checked>
												Swimming Pool
											</label>
										</div>
									</div>
									<div class="col-xs-6">
										<div class="checkbox">
											<label> <input type="checkbox" checked> 2
												Stories
											</label>
										</div>
									</div>
								</div>
							</fieldset>

							<fieldset class="padding-5">
								<div class="row">
									<div class="col-xs-6">
										<div class="checkbox">
											<label><input type="checkbox"> Laundry
												Room </label>
										</div>
									</div>
									<div class="col-xs-6">
										<div class="checkbox">
											<label> <input type="checkbox"> Emergency
												Exit
											</label>
										</div>
									</div>
								</div>
							</fieldset>

							<fieldset class="padding-5">
								<div class="row">
									<div class="col-xs-6">
										<div class="checkbox">
											<label> <input type="checkbox" checked>
												Jog Path
											</label>
										</div>
									</div>
									<div class="col-xs-6">
										<div class="checkbox">
											<label> <input type="checkbox"> 26'
												Ceilings
											</label>
										</div>
									</div>
								</div>
							</fieldset>

							<fieldset class="padding-5">
								<div class="row">
									<div class="col-xs-12">
										<div class="checkbox">
											<label> <input type="checkbox"> Hurricane
												Shutters
											</label>
										</div>
									</div>
								</div>
							</fieldset>

							<fieldset>
								<div class="row">
									<div class="col-xs-12">
										<input class="button btn largesearch-btn" value="Search"
											type="submit">
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
		</aside>
	</div>
</div>
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
							style="text-align: center; color: #D27E04; font-weight: bold; margin: 0;"></h1>

						<h5 style="text-align: center;"></h5>
					</div>
					</div>
					<div class="col-6" style="flex: 1">
						<div class="rating_list" style="margin-top: 25px;" id="count">
							<h5 style="text-align: left;"></h5>
							<ul class="list" style="padding: 0;">
								<li><a href="#" id="num">건물 <i
										class="fa fa-star"></i><i class="fa fa-star"></i><i
										class="fa fa-star"></i><i class="fa fa-star"></i><i
										class="fa fa-star"></i> 
								</a></li>
								<li><a href="#" id="num">교통 <i
										class="fa fa-star"></i><i class="fa fa-star"></i><i
										class="fa fa-star"></i><i class="fa fa-star"></i><i
										class="fa fa-star"></i> 
								</a></li>
								<li><a href="#" id="num">내부 <i
										class="fa fa-star"></i><i class="fa fa-star"></i><i
										class="fa fa-star"></i><i class="fa fa-star"></i><i
										class="fa fa-star"></i> 
								</a></li>
								<li><a href="#" id="num">치한 <i
										class="fa fa-star"></i><i class="fa fa-star"></i><i
										class="fa fa-star"></i><i class="fa fa-star"></i><i
										class="fa fa-star"></i>
								</a></li>
								<li><a href="#" id="num">생활 <i
										class="fa fa-star"></i><i class="fa fa-star"></i><i
										class="fa fa-star"></i><i class="fa fa-star"></i><i
										class="fa fa-star"></i> 
								</a></li>
							</ul>
							
						</div>
					</div>
				</div>
					<div class="write">
					<input type="hidden" id="houseNo" value="${house.houseNo }" >
					<button onclick="insertResidentReview(this);">리뷰 작성</button>
					<input type="hidden" id="loginUserNo" value="${loginUser != null ? loginUser.userNo : null}" />
					</div>
				<div class="review_list">
					<!-- 리뷰 내용 -->
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	</section>
</div>
</div>

		<script>
		console.log("사용자 번호: " + '${loginUser != null ? loginUser.userNo : "null"}');

		function insertResidentReview(el){
			var loginUser = document.getElementById('loginUserNo').value;
			if(loginUser == ''){
				alert("로그인이 필요합니다. 로그인 페이지로 이동합니다.");
				location.href="login.be";
		
			}else{
				
			var houseNo = $(el).siblings('#houseNo').val();
			console.log("리뷰 넘어가는 집번호: "+houseNo);
			window.location.href = "/dungjip/insert.rere?houseNo="+houseNo;
			}
		}
		</script>



		<script>
			function selectResidentReview(){
				console.log(${house.houseNo});
				
				$.ajax({
					url:"resi.re",
					data: {houseNo:"${house.houseNo}" },
					success: function(result){
						console.log("거주자 리뷰 통신 성공");
						
						var avg = (result.sum /result.count).toFixed(2);
						
						for(var i = 0; i < result.rlist.length; i++) {
						    var stars = "";
						    
						    for(var j = 0; j < result.rlist[i].total; j++) {
						        stars += "<i class='fa fa-star'></i> ";
						    }
						    
						    var positiveKeywords = result.rlist[i].positiveKeywords.split(", "); // 쉼표와 공백으로 문자열 분리
						    var positiveDivs = ""; // 각 키워드를 위한 div를 저장할 변수

						    for(var k = 0; k < positiveKeywords.length; k++) {
						        positiveDivs += "<div class='boxss'>" + positiveKeywords[k] + "</div>"; // 각 키워드를 div로 감싸기
						    }
						    
						    var negativeKeywords = result.rlist[i].negativeKeywords.split(", "); // 쉼표와 공백으로 문자열 분리
						    var negativeDivs = ""; // 각 키워드를 위한 div를 저장할 변수

						    for(var m = 0; m < negativeKeywords.length; m++) {
						    	negativeDivs += "<div class='boxss'>" + negativeKeywords[m] + "</div>"; // 각 키워드를 div로 감싸기
						    }
						    
						    var reviewItem = "<div class='review_item'>" +
						        "<div class='media'>" +
						            "<div class='d-flex'>" +
						                "<div>" +
						                    "<img class='profile' src='"+result.rlist[i].member.changeName+"' alt=''>" +
						                "</div>" +
						                "<div class='info'>" +
						                    "<h5 class='nick'>" + result.rlist[i].member.userNickName + "</h5>" +
						                    "<span>"+result.rlist[i].member.gender+' ' +result.rlist[i].member.age+'세'+"</span>" +
						                "</div>" +
						            "</div>" +
						            "<span>" + result.rlist[i].reCreateDate + "</span>" +
						            "<div class='media-body'>" + stars + "</div>" +
						        "</div>" +
						        "<h6>장점</h6>" +
						        "<p>" + result.rlist[i].reAdContent + "</p>" +
						        "<div class='big'>" +
						        positiveDivs+
						        "</div>" +
						        "<h6>단점</h6>" +
						        "<p>" + result.rlist[i].reDisContent + "</p>" +
						        "<div class='big'>" +
						            
						            negativeDivs+
						        "</div>" +
						        "<div class='reviewPhoto'>" +
						            "<div class='reviewPhotoWrap'>" +
						                "<img id='photo' class='zoomable' src='"+result.rlist[i].reviewImg.changeName+"' alt=''>" +
						            "</div>" +
						        "</div>" +
						        "<hr>" +
						    "</div>";

						    $(".review_list").append(reviewItem);
						    
						    
						   
						

						console.log("---------리스트 확인---------");
						console.log(result);
						console.log("---------확인---------");
						console.log(result.rlist[i].positiveKeywords);
						
						$(".box_total h5").text("("+result.count+" Reviews)");
				    	$("#count h5").text("Based on "+result.count+" Reviews");
				        $(".box_total h1").text(avg);
						
					
						}
					
						
					},error: function(){
						console.log("거주자 리뷰 통신 실패");
					}
				});
			}
			
			 
            $(function(){
            	selectResidentReview();
            });
			</script>

			<script>
	document.addEventListener('DOMContentLoaded', function() {
	    document.querySelectorAll('.zoomable').forEach(img => {
	        img.addEventListener('click', function() {
	            this.classList.toggle('zoomed'); // 'zoomed' 클래스 토글
	        });
	    });
	});


	</script>
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
				+	'<a href="detail.ho?houseNo='+houseLike[i].houseNo+'"><p style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;word-break:break-all;">'+houseLike[i].houseTitle+ '</p> </a>'
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
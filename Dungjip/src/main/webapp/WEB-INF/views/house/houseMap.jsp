<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Zigbang Map Page Replica</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'Noto Sans KR', sans-serif;
            background: #fff;
        }

        .header {
            background-color: #ffce00;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: absolute;
            margin: 20px 0 0 20px;
            z-index: 999;
        }

        .header img {
            width: 100px; /* Placeholder for logo size */
        }

        .header .search-container {
            flex-grow: 1;
            margin: 0 20px;
        }

        .header input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-right: 10px;
            border: 1px solid #ddd;
        }
        
        .inputWrap {
		    position: relative;
		    height: 50px;
		    display: inline-block;
		 }
		  
		.inputWrap input {
		  padding-right: 30px;
		  height: inherit;
		}
		
		.inputWrap .btnClear {
		  position: absolute;
		  top: 0;
		  right: 0;
		  width: 30px;
		  height: inherit;
		  background: url(https://img.icons8.com/pastel-glyph/2x/cancel.png) center center no-repeat;
		  background-size: 50%;
		  border: none;
		  outline: none;
		  cursor: pointer;
		}
        
        
        #searchIcon {
        	cursor: pointer;
        }

        .main-container {
            display: flex;
        }

        .sidebar {
            background: #f4f4f4;
            overflow-y: auto;
            height: 600px; /* Matching height with map container */
            padding: 20px;
        }

        .listing {
            display: flex;
            background: #fff;
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #ddd;
        }

        .listing img {
            height: 120px;
            margin-right: 10px;
        }

        .footer {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
        }
        
        .listing {
        	cursor:pointer;
        }
    </style>
</head>

<body>
	<%@ include file="../common/header.jsp"%>
	
	<script>
	    var clearInput = function(obj) {
	        obj.parentNode.querySelector('input').value = ""
	    }
	</script>
	
    <header class="header">
        <div class="inputWrap">
            <input type="text" id="searchLocation" placeholder="지역, 지하철역, 학교 검색">
            <button class="btnClear" onClick="clearInput(this)"></button>
        </div>
        <img src="https://placehold.co/100x50" alt="Placeholder for Zigbang logo" id="searchIcon" onclick="searchLocate()">
    </header>

    <div class="main-container">
        <div id="map" class="map-container" style="width:100%; height: 600px;">
        
        </div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c9d3f1c90fc1cea85b8bb8303f360c81&libraries=services,clusterer,drawing"></script>
		<script>
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(37.533067592513866, 126.89622037964806), //지도의 중심좌표.
				level: 6 //지도의 레벨(확대, 축소 정도)
			};
		
			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			
			 var positions = [
				<c:forEach var="house" items="${lList}" varStatus="status">
				{
					title: '${house.houseTitle}',
					latlng: new kakao.maps.LatLng('${house.houseLatitude}','${house.houseLongitude}'),
					houseNo: '${house.houseNo}'
				}<c:if test="${!status.last}">,</c:if>
				</c:forEach>
			];
			
			 var geocoder = new kakao.maps.services.Geocoder();
			 
			 geocoder.addressSearch('${locate}', function(result, status) {
				 
				     if (status === kakao.maps.services.Status.OK) {

				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

				        map.setCenter(coords);
				    } 
				}); 
			 
			 function searchLocate(){
				 var ps = new kakao.maps.services.Places(); 
				 var searchLocation = document.getElementById("searchLocation").value;
				 console.log(searchLocation);

				// 키워드로 장소를 검색합니다
				ps.keywordSearch(searchLocation, placesSearchCB); 

				// 키워드 검색 완료 시 호출되는 콜백함수 입니다
				function placesSearchCB (data, status, pagination) {
				    if (status === kakao.maps.services.Status.OK) {

				        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				        // LatLngBounds 객체에 좌표를 추가합니다
				        var bounds = new kakao.maps.LatLngBounds();

				        for (var i=0; i<data.length; i++) {
				            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
				        }       

				        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				        map.setBounds(bounds);
				    } 
				}
			 }
			 
			 
			 var clusterer = new kakao.maps.MarkerClusterer({
			        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
			        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
			        minLevel: 3, // 클러스터 할 최소 지도 레벨
			        disableClickZoom: true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
			    });
			
			 var markers = positions.map(function(position, i) {
		            return new kakao.maps.Marker({
		                position : position.latlng
		            });
		        });
			 
		     // 클러스터러에 마커들을 추가합니다
		     clusterer.addMarkers(markers);
		     
		     $(document).ready(function(){
		    	 
		    	 for(var i = 0; i < positions.length; i++){
					 var infowindow = new kakao.maps.InfoWindow({
						 content: '<div style="width:110%;padding:5px;z-index:1;">' + positions[i].title + '</div>'
					 })
					 var mark = markers[i];
				     var itemEl = document.getElementById(positions[i].houseNo);
				     
					 itemEl.addEventListener('mouseover', makeOverListener(map, mark, infowindow));
					 
					 
					 itemEl.addEventListener('mouseout', makeOutListener(infowindow));

				 }
		     })
		     
		     for(var i = 0; i < positions.length; i++){
					 var infowindow = new kakao.maps.InfoWindow({
						 content: '<div style="width:110%;padding:5px;z-index:1;">' + positions[i].title + '</div>'
					 })
					 var mark = markers[i];
				     var itemEl = document.getElementById(positions[i].houseNo);
					 
					 kakao.maps.event.addListener(mark, 'mouseover', makeOverListener(map, mark, infowindow));
					 kakao.maps.event.addListener(mark, 'mouseout', makeOutListener(infowindow));
					 
				 }
			 
			 
			 
			 function makeOverListener(map, mark, infowindow) {
				    return function() {
				        infowindow.open(map, mark);
				    };
				}

				// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
				function makeOutListener(infowindow) {
				    return function() {
				        infowindow.close();
				    };
				}

		        	        
		        kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {

		            // 현재 지도 레벨에서 1레벨 확대한 레벨
		            var level = map.getLevel()-1;

		            // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
		            map.setLevel(level, {anchor: cluster.getCenter()});
		        });
		        
		        var showInfomation = new kakao.maps.InfoWindow({zIndex:1});
		    	function showInfo(e){
		    		console.log(e);
		    		var content = '<div style="padding:5px;z-index:1;">' + e.innerText + '</div>';

		    		showInfomation.setContent(content);
		    		showInfomation.open(map, marker); 
		    	}
		    	function deleteShowInfo(e){
		    		showInfomation.close();
		    	}
		</script>

        <div class="sidebar">
        <c:forEach var="home" items="${lList}" varStatus="status">
            <div class="listing" id="${home.houseNo }" onclick="detailHouse(this)">
                <img src="https://placehold.co/200x150" alt="Placeholder for real estate image">
                <p>${home.houseTitle }</p>
            </div>
        </c:forEach>
        </div>
    </div>
    <script>
    	function detailHouse(e){
    		location.href="detail.ho?houseNo="+e.id;
    	}
    </script>
    
	<%@ include file="../common/footer.jsp"%>
</body>

</html>
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

        .main-container {
            display: flex;
        }

        .map-container {
            flex-grow: 1;
            height: 600px;
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
    </style>
</head>

<body>
	<%@ include file="../common/header.jsp"%>
	
	<script>
	
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.533067592513866, 126.89622037964806), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
	
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	</script>
    <header class="header">
        <div class="search-container">
            <input type="text" placeholder="지역, 지하철역, 학교 검색">
        </div>
        <img src="https://placehold.co/100x50" alt="Placeholder for Zigbang logo">
    </header>

    <div class="main-container">
        <div id="map" class="map-container">
            <!-- Map would be implemented here -->
        </div>
        <div class="sidebar">
            <!-- Random values for sidebar listings -->
            <div class="listing">
                <img src="https://placehold.co/200x150" alt="Placeholder for real estate image">
                <p>서울시 강남구 아파트 2억 6300만원</p>
            </div>
            <div class="listing">
                <img src="https://placehold.co/200x150" alt="Placeholder for real estate image">
                <p>서울시 송파구 빌라 3억 3500만원</p>
            </div>
            <div class="listing">
                <img src="https://placehold.co/200x150" alt="Placeholder for real estate image">
                <p>서울시 송파구 빌라 3억 3500만원</p>
            </div>
            <div class="listing">
                <img src="https://placehold.co/200x150" alt="Placeholder for real estate image">
                <p>서울시 송파구 빌라 3억 3500만원</p>
            </div>
            <div class="listing">
                <img src="https://placehold.co/200x150" alt="Placeholder for real estate image">
                <p>서울시 송파구 빌라 3억 3500만원</p>
            </div>
            <div class="listing">
                <img src="https://placehold.co/200x150" alt="Placeholder for real estate image">
                <p>서울시 송파구 빌라 3억 3500만원</p>
            </div>
            <div class="listing">
                <img src="https://placehold.co/200x150" alt="Placeholder for real estate image">
                <p>서울시 송파구 빌라 3억 3500만원</p>
            </div>
        </div>
    </div>
    
	<%@ include file="../common/footer.jsp"%>
</body>

</html>
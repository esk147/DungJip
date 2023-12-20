<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
      * {
        box-sizing: border-box;
      }

      body {
        margin: 0;
        font-family: "Noto Sans KR", sans-serif;
      }

      .search-bar {
        background: url("https://placehold.co/1400x300") no-repeat center center;
        background-size: cover;
        display: flex;
        justify-content: center;
        flex-direction: column;
        height: 400px;
        padding: 20px;
        text-align: center;
        color: #fff;
      }

      .search-bar-title {
        font-size: 40px;
        font-weight: bold;
        margin-bottom: 40px;
      }

      .search-bar-input {
        width: 100%;
        height: 60px;
        display: flex;
        justify-content: center;
      }

      .search-bar input {
        width: 560px;
        border-radius: 8px 0 0 8px;
        font-size: 16px;
        padding-left: 15px;
        border: none;
      }

      .search-bar button {
        padding: 10px;
        width: 80px;
        font-size: 16px;
        background-color: #ff6600;
        color: white;
        border-radius: 0 8px 8px 0;
        border: none;
        cursor: pointer;
      }

      .main-content {
        display: flex;
        margin: 20px;
      }

      .card {
        background: #fff;
        display: flex;
        flex-direction: column;
        flex: 1;
        margin-bottom: 20px;
        padding: 20px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      }

      .card img {
        max-width: 100%;
        height: auto;
      }

    </style>
</head>
<body>
	<%@ include file="common/header.jsp"%>
	<%@ include file="common/chatbot.jsp"%>
	<script>
		$.ajax({
			url:"select.location",
			success: function(result){
				var str = "";
				for(var i = 0; i < result.length; i++){
					str += '<option value="'+result[i].houseAddress+'"/>'
				}
				$("#locations").html(str);
			},error:function(){
				console.log("통신 에러");
			}
		})
    
		$("#goChat").click(function(){
			location.href="websocket/ask";
			
			
		});
	</script>
	<div class="search-bar">
      <div class="search-bar-title">어떤 집을 찾고 계세요?</div>
      <div class="search-bar-input">
        <input type="text" list="locations" id="locationInput" placeholder="검색어를 입력하세요" />
        <datalist id="locations">
        	
        </datalist>
        <button onclick="moveToMap();">검색</button>
      </div>
    </div>
    
    <script>
    	function moveToMap(){
        	const locationValue = document.getElementById('locationInput').value;

        	location.href="villa.map?locate="+locationValue;
    	}
    </script>

    <div class="main-content">
      <div class="card">
        <img
          src="https://placehold.co/200x200"
          alt="Placeholder image representing an advertisement"
        />
        <p>광고 공간</p>
      </div>
      <div class="card">
        <button>
          <a href="websocket/ask?estateUserNo=6"><!-- 각 부동산의 사용자 순번을 넣을거다 --><!-- 부동산 상세페이지가 아직 구현이 안돼서 해두었습니다 -->
        <img
          src="https://placehold.co/200x200"
          alt="Placeholder image representing an advertisement"
        />
      </a>
      </button>
        <p>채팅 임시 확인 버튼</p>
      </div>
      <div class="card">
        <img
          src="https://placehold.co/200x200"
          alt="Placeholder image representing an advertisement"
        />
        <p>광고 공간</p>
      </div>
      <div class="card">
        <img
          src="https://placehold.co/200x200"
          alt="Placeholder image representing an advertisement"
        />
        <p>광고 공간</p>
      </div>
    </div>
	<%@ include file="common/footer.jsp"%>
</body>
</html>
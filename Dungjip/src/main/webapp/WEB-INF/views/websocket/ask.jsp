<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=
    , initial-scale=1.0">
<title>Document</title>
<!-- 제이쿼리 등록 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 구글 폰트 등록 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

</head>
<style>
* {
	box-sizing: border-box;
	font-family: 'Noto sans KR', sans-serif;
}

body {
	background-color: #abd9e9;
}

#container {
	width: 1800px;
	height: 815px;
	background: #eff3f7;
	margin: 0 auto;
	font-size: 0;
	border-radius: 5px;
	overflow: hidden;
}

aside {
	width: 600px;
	height: 800px;
	background-color: #3b3e49;
	display: inline-block;
	font-size: 15px;
	vertical-align: top;
}

main {
	width: 1200px;
	height: 800px;
	display: inline-block;
	font-size: 15px;
	vertical-align: top;
}

aside header {
	padding: 30px 20px;
}

aside input {
	width: 100%;
	height: 50px;
	line-height: 50px;
	padding: 0 50px 0 20px;
	background-color: #5e616a;
	border: none;
	border-radius: 3px;
	color: #fff;
	background-image:
		url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_search.png);
	background-repeat: no-repeat;
	background-position: 510px;
	background-size: 55px;
}

aside input::placeholder {
	color: #fff;
	font-size: 20px;
}

aside ul {
	padding-left: 0;
	margin: 0;
	list-style-type: none;
	overflow-y: scroll;
	height: 690px;
}

aside li {
	padding: 10px 0;
}

aside li:hover {
	background-color: #5e616a;
}

h2, h3 {
	margin: 0;
}

aside li img {
	border-radius: 50%;
	margin-left: 20px;
	margin-right: 8px;
}

aside li div {
	display: inline-block;
	vertical-align: top;
	margin-top: 12px;
}

aside li h2 {
	font-size: 14px;
	color: #fff;
	font-weight: normal;
	margin-bottom: 5px;
}

aside li h3 {
	font-size: 12px;
	color: #7e818a;
	font-weight: normal;
}

.status {
	width: 8px;
	height: 8px;
	border-radius: 50%;
	display: inline-block;
	margin-right: 7px;
}

.green {
	background-color: #58b666;
}

.orange {
	background-color: #ff725d;
}

.blue {
	background-color: #6fbced;
	margin-right: 0;
	margin-left: 7px;
}

main header {
	height: 110px;
	padding: 30px 20px 30px 40px;
}

main header>* {
	display: inline-block;
	vertical-align: top;
}

main header img:first-child {
	border-radius: 50%;
}

main header img:last-child {
	width: 24px;
	margin-top: 8px;
}

main header div {
	margin-left: 10px;
	margin-right: 145px;
}

main header h2 {
	font-size: 16px;
	margin-bottom: 5px;
}

main header h3 {
	font-size: 14px;
	font-weight: normal;
	color: #7e818a;
}

#chat {
	padding-left: 0;
	margin: 0;
	list-style-type: none;
	overflow-y: scroll;
	height: 535px;
	border-top: 2px solid #fff;
	border-bottom: 2px solid #fff;
}

#chat li {
	padding: 10px 30px;
}

#chat h2, #chat h3 {
	display: inline-block;
	font-size: 13px;
	font-weight: normal;
}

#chat h3 {
	color: #bbb;
}

#chat .entete {
	margin-bottom: 5px;
}

#chat .message {
	padding: 20px;
	color: #fff;
	line-height: 25px;
	max-width: 90%;
	display: inline-block;
	text-align: left;
	border-radius: 5px;
}

#chat .me {
	text-align: right;
}

#chat .you .message {
	background-color: #58b666;
}

#chat .me .message {
	background-color: #6fbced;
}

#chat .triangle {
	width: 0;
	height: 0;
	border-style: solid;
	border-width: 0 10px 10px 10px;
}

#chat .you .triangle {
	border-color: transparent transparent #58b666 transparent;
	margin-left: 15px;
}

#chat .me .triangle {
	border-color: transparent transparent #6fbced transparent;
	margin-left: 1090px;
}

main footer {
	height: 155px;
	padding: 20px 30px 10px 20px;
}

main footer textarea {
	resize: none;
	border: #ff725d;
	display: block;
	width: 100%;
	height: 80px;
	border-radius: 3px;
	padding: 20px;
	font-size: larger;
	margin-bottom: 13px;
}

main footer textarea::placeholder {
	font-size: larger;
}

main footer img {
	height: 30px;
	cursor: pointer;
}

main footer a {
	text-decoration: none;
	text-transform: uppercase;
	font-weight: bold;
	color: #6fbced;
	vertical-align: top;
	margin-left: 1020px;
	margin-top: 5px;
	display: inline-block;
}

aside ul::-webkit-scrollbar-track {
	background-color:; /* 스크롤바 트랙의 배경색 */
}

.active {
	background-color: #5e616a;
	/* or any color you prefer for the active state */
}
</style>

<body>
	<div id="container">
		<aside>
			<header>
				<input type="text" placeholder="search">
			</header>
			<ul>
				<c:choose>
					<c:when test="${not empty chatList}">
						<c:forEach items="${chatList}" var="chatRoom">
							<li onclick="whatEvent(this);" id="${member.userName }">
								<div>
									<input type="hidden" name="cno" value="${chatRoom.chatRoomNo}">
									<!-- 각 채팅방의 멤버에 대해 루프를 돌면서 userName을 표시 -->
									<c:forEach items="${chatRoom.members}" var="member">
										<div id="${member.userName }">
											<h2>&nbsp;&nbsp;&nbsp;&nbsp;${member.userName}</h2>
										</div>
										<c:choose>
											<c:when test="${member.active}">
												<h3>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="status green"></span>
													현재 활동중
												</h3>
											</c:when>

											<c:otherwise>
												<h3 id="logoutTime">
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="status orange"></span>
													<span>${member.calculateTimeAgo()}</span>
												</h3>
											</c:otherwise>
										</c:choose>

										<script>
						                 
									 
									 
               						 </script>

									</c:forEach>
								</div>
							</li>
						</c:forEach>
					</c:when>
					<c:otherwise>

						<h2 align="center">채팅방이 존재 하지 않습니다</h2>

					</c:otherwise>

				</c:choose>

			</ul>
		</aside>
		<main>
			<header>
				<div>
					<h2 id="otherUser">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="status orange"></span>
						offline

					</h2>
					<button onclick="connect();">연결</button>
					<button onclick="disconnect();">종료</button>

					<h3>부동산 소개 들어갈 자리입니다</h3>

				</div>
			</header>
			<ul id="chat">


			</ul>
			<footer>
				<span id="currentTyping"></span>
				<textarea placeholder="Type your message" id="sendChat"></textarea>
				<label for="inputFile"> <img
					src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_picture.png"
					alt="">
				</label> <!-- <input type="file" id="inputFile" style="display: none;" /> <a
					href="#" id="send" onclick="send();">Send</a> -->
			</footer>

		</main>
	</div>

</body>
<script>
/* $(document).ready(function() {
    $('#inputFile').change(function() {
        var fileName = $(this).val().split('\\').pop(); // 파일 경로에서 파일명만 추출

        // 파일명을 textarea의 placeholder로 설정
        $('#sendChat').text(fileName);
    });
}); */
/* $('#sendChat').on('keyup', function(){
	$("#currentTyping").html("입력중입니다");
}); */

//왼쪽 채팅방 리스트 클릭시 해당 하는방의 사람이 메인채팅방 이름에 뜬다.
 function whatEvent(e){
	$("#otherUser").text(e.lastElementChild.children[1].id);
} 
//엔터키 누르면 메세지  전송
$(document).keyup(function(event){
	if(event.which ===13){//keyup 이벤트의 13번쨰가  엔터 키이다.
		send();//13번째인 엔터키를 누르면 send(); 함수로 이동 
	}
});

var chatRoomNo; //전역변수 채팅방 설정. 웹소켓으로 보낼때 밑에서 클릭했을때 받아오는 채팅방 순번이 필요함(식별자)


//-------------------------------왼쪽 채팅방 클릭했을때 이전 대화내역 나오는함수-------------------------------------------------------

window.onload = function() {
    var firstLi = $('aside ul li:first');
    if (firstLi.length > 0) {
        firstLi.click();
    }
};


	// 사이드바의 부동산을 클릭할 때
	   $('aside ul li').click(function(){
	
		   $('aside ul li').removeClass('active');//원래 클릭된 배경 색깔을 지워주고

		    $(this).addClass('active');//새롭게 클릭된걸 다시 배경색깔을 바꿔준다
		    // 채팅방 리스트에서 해당 방을 클릭하면 클릭된 채팅방이 
		    //클릭된걸 알게 해주는 css 요소
		    
		   
		   //lastElementChild.children[1].id
	     // 클릭된 부동산의 인덱스를 가져옵니다
		chatRoomNo = $(this).find("input[name='cno']").val();//this는 li요소 find는 li 안에 있는 input[name='cno'] 이걸 가져온다
		console.log(chatRoomNo);
		console.log("클릭의 this입니다 : "+this);
		$.ajax({
			url: "../websocket/selectChatMsg.ch",
			method:"POST",
			data :{cno : chatRoomNo},
			
			success:function(chatRoomMsg){
				var chatHtml = "";
				console.log(chatRoomMsg);
				if(chatRoomMsg !=""){
				for (var i in chatRoomMsg){
			if("${loginUser.userNo}" == chatRoomMsg[i].userNo){
				chatHtml += "<li class='me'>"+
		        "<div class='entete'>" +
		        "<h3>" + chatRoomMsg[i].sendMessageTime + "</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
		        "<h2>" + chatRoomMsg[i].userName + "</h2>" +
		        "<span class='status blue'></span>" +
		        "</div>" +
		        "<div class='triangle'></div>" +
		        "<div class='message'>" +
		        chatRoomMsg[i].contentMessage +
		        "</div>" +
		        "</li>";

	    	$("#chat").html(chatHtml);	
				
			}else{
				  chatHtml += "<li class='you'>"+
			        "<div class='entete'>" +
			        "<h3>" + chatRoomMsg[i].sendMessageTime + "</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
			        "<h2>" + chatRoomMsg[i].userName + "</h2>" +
			        "<span class='status blue'></span>" +
			        "</div>" +
			        "<div class='triangle'></div>" +
			        "<div class='message'>" +
			        chatRoomMsg[i].contentMessage +
			        "</div>" +
			        "</li>";
			
				  $("#chat").html(chatHtml);
				  
			}
				
				}
				}else{
					chatHtml = "";
					$("#chat").html(chatHtml);
				}
			$("#chat").scrollTop($("#chat").prop('scrollHeight'));//채팅을 최신순으로 내려주는 작업
			
			},
			error: function(xhr, status, error) {
		        console.log(xhr.responseText); // 에러 응답 데이터 확인
		        console.log(error); // 에러 상세 정보 확인
			}
			
		});
	
		
	   });

   //------------------------------------웹소켓------------------------------------------------------------------------
  
		//웹소켓 접속 함수 
		var socket; //소켓담아놓을 변수 (접속과 종료 함수가 다르기 때문에 전역변수에 담아두고 사용한다)
		
		//연결함수(접속)
		function connect(){
			//접속경로를 담아 socket을 생성한다.
			
			 console.log("url 집어넣기전 :"+chatRoomNo);
			var url = "ws://localhost:9999/dungjip/ask?chatRoomNo="+chatRoomNo;
			// "ws://192.168.150.140:9999/dungjip/ask?chatRoomNo="+chatRoomNo;
			socket = new WebSocket(url);
			
			
			
			//연결이 되었을때
			socket.onopen = function(){
				console.log("연결 성공");
				console.log(url);
		
			};
			//연결이 종료됐을때
			socket.onclose = function(){
				console.log("연결 종료");
				
			};
			//에러가 발생했을때
			socket.onerror = function(e){
				console.log("에러가 발생했습니다.");
				console.log(e);
			}
	
			socket.onmessage = function(event) {
					//JSON.parse(event.data) 에 대한 설명 
					// 컨트롤러에서 JSON을 toString 화 시켜서 보냈습니다
					//parse를 써서 String을 다시 객체화 시켜줬습니다
					var chatHtml= "";
					 if (event.data instanceof ArrayBuffer) {
					        // 바이너리 데이터 처리
					        var arrayBuffer = event.data;
					        // 예: 이미지를 표시
					        var blob = new Blob([arrayBuffer]);
					        var url = URL.createObjectURL(blob);
					        $('#chat').append('<img src="' + url + '">');
					    }else{
					
			    var message = JSON.parse(event.data);
			    $("#currentTyping").html(message.typing);
				if("${loginUser.userNo}" == message.userNo){//현재 로그인되어있는 사용자순번과 채팅을 친 사용자 순번이 같을경우	
			     chatHtml += "<li class='me'>"+
			        "<div class='entete'>" +
			        "<h3>" + message.date + "</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
			        "<h2>" + message.userName + "</h2>" +
			        "<span class='status blue'></span>" +
			        "</div>" +
			        "<div class='triangle'></div>" +
			        "<div class='message'>" +
			        message.text +
			        "</div>" +
			        "</li>";

		    	$("#chat").append(chatHtml);

					}else{//다를경우(상대방이 보낸건 왼쪽 내가보낸건 오른쪽)
						  chatHtml += "<li class='you'>"+
					        "<div class='entete'>" +
					        "<h3>" + message.date + "</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
					        "<h2>" + message.userName + "</h2>" +
					        "<span class='status blue'></span>" +
					        "</div>" +
					        "<div class='triangle'></div>" +
					        "<div class='message'>" +
					        message.text +
					        "</div>" +
					        "</li>";
					
						  $("#chat").append(chatHtml);
					}
					    }
				$("#chat").scrollTop($("#chat").prop('scrollHeight'));//채팅을 최신순으로 내려주는 작업
			};
		}
		//접속종료 
		function disconnect(){
			socket.close();//소켓 닫기 
		}
		
		//메세지 전송


	
		function send(){
		var text = $("#sendChat").val();

			var data={
					cno : chatRoomNo,
					message : text
			};
	
				socket.send(JSON.stringify(data));
			
		$("#sendChat").val("");
	}
	     </script>


</html>
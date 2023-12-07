<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=
    , initial-scale=1.0">
    <title>Document</title>
    <!-- 제이쿼리 등록 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 구글 폰트 등록 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

</head>
<style>

*{
  box-sizing:border-box;
  font-family: 'Noto sans KR', sans-serif;
}
body{
  background-color:#abd9e9;

}
#container{
  width:1800px;
  height:800px;
  background:#eff3f7;
  margin:0 auto;
  font-size:0;
  border-radius:5px;
  overflow:hidden;
}
aside{
  width:600px;
  height:800px;
  background-color:#3b3e49;
  display:inline-block;
  font-size:15px;
  vertical-align:top;
}
main{
  width:1200px;
  height:800px;
  display:inline-block;
  font-size:15px;
  vertical-align:top;
}

aside header{
  padding:30px 20px;
}
aside input{
  width:100%;
  height:50px;
  line-height:50px;
  padding:0 50px 0 20px;
  background-color:#5e616a;
  border:none;
  border-radius:3px;
  color:#fff;
  background-image:url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_search.png);
  background-repeat:no-repeat;
  background-position:510px;
  background-size:55px;

}
aside input::placeholder{
  color:#fff;
  font-size: 20px;
}
aside ul{
  padding-left:0;
  margin:0;
  list-style-type:none;
  overflow-y:scroll;
  height:690px;
}
aside li{
  padding:10px 0;
}
aside li:hover{
  background-color:#5e616a;
}
h2,h3{
  margin:0;
}
aside li img{
  border-radius:50%;
  margin-left:20px;
  margin-right:8px;
}
aside li div{
  display:inline-block;
  vertical-align:top;
  margin-top:12px;
}
aside li h2{
  font-size:14px;
  color:#fff;
  font-weight:normal;
  margin-bottom:5px;
}
aside li h3{
  font-size:12px;
  color:#7e818a;
  font-weight:normal;
}

.status{
  width:8px;
  height:8px;
  border-radius:50%;
  display:inline-block;
  margin-right:7px;
}
.green{
  background-color:#58b666;
}
.orange{
  background-color:#ff725d;
}
.blue{
  background-color:#6fbced;
  margin-right:0;
  margin-left:7px;
}

main header{
  height:110px;
  padding:30px 20px 30px 40px;
}
main header > *{
  display:inline-block;
  vertical-align:top;
}
main header img:first-child{
  border-radius:50%;
}
main header img:last-child{
  width:24px;
  margin-top:8px;
}
main header div{
  margin-left:10px;
  margin-right:145px;
}
main header h2{
  font-size:16px;
  margin-bottom:5px;
}
main header h3{
  font-size:14px;
  font-weight:normal;
  color:#7e818a;
}

#chat{
  padding-left:0;
  margin:0;
  list-style-type:none;
  overflow-y:scroll;
  height:535px;
  border-top:2px solid #fff;
  border-bottom:2px solid #fff;
}
#chat li{
  padding:10px 30px;
}
#chat h2,#chat h3{
  display:inline-block;
  font-size:13px;
  font-weight:normal;
}
#chat h3{
  color:#bbb;
}
#chat .entete{
  margin-bottom:5px;
}
#chat .message{
  padding:20px;
  color:#fff;
  line-height:25px;
  max-width:90%;
  display:inline-block;
  text-align:left;
  border-radius:5px;
}
#chat .me{
  text-align:right;
}
#chat .you .message{
  background-color:#58b666;
}
#chat .me .message{
  background-color:#6fbced;
}
#chat .triangle{
  width: 0;
  height: 0;
  border-style: solid;
  border-width: 0 10px 10px 10px;
}
#chat .you .triangle{
    border-color: transparent transparent #58b666 transparent;
    margin-left:15px;
}
#chat .me .triangle{
    border-color: transparent transparent #6fbced transparent;
    margin-left:1090px;
}

main footer{
  height:155px;
  padding:20px 30px 10px 20px;
}
main footer textarea{
  resize:none;
  border: #ff725d;
  display:block;
  width:100%;
  height:80px;
  border-radius:3px;
  padding:20px;
  font-size: larger;
  margin-bottom:13px;
}
main footer textarea::placeholder{
 font-size: larger;
}
main footer img{
  height:30px;
  cursor:pointer;
}
main footer a{
  text-decoration:none;
  text-transform:uppercase;
  font-weight:bold;
  color:#6fbced;
  vertical-align:top;
  margin-left:1020px;
  margin-top:5px;
  display:inline-block;
}
aside ul::-webkit-scrollbar-track {
  background-color: ; /* 스크롤바 트랙의 배경색 */
}

</style>

<body>
    <div id="container">
        <aside>
          <header>
            <input type="text" placeholder="search">
          </header>
          <ul>
            <li>
              
              <div>
                <h2>&nbsp;&nbsp;&nbsp;&nbsp;하나부동산</h2>
                <h3>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="status orange"></span>
                offline
                </h3>
              </div>
            </li>
            <li>
          
              <div>
                <h2>&nbsp;&nbsp;&nbsp;&nbsp;당산부동산</h2>
                <h3>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="status green"></span>
                  online
                </h3>
              </div>
            </li>
            <li>
       
              <div>
                <h2>&nbsp;&nbsp;&nbsp;&nbsp;상계부동산</h2>
                <h3>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="status orange"></span>
                  offline
                </h3>
              </div>
            </li>
            <li>
          
              <div>
                <h2>&nbsp;&nbsp;&nbsp;&nbsp;참 좋은 공인중개사</h2>
                <h3>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="status green"></span>
                  online
                </h3>
              </div>
            </li>
            <li>
    
              <div>
                <h2>&nbsp;&nbsp;&nbsp;&nbsp;그러니까 부동산</h2>
                <h3>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="status orange"></span>
                  offline
                </h3>
              </div>
            </li>
            <li>
             
              <div>
                <h2>&nbsp;&nbsp;&nbsp;&nbsp;채팅 개어렵다</h2>
                <h3>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="status green"></span>
                  online
                </h3>
              </div>
            </li>
            <li>
     
              <div>
                <h2>&nbsp;&nbsp;&nbsp;&nbsp;홀리홀리부동산</h2>
                <h3>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="status green"></span>
                  online
                </h3>
              </div>
            </li>
            <li>
         
              <div>
                <h2>&nbsp;&nbsp;&nbsp;&nbsp;굴리짱부동산</h2>
                <h3>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="status green"></span>
                  online
                </h3>
              </div>
            </li>
            <li>
    
              <div>
                <h2>&nbsp;&nbsp;&nbsp;&nbsp;손흥민</h2>
                <h3>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="status green"></span>
                  online
                </h3>
              </div>
            </li>
            <li>
                  <div>
                <h2>&nbsp;&nbsp;&nbsp;&nbsp;굴리트</h2>
                <h3>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="status orange"></span>
                  offline
                </h3>
              </div>
            </li>
            <li>
                <div>
              <h2>&nbsp;&nbsp;&nbsp;&nbsp;장재혁</h2>
              <h3>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="status orange"></span>
                offline
              </h3>
            </div>
          </li>
          <li>
            <div>
          <h2>&nbsp;&nbsp;&nbsp;&nbsp;장재혁2</h2>
          <h3>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="status orange"></span>
            offline
          </h3>
        </div>
      </li>
      <li>
        <div>
      <h2>&nbsp;&nbsp;&nbsp;&nbsp;장재혇ㄱ3</h2>
      <h3>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="status orange"></span>
        offline
      </h3>
    </div>
  </li>
  <li>
    <div>
  <h2>&nbsp;&nbsp;&nbsp;&nbsp;ㅁㄴㅇ</h2>
  <h3>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="status orange"></span>
    offline
  </h3>
</div>
</li>
          </ul>
        </aside>
        <main>
          <header>
            <div>
              <h2>하나부동산</h2>
              <h3>언제나 항상 최고의 서비스를 보답합니다</h3>
              <button onclick="connect();">접속</button> 
              <button onclick="disconnect();">해제</button>
            </div>
          </header>
          <ul id="chat">
            <!-- <li class="you">
              <div class="entete">
                <span class="status green"></span>
                <h2>하나부동산</h2>
                <h3>10:12AM, Today</h3>
              </div>
              <div class="triangle"></div>
              <div class="message">
                안녕하세요 하나부동산입니다
              </div>
            </li>
            <li class="me">
              <div class="entete">
                <h3>10:12AM, Today</h3>
                <h2>집알아보고싶어요</h2>
                <span class="status blue"></span>
              </div>
              <div class="triangle"></div>
              <div class="message">
                롯데시그니엘 들어가고싶어요
              </div>
            </li> -->
           
          </ul>
          <footer>
            <textarea placeholder="Type your message" id="sendChat"></textarea>
            <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_picture.png" alt="">
            <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_file.png" alt="">
            <a href="#" id="send" onclick="send();">Send</a>
          </footer>
        </main>
      </div>






</body>

   <script>
		//웹소켓 접속 함수 
		var socket; //소켓담아놓을 변수 (접속과 종료 함수가 다르기 때문에 전역변수에 담아두고 사용한다)
		
		//연결함수(접속)
		function connect(){
			//접속경로를 담아 socket을 생성한다.
			var url = "ws://localhost:9999/dungjip/ask";
			socket = new WebSocket(url);
			
			//연결이 되었을때
			socket.onopen = function(){
				console.log("연결 성공");	
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
			//메세지가 왔을때 
			/* socket.onmessage = function(event) {
			    let message = JSON.parse(event.data)
			    ; // event.data는 문자열로 전달된 JSON
			    // 이제 receivedMessage 객체를 사용할 수 있습니다.
			    console.log(message.userNickName);
			    console.log(message.text);
			    console.log(message.date);
			};
				$("#chat").html("<li class='me'>"
						  +"<div class='entete'>"
						  +"<h3>"+message.date+"</h3>"
						  +"<h2>"+message.userNickName+"</h2>"
						  +"<span class='status blue'></span>"
						  +"</div>"
						  +"<div class='triangle'></div>"
						  +"<div class='message'>"
						  +message.text
						  +"</div>"
						  +"</li>"
				); */
			socket.onmessage = function(event) {
					//JSON.parse(event.data) 에 대한 설명 
					// 컨트롤러에서 JSON을 toString 화 시켜서 보냈습니다
					//parse를 써서 String을 다시 객체화 시켜줬습니다
					var chatHtml= "";
			    var message = JSON.parse(event.data);
				if("${loginUser.userNo}" == message.userNo){//현재 로그인되어있는 사용자순번과 채팅을 친 사용자 순번이 같을경우	
			     chatHtml += "<li class='me'>"+
			        "<div class='entete'>" +
			        "<h3>" + message.date + "</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
			        "<h2>" + message.userNickName + "</h2>" +
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
					        "<h2>" + message.userNickName + "</h2>" +
					        "<span class='status blue'></span>" +
					        "</div>" +
					        "<div class='triangle'></div>" +
					        "<div class='message'>" +
					        message.text +
					        "</div>" +
					        "</li>";
					
						
						  $("#chat").append(chatHtml);
					}
		    
		    
			};

				
			
		}
		//접속종료 
		function disconnect(){
			socket.close();//소켓 닫기 
		}
		//메세지 전송
		function send(){
		var text = $("#sendChat").val();
			socket.send(text);
			$("#sendChat").val("");
		}
	     </script>
          

</html>
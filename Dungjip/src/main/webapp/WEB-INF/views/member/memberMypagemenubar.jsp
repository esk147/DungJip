<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.dungjip.member.model.vo.Member"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>프로필 페이지</title>
   
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f6f8;
            color: #333;
        }
        .mypagecontainer { 
            display: flex;
            min-height: 100vh;
        }
        .sidebar {
            background-color: #fff;
            width: 400px;
            padding: 20px;
           
            
        }
        .headerLeft {
            line-height: 60px;
            
        }
       
        .profile {
            text-align: center;
            padding-bottom: 20px;
            border-bottom: 1px solid #ddd;
        }
        .profile img {
            border-radius: 50%;
            margin-bottom: 10px;
        }
        .profile h2 {
            font-size: 24px;
            color: #333;
        }
       	   
	    .profile { position: relative; }
	    .profile img { width: 100px; height: 100px; }
	    .pic { position: relative; display: inline-block; }
	    .text {
	        position: absolute;
	        top: 0;
	        left: 0;
	        width: 100px;
	        height: 100px;
	        background: #000000;
	        opacity: 0;
	        padding: 30px;
	        text-align: center;
	        color: #ffffff;
	        transition: opacity 0.3s ease-in-out;
	        border-radius: 50%;
	    }
	    .pic:hover .text { opacity: 0.6; }
	   
	   
    </style>
</head>
<body>
	
        <aside class="sidebar" style="margin-left: 40px;">
        
            <div class="profile" style="margin-top: 26px;">          	          	
               	
               	<div class="pic" >
              	 	<img id="titleImg" src="${loginUser.changeName }" alt="프로필 사진" style="width:100px; height:100px;">
               		<input style="display: none; " type="file"  class="form-control" id="upfile" name="upfile" onchange="loadImg(this,1)">
               		<div class="text">
               			<p>사진 변경</p>
               		</div>
               	</div>               
                
                <c:choose>
	                <c:when test="${not empty loginUser.userNickName }">
	                	<h2>${loginUser.userNickName }</h2>
	                </c:when>	
	                <c:otherwise>
	                	<h2>${loginUser.userName }</h2>
	                </c:otherwise>
                </c:choose>
                <p>${loginUser.email }</p>
                <!-- Additional content can be added here -->
            </div>
            <div id="headerLeft" class="headerLeft" style="margin: 10px 10px;">
                <ul class="leftmenu" style="list-style: none; margin-top: 20px; padding: 0;">
                    <li><a href="mypageupdate.me" class="menuitem" style="font-size: 15px; color: #303038;">내프로필</a></li>
                    <li><a href="mReservation.me" class="menuitem" style="font-size: 15px; color: #303038;">예약내역</a></li>   
                    <li><a href="" class="menuitem" style="font-size: 15px; color: #303038;">중개인 리뷰내역</a></li>
                    <li><a href="" class="menuitem" style="font-size: 15px; color: #303038;">매물 리뷰내역</a></li>                      
                    <li><a href="" class="menuitem" style="font-size: 15px; color: #303038;">찜내역</a></li>                    
                    <li><a href="" class="menuitem" style="font-size: 15px; color: #303038;">문의내역</a></li>                                  
                </ul>


            </div>
        </aside>
        
        <script type="text/javascript">
        
       		$(function() {
			  $("input[type='file']").css("display","none"); //file input 숨기기
                //대표이미지를 클릭하면 input file 요소 1번이 클릭되게 하는 함수
                $(".text").click(function(){
                    $("#upfile").click();
                });
	                
			});
       		
       		/* function uploadFile(inputFile, num) {
       		    if (inputFile.files.length === 1) {
       		        var formData = new FormData();
       		        formData.append('file', inputFile.files[0]); // 'file'은 서버에서 해당 파일을 받을 때 사용할 이름입니다.

       		        $.ajax({
       		            url: '/upload',
       		            type: 'POST',
       		            data: formData,
       		            processData: false, // 데이터를 query string으로 변환하지 않음
       		            contentType: false, // 데이터 형식을 설정하지 않음 (FormData가 자동으로 설정)
       		            success: function(result) {
       		                // 업로드 성공 시, 받은 경로를 서버로 전송하여 DB에 저장
       		                $.ajax({
       		                    url: '/changefile',
       		                    type: 'POST',
       		                    data: { titleImg: result }, // 받은 파일 경로를 서버로 전송
       		                    success: function(response) {
       		                        console.log('DB에 저장 성공');
       		                        console.log(response); // 서버에서 받은 응답 확인
       		                    },
       		                    error: function() {
       		                        console.log('DB에 저장 실패');
       		                    }
       		                });
       		            },
       		            error: function() {
       		                console.log('파일 업로드 실패');
       		            }
       		        });
       		    }
       		} */
			 //이미지를 읽어줄 함수 
            /* function loadImg(inputFile,num){
                //inputFile : 이벤트가 발생된 요소 객체 
                console.log(inputFile.files);
                //inputFile.files : 파일업로드 정보를 배열의 형태로 반환해주는 속성
                //파일을 선택하면 files속성의 length가 1이 반환됨
                if(inputFile.files.length == 1){ //파일이 등록되면 
                    //해당 파일을 읽어줄 FileReader라고 하는 자바스크립트 객체를 이용한다.
                    var reader = new FileReader();
                    //파일을 읽어줄 메소드 : reader.readAsDataURL(파일)
                    //해당 파일을 읽어서 고유한 url을 부여해주는 메소드 
                    //반환받은 url을 미리보기 화면에 넣어주면 된다. 
                    reader.readAsDataURL(inputFile.files[0]);
                    //해당 reader객체가 읽혀진 시점에 img src속성에 부여된 고유 url을 넣어주기
                    reader.onload = function(e){//e : event 객체
                        console.log(e);
                        //이벤트 객체에서 reader가 부여한 고유 url 정보 
                        //event.target.result 
                        console.log(e.target.result);
                        switch(num){
                        
                            case 1: $("#titleImg").attr("src",e.target.result); 
                            
                            $.ajax({
                            	
                            	url : "changefile.me",
                            	type : "POST",
                            	data : formData,
                            	
                            	data: {
                            		changefile : $("#titleImg").val(),
                            	},
                            	
                            	success : function(result) {
                            		
                            		$("#titleImg").attr(result);
                            		
                            	}, error : function() {
                            		console.log("통신오류");
                            	}
                            });
                            
                            
                            break;
                        
                        }
                    }
                }else{//length가 1이 아니면 
                    switch(num){
                            case 1: $("#titleImg").attr("src","${loginUser.changeName}"); break; //바뀌면 바뀐 이미지 취소 누를 시 이전 이미지
                         
                        }
                }
            } */
       
        </script>
      
</body>
</html>


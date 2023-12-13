<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원가입</title>
	
	 
	 
	<style>
	body {
		font-family: 'Arial', sans-serif;
		margin: 0;
		padding: 0;
		background-color: #f4f4f4;
	}
	
	.registration-container {
		background: #fff;
		width: 70%;
		margin: 40px auto;
		padding: 20px;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	}
	
	.form-title {
		font-size: 24px;
		text-align: center;
		margin: 20px 0;
	}
	
	.form-section {
		margin-bottom: 15px;
	}
	
	.form-section label {
		display: block;
		margin-bottom: 5px;
	}
	
	.form-section input[type="text"], .form-section select, .form-section input[type="email"],
		.form-section input[type="tel"], .form-section input[type="password"]{
		width: 100%;
		padding: 10px;
		margin-bottom: 10px;
		border: 1px solid #ddd;
		border-radius: 4px;
	}
	
	.userType input[type="radio"] {
		width: 23%;
		padding: 10px;
		margin-bottom: 10px;
		border: 1px solid #ddd;
		border-radius: 4px;
		
	}
	
	.form-section input[type="submit"] {
		width: 100%;
		padding: 10px;
		background-color: #000;
		color: #fff;
		border: none;
		border-radius: 4px;
		cursor: pointer;
	}
	
	.form-section input[type="submit"]:hover {
		background-color: #333;
	}
	</style>
</head>

<body>

 	<%@ include file="../common/header.jsp" %>
 	
		<div class="registration-container" style="padding:40px;width:40%;box-shadow: 0 0 4px 4px rgba(0, 0, 0, 0.1);">
			<h2 class="form-title">회원가입</h2>
			
			<form action="insert.me" method="post" enctype="multipart/form-data">
			
				<div class="userType">
					<label for="userType">가입 유형 *</label> <br>
					<input type="radio" id="user" value="임차인" name="userType" style="margin:0px -55px 0 0;" checked ><label for="user">임차인</label>
					<input type="radio" id="Muser" value="임대인" name="userType" style="margin:0px -55px 0 0;" /><label for="Muser">임대인</label>			
					<br>
				</div>
				<div class="form-section">
					<label for="userId">아이디 *</label> 
					<input type="text" class="form-control" id="userId" name="userId" placeholder="ID (6~12자리 영문 및 숫자 조합)">
					<span id="confirm"></span>
				</div>
				
	
				<div class="form-section">
					<label for="userPwd">비밀번호 *</label> 
					<input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="비밀번호 (6~15자리 영문 및 숫자 조합)">
				</div>
	
				<div class="form-section">
					<label for="checkPwd">비밀번호 확인 *</label> 
					<input type="password" class="form-control" id="checkPwd" name="checkPwd" placeholder="비밀번호 확인">
					<span id="confirm2"></span>
				</div>
	
	
				<div class="form-section">
					<label for="userName">이름 *</label> 
 					<input type="text" class="form-control" id="userName" name="userName" placeholder="이름">				
				</div>
			
				<div class="form-section">
					<label for="userNickName">닉네임</label> 
					<input type="text" class="form-control" id="userNickname" name="userNickname" placeholder="닉네임">				
				</div>
	
				<div class="form-section">
					<label for="email">이메일 *</label>  
					<input type="text" class="form-control" id="email" name="email" placeholder="이메일 (example@example.kr)">
					<span id="confirm3"></span>
				</div>
	
				<div class="form-section">
					<label for="phone">전화번호 *</label> 
					<input type="text" class="form-control" id="phone" name="phone" placeholder="'-'를 제외한 숫자 11자리로 작성해 주세요">
				</div>
				
				<div class="form-section">
					<label for="upfile">프로필 사진 설정</label> 
					<img id="titleImg" alt="" src="resources/img/person/person.jpg" style="width: 100px; height: 100px;">					
				 	<input style="display: none; " type="file"  class="form-control" id="upfile" name="upfile" onchange="loadImg(this,1)"> 									
				</div>
	
				<div align="center">
	                <button type="submit" value="가입완료" onclick="return memberEnrollResult();" >가입완료</button>
	                <button type="reset">초기화</button>
           		 </div>
				
			</form>
		</div>
		
		<script type="text/javascript">
			
			$(function() {
				  $("#form-section").hide(); //file input 숨기기
	                //대표이미지를 클릭하면 input file 요소 1번이 클릭되게 하는 함수
	                $("#titleImg").click(function(){
	                    $("#upfile").click();
	                });
	                
			});
		
			 //이미지를 읽어줄 함수 
            function loadImg(inputFile,num){
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
                            case 1: $("#titleImg").attr("src",e.target.result); break;
                        
                        }
                    }
                }else{//length가 1이 아니면 
                    switch(num){
                            case 1: $("#titleImg").attr("src",null); break;
                         
                        }
                }
            }
		
		
		
			//아이디 체크 
			var idcheck = false;
			var regexId = /^[0-9a-zA-Z]{5,11}$/;
			var pwcheck = false;
			
			$(document).ready(function() {
				$("#userId").change(function() {
					var checkId = $("#userId").val();
					if(!regexId.test(checkId)) {
						$("#confirm")
						.html("아이디는 영문자+숫자로 6~12글자로 작성하세요.")
						.css("color","red");
						userId.focus();
						idcheck = false;
					}else{
						
						$.ajax({
		        			url : "ajaxId.do",
		        			
		        			data : {
		        				userId : checkId,
		        			},
		        			
		        			success : function(result) {
		        				
		        				console.log(result);
		        				
		        				if(result == '1') { //중복
		        					$("#confirm")
									.html("해당 아이디는 이미 존재함으로 사용하실수 없습니다.")
									.css("color","red");
									userId.focus();
									idcheck = false;
		        					
		        				}else{ //사용가능
		        					$("#confirm")
									.html("사용 가능한 아이디입니다.")
									.css("color","blue");
									idcheck = true;
		        				}
		        				
		        			},error : function() {
		        				
		        				console.log("통신 실패");
		        			}

		        		});	
					
					}
				});
			});
			
			//비밀번호 체크 
			$(document).ready(function() {
				$("#checkPwd").change(function() {
					var userPwd = $("#userPwd").val();
					var checkPwd = $("#checkPwd").val();
					if(userPwd != checkPwd) {
						$("#confirm2")
						.html("비밀번호가 일치하지 않습니다.")
						.css("color","red");
						$("#checkPwd").focus();						 
						pwcheck = false;
					}else{
						$("#confirm2")
						.html("비밀번호가 일치합니다. ")
						.css("color","blue");
						pwcheck = true;
					}
				});
			});
					
			
			
			function memberEnrollResult() {
				
				var userType= $("#userType").val();
				var userId = $("#userId").val();
				var userPwd = $("#userPwd").val();
				var checkPwd = $("#checkPwd").val();
				var userName = $("#userName").val();
				var userNickName = $("userNickName").val();
				var email = $("#email").val();
				var phone = $("#phone").val();
				
								
				if (userId == null || userId == '') {
					alert("ID를 입력하세요.");
					$("#userId").focus();
					return false;
				}


				if (userPassword == null || userPassword == '') {
					alert("비밀번호를 입력하세요");
					return false;
					
				} else {
					
					var regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,14}$/;

					if (!regExp.test(userPassword)) {
						alert("비밀번호는 4~15자리 영문 및 숫자 조합이어야 합니다.");
						$("#checkPwd").focus();
						return false;
					}
					
					if (userPassword != userPasswordChk) {
						alert("비밀번호가 일치하지 않습니다.");
						$("#checkPwd").focus();
						return false;
					}
				}
				
				if (userName == null || userName == '') {
					alert("이름을 입력하세요.");
					$("#userName").focus();
					return false;
				}

				if (email == null || email == '') {
					alert("이메일을 입력하세요");
					$("#email").focus();
					return false;
					
				}else{
					
					var regExp = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
					
					if (!regExp.test(email)) { 
						alert("올바르지 않은 이메일 형식입니다.");
						$("#email").focus();
						return false;
					}
				}
				
				if (phone == null || phone == '') {
					alert("전화번호를 입력하세요.");
					$("#phone").focus();
					return false;
					
				}
					
				
			}
			
			
			
		</script>
		
		
		<%@ include file="../common/footer.jsp" %>
		
		
</body>

</html>
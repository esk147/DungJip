<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원가입</title>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
 	
		<div class="registration-container">
			<h2 class="form-title">회원가입</h2>
			<form action="enroll.me" method="post">
			
				<div class="userType">
					<label for="">가입 유형 *</label> <br>
					<input type="radio" id="user" value="U" name="userType" checked><label for="user">사용자</label>
					<input type="radio" id="Muser" value="M" name="userType" /><label for="Muser">임대인</label>			
					<br>
				</div>
			
				<div class="form-section">
					<label for="userId">아이디 *</label> <input type="text" id="userId"
						required><div><font id ="id_feedback" size="2"></font></div>
				</div>
				
	
				<div class="form-section">
					<label for="userPwd">비밀번호 *</label> <input type="password"
						id="userPwd" required>
				</div>
	
				<div class="form-section">
					<label for="checkPwd">비밀번호 확인 *</label> <input
						type="password" id="password-confirm" required>
				</div>
	
				<div class="form-section">
					<label for="email">이메일 *</label> <input type="email" id="email"
						required>
				</div>
	
				<div class="form-section">
					<label for="phone">전화번호 *</label> <select id="phone-prefix">
						<option value="02">02</option>
						<!-- Additional options here -->
					</select> <input type="tel" id="phone" required>
				</div>
	
	
				<div class="form-section">
					<input type="submit" value="가입완료">
				</div>
			</form>
		</div>
		
		<script type="text/javascript">
		
			
			function idcheck() {
				
				var userId = $(".registration-container > #userId").val();
				
				$.ajax({
					url "idcheck.do",
					
					data : {
						userId : userId.val(),
					},
					
					success : function(result) {
						
						console.log(result);
						
						if(result == '1') { //중복
							$("#id_feedback").html('이미 사용중인 아이디입니다.');
							$("#id_feedback").attr('color','#dc3545');
						}else{
							$("#id_feedback").html('사용 가능한 아이디입니다.');
							$("#id_feedback").attr('color','#2fb380');
						}
						
					},
					error : function() {
						alert("서버 요청 실패");
					}
				})
								
			}
		
		</script>
		
		
		<%@ include file="../common/footer.jsp" %>
		
		
</body>

</html>
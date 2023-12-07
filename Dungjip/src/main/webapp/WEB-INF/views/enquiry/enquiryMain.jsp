<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html class="no-js">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>문의하기</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
}

.form-container {
	width: 90%;
	max-width: 600px;
	margin: 40px auto;
	padding: 20px;
	background: #fff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
}

form {
	display: flex;
	flex-direction: column;
	margin-top: 20px;
}

input[type="text"], input[type="email"], select, textarea {
	margin-bottom: 15px;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.submit-button {
	padding: 10px;
	background-color: rgb(50, 108, 249);
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.submit-button:hover {
	background-color: rgb(88, 128, 229);
}

.submit-button {
	width: 80px;
}

.col-md-12 {
	display: flex;
	justify-content: center;
}

.nav-menu {
	display: flex;
	justify-content: center;
	list-style: none;
	padding: 0;
	background-color: #f4f4f4;
	margin: 20px 0;
}

.nav-item {
	padding: 10px 50px; /* Adjust the padding as necessary */
	margin: 0 10px; /* Space between items */
	border: 1px solid #ddd; /* Border color */
	background-color: #fff; /* Background color for non-active items */
	cursor: pointer;
}

.nav-item.active {
	background-color: #000; /* Active item background color */
	color: #fff; /* Active item text color */
}

.nav-item:hover{
    background-color: #000;
    color: #fff;
}

label {
	font-size: 15px;
}
</style>
<meta name="description" content="company is a real-estate template">
<meta name="author" content="Kimarotec">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800'
	rel='stylesheet' type='text/css'>

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="icon" href="favicon.ico" type="image/x-icon">

<link rel="stylesheet" href="resources/assets/css/normalize.css">
<link rel="stylesheet" href="resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/assets/css/fontello.css">
<link href="resources/assets/fonts/icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet">
<link href="resources/assets/fonts/icon-7-stroke/css/helper.css" rel="stylesheet">
<link href="resources/assets/css/animate.css" rel="stylesheet" media="screen">
<link rel="stylesheet" href="resources/assets/css/bootstrap-select.min.css">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/assets/css/icheck.min_all.css">
<link rel="stylesheet" href="resources/assets/css/price-range.css">
<link rel="stylesheet" href="resources/assets/css/owl.carousel.css">
<link rel="stylesheet" href="resources/assets/css/owl.theme.css">
<link rel="stylesheet" href="resources/assets/css/owl.transitions.css">
<link rel="stylesheet" href="resources/assets/css/style.css">
<link rel="stylesheet" href="resources/assets/css/responsive.css">
</head>
<body>
	<div class="page-head">
		<div class="container">
			<div class="row">
				<div class="page-head-content">
					<h1 class="page-title" align="center">문의하기</h1>
				</div>
			</div>
		</div>
	</div>
	<br><br>
	<ul class="nav-menu" style="background-color: #fff;">
		<li class="nav-item" style="width:190px;">1:1문의 내역</li>
		<li class="nav-item active">1:1 문의</li>
		<li class="nav-item">공지사항</li>
	</ul>
	<div class="form-container">
		<form id="insertForm" method="post" action="insert.en" enctype="multipart/form-data">
			<p align="center" style="font-size: 16px;">
				둥집에 궁금하신 점을 문의해주세요. <br> 문의내용과 답변은 <a>'마이페이지 문의내역'</a> 에서 확인 하실 수 있습니다. </p>
			<input type="hidden" id="userId" name="userId" value="${loginUser.userId}">
			<br> <label for="">문의 유형</label> 
            <input type="text" value="서비스 이용 문의" disabled>
		    <label for="name">제목</label>
            <input type="text" id="enquiryTitle" id="enquiryTitle" placeholder="제목을 입력해주세요."> 
            <label for="content">문의 내용</label>
			<textarea id="enquiryContent" name="enquiryContent" rows="4" style="resize: none;" placeholder="문의 하실 내용을 입력해주세요."></textarea>
			<label>사진</label>
			<input type="file" id="enquiryImage" name="enquiryImage">
			<div align="center">
				<button type="submit" class="submit-button" style="width:100px">문의하기</button>
			</div>
		</form>
	</div>
</body>
</html>
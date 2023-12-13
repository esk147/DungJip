<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    width: 110px;
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
}
.nav-item {
    padding: 10px 50px; /* Adjust the padding as necessary */
    margin: 0 10px; /* Space between items */
    border: 1px solid #ddd; /* Border color */
    background-color: #fff; /* Background color for non-active items */
    color:#000;
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
                    <h1 class="page-title" align="center">관리자 페이지</h1>
                </div>
            </div>
        </div>
    </div>
    <br><br>
        <div align="center">
            <a href="enList.en" class="nav-item" style="width:180px;">1:1문의 내역</a>
            <a href="enquiry.en" class="nav-item" style="width:180px;">1:1문의</a>
            <a href="list.no" class="nav-item active">공지사항</a>
        </div>
    <div class="form-container">
        <form id="insertForm" method="post" action="insert.no" enctype="multipart/form-data">
            <p align="center" style="font-size: 16px;">
                공지사항 작성  </p>
            
            <br>
            <label for="name">제목</label>
            <input type="text" id="noticeTitle" name="noticeTitle" value="${notice.noticeTitle}"> 
            <label for="content">내용</label>
            <textarea id="noticeContent" name="noticeContent" rows="4" style="resize: none;" value="${notice.noticeContent}"></textarea>
            <div align="center">
                <button type="submit" class="submit-button" style="width:100px">작성하기</button>
            </div>
        </form>
    </div>
</body>
</html>
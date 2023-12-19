<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.dungjip.member.model.vo.Member"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>프로필 페이지</title>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
        .profile p {
            font-size: 14px;
            color: #666;
        }
      
       
 
    </style>
</head>
<body>
	
        <aside class="sidebar" style="margin-left: 40px;">
            <div class="profile" style="margin-top: 26px;">
            
               	 <img src="${loginUser.changeName }" alt="프로필 사진" style="width:100px; height:100px;">
                
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
                    <li><a href="" class="menuitem" style="font-size: 15px; color: #303038;">예약내역</a></li>            
                    <li><a href="" class="menuitem" style="font-size: 15px; color: #303038;">찜내역</a></li>                    
                    <li><a href="" class="menuitem" style="font-size: 15px; color: #303038;">문의내역</a></li>                                  
                </ul>


            </div>
        </aside>
	
</body>
</html>


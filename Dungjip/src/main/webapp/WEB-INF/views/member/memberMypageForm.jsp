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
        .card{
           box-shadow: 1px 1px 7px 0;
           border: none;
           border-radius: 12px 12px 12px 12px;
           
        }
        .card h3 {
            font-size: 18px;
            margin-bottom: 10px;
            position: relative;
            display: block;
            padding: 15px 38px 13px 18px; 
            background-color: #c2c2c2;
            border-radius: 12px 12px 0 0;
            color: #effcf1;
           
        }
        .card p {
            font-size: 14px;
           
        }
        .card a {
            color: #fff;
            text-decoration: none;
            font-size: 14px;
            display: inline-block;
            margin-top: 10px;
            padding-top: 10px;
         
        }

       

        .card ul {
           padding: 0 40px;
        }

        .item_text{
            padding: 20px 0 10px 0px;
            line-height: 30px;
            font-size: 14px;
            letter-spacing: -0.8;
        }
        .btn_edit {
            float: right;
            padding: 2px 9px 3px 10px;
           color: #7b8994;
           border: none ;
        }
        
    </style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>

    <div class="container" style="display: flex; width: 67%;">
          
            <%@ include file="memberMypagemenubar.jsp" %>
            
        <section class="main-content" style="width:100%; margin: 70px 0 70px 50px; margin-left:4%;">
            <div class="card" style="width: 93%; margin-bottom:50px;">
            
                <h3>내프로필 <img src="resources/img/icons/rightarrow271228.png" alt="" style="width: 15px; float:right;"></h3>
                <!-- Additional content can be added here -->
                <ul class="card_row" style="color: #333; list-style: none; padding: 0 20px 20px 20px;">
                    <li>
                       <img src="resources/img/icons/person3856336.png" alt="" style="width: 16px;">
                       <span class="item_text name" style="margin-left:12px;">${loginUser.userName }</span>
                        <button class="btn_edit">실명수정</button>    
                    </li>
                    <hr>
                    <li>
                    	<img alt="" src="resources/img/icons/nickname1828439.png" style="width: 16px;">
                        <span class="item_text nickname" style="margin-left:12px;">${loginUser.userNickName }</span>
                        <button class="btn_edit">수정</button>    
                    </li>
                    <hr>
                    <li>
                   		<img alt="" src="resources/img/icons/phone519184.png" style="width: 16px;">
                        <span class="item_text phone" style="margin-left:12px;">${loginUser.phone }</span>
                        <button class="btn_edit">수정</button>    
                    </li>
                    <hr>
                    <li>
                    	<img alt="" src="resources/img/icons/mail7873670.png" style="width: 17px;">
                        <span class="item_text email" style="margin-left:12px;">${loginUser.email }</span>
                        <button class="btn_edit">수정</button>    
                    </li>
    
                </ul>
            </div>
            <div class="card" style="width: 93%; margin-bottom:50px;">
                <h3>예약내역 <img src="resources/img/icons/rightarrow271228.png" alt="" style="width: 15px; float:right;"></h3>
                <!-- Additional content can be added here -->
                <ul class="card_row" style="color: #333; list-style: none; padding: 0 20px 20px 20px;">
                    <li>
                    	<img alt="" src="" style="width: 16px;">
                        <span class="item_text name" style="margin-left:12px;">이름</span>
                        <button class="btn_edit">실명수정</button>    
                    </li>
                    <hr>
                    <li>
                    	<img alt="" src="" style="width: 16px;">
                        <span class="item_text nickname" style="margin-left:12px;">닉네임</span>
                        <button class="btn_edit">수정</button>    
                    </li>
                    <hr>
                    <li>
                    	<img alt="" src="" style="width: 16px;">
                        <span class="item_text phone" style="margin-left:12px;">전화번호</span>
                        <button class="btn_edit">수정</button>    
                    </li>
                    <hr>
                    <li>
                    	<img alt="" src="" style="width: 16px;">
                        <span class="item_text email" style="margin-left:12px;">이메일</span>
                        <button class="btn_edit">수정</button>    
                    </li>
    
                </ul>
            </div>
            <div class="card" style="width: 93%; margin-bottom:50px;">
                <h3>찜내역 <img src="resources/img/icons/rightarrow271228.png" alt="" style="width: 15px; float:right;"></h3>
                <!-- Additional content can be added here -->
                <ul class="card_row" style="color: #333; list-style: none;padding: 0 20px 20px 20px;">
                    <li>
                    	<img alt="" src="" style="width: 16px;">
                        <span class="item_text name" style="margin-left:12px;" onclick='location.href=""'>중개사</span>
                        <button class="btn_edit">수정</button>    
                    </li>
                    <hr>
                    <li>
                    	<img alt="" src="" style="width: 16px;">
                        <span class="item_text nickname" style="margin-left:12px;">집</span>
                        <button class="btn_edit">수정</button>    
                    </li>
                    
    
                </ul>
            </div>
            <div class="card" style="width: 93%;  margin-bottom:50px;">
                <h3>문의내역 <img src="resources/img/icons/rightarrow271228.png" alt="" style="width: 15px; float:right;"></h3>
                <!-- Additional content can be added here -->
                <ul class="card_row" style="color: #333; list-style: none;padding: 0 20px 20px 20px;">
                    <li>
                    	<img alt="" src="" style="width: 16px;">
                        <span class="item_text name" style="margin-left:12px;">이름</span>
                        <button class="btn_edit">실명수정</button>    
                    </li>
                    <hr>
                    <li>
                    	<img alt="" src="" style="width: 16px;">
                        <span class="item_text nickname" style="margin-left:12px;">닉네임</span>
                        <button class="btn_edit">수정</button>    
                    </li>
                    <hr>
                    <li>
                    	<img alt="" src="" style="width: 16px;">
                        <span class="item_text phone" style="margin-left:12px;">전화번호</span>
                        <button class="btn_edit">수정</button>    
                    </li>
                    <hr>
                    <li>
                    	<img alt="" src="" style="width: 16px;">
                        <span class="item_text email" style="margin-left:12px;">이메일</span>
                        <button class="btn_edit">수정</button>    
                    </li>
    
                </ul>
                </div>
            </div>
            <!-- Additional toggles can be added here -->
        </section>
 

     <%@ include file="../common/footer.jsp" %>
     
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.dungjip.member.model.vo.Member"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약내역</title>
   
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
    
    <!-- 마이페이지 메뉴바 -->      
    <%@ include file="memberMypagemenubar.jsp" %>
        
        <!-------------------------------- 회원 정보 수정하기-------------------------------->    
        <section class="main-content" style="width:100%; margin: 70px 0 70px 50px; margin-left:4%;">
            <div class="card" style="width: 93%; margin-bottom:50px;">
            
                <h3>예약 내역 </h3>
                <!-- Additional content can be added here -->
                <ul class="card_row" style="color: #333; list-style: none; padding: 0 20px 20px 20px;">
                   
                   <form class="row cotact_form" id="memberReservationForm" action="mReservation.me" method="post" style="margin:0;">
              	
	                   	<div>
	                   		<span class="item_text userId">아이디</span>
	                   	 	<input type="text" class="form-control" id="userId" name="userId" placeholder="ID" value="${loginUser.userId}" readonly="readonly">
	                   	</div>		                   		                   
	                   
	                   	<hr>  
	                   	
	                   	<div>
	                   		<span class="item_text userName">이름</span>
	                   	 	<input type="text" class="form-control" id="userName" name="userName" placeholder="NAME" value="${loginUser.userName}" >
	                   	</div>	
	                   	
	                   	<hr> 
	                   	
	                   	<div>
	                   		<span class="item_text userNickName">닉네임</span>
	                   	 	<input type="text" class="form-control" id="userNickName" name="userNickName" placeholder="NICKNAME" value="${loginUser.userNickName}" >
	                   	</div>	
	                   	
	                   	<hr> 
	                   	
	                   	<div>
		                   	<span class="item_text age">나이</span>
	                   	 	<input type="text" class="form-control" id="age" name="age" placeholder="AGE" value="${loginUser.age}" >
	                   	</div>	
	                   	
	                   	<hr>
	                    
	                   	<div>
	                    	<span class="item_text phone">휴대폰 번호(-없이)</span>
	                   	 	<input type="text" class="form-control" id="phone" name="phone" placeholder="PHONE" value="${loginUser.phone}" >
	                   	</div>	
	                   	
	                   	<hr>          	
	                   
	                   	<div>
	                    	<span class="item_text email">이메일</span>
	                   	 	<input type="text" class="form-control" id="email" name="email" placeholder="EMAIL" value="${loginUser.email}" >
	                   	</div>	
	                   	
	                   	<hr>   
	    
	                   	<div>
	    					<span class="item_text address_kakao">주소</span>
	                   	 	<input type="text" class="form-control" id="address_kakao" name="address" placeholder="ADDRESS" value="${loginUser.address}" >
	                   	</div>		                   	                    

	                   	<hr>
	                   		                   	
           	             	<button type="button" class="btn btn-link" data-toggle="modal" data-target="#changePwd" style="float: inline-end;">비밀번호 변경하기</button>              	
	                   	<div class="btns" style="display: flex; justify-content: space-between;">	                   								                   	
		                   	<button class="btn btn-danger" type="button" data-target="#memberDelete" data-toggle="modal" style="color:red;"><strong>회원 탈퇴</strong></button>	    
		                   	<button class="btn btn-primary" type="submit" onclick="return mypageUpdate();"><strong>정보 수정</strong></button>
	                   	</div>
	                   		                   	
	                </ul>
                </form>
                              
            </div>           
        </section> 
                               
      </div>
      

     <%@ include file="../common/footer.jsp" %>
     
</body>
</html>

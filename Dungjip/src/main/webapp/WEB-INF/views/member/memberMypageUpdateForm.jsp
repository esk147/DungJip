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
    
    <!-- 마이페이지 메뉴바 -->      
    <%@ include file="memberMypagemenubar.jsp" %>
        
        <!-- 회원 정보 수정하기  -->    
        <section class="main-content" style="width:100%; margin: 70px 0 70px 50px; margin-left:4%;">
            <div class="card" style="width: 93%; margin-bottom:50px;">
            
                <h3>프로필 수정하기 <img src="resources/img/icons/rightarrow271228.png" alt="" style="width: 15px; float:right;"></h3>
                <!-- Additional content can be added here -->
                <ul class="card_row" style="color: #333; list-style: none; padding: 0 20px 20px 20px;">
                   
                   <form class="row cotact_form" id="memberupdateform" action="mypageupdate.me" method="post" style="margin:0;">
                   
                   	 <input type="hidden" name="userNo" value="${loginUser.userNo }">
	                   	
	                   	<span class="item_text userId">아이디</span>
	                   	<div>
	                   	 	<input type="text" class="form-control" id="userId" name="userId" placeholder="ID" value="${loginUser.userId}" readonly="readonly">
	                   	</div>	
	                   	
	                   	<hr>  
	                   		                  
                   		<span class="item_text userPwd">비밀번호</span>
	                   	<div>
	                   	 	<input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="PASSWORD"  value="${loginUser.userPwd}">
	                   	</div>
	                   
	                   	<hr>  
	                   	
	                   	<span class="item_text userName">이름</span>
	                   	<div>
	                   	 	<input type="text" class="form-control" id="userName" name="userName" placeholder="NAME" value="${loginUser.userName}" >
	                   	</div>	
	                   	
	                   	<hr> 
	                   	
	                    <span class="item_text userNickName">닉네임</span>
	                   	<div>
	                   	 	<input type="text" class="form-control" id="userNickName" name="userNickName" placeholder="NICKNAME" value="${loginUser.userNickName}" >
	                   	</div>	
	                   	
	                   	<hr> 
	                    
	                    <span class="item_text phone">휴대폰 번호(-없이)</span>
	                   	<div>
	                   	 	<input type="text" class="form-control" id="phone" name="phone" placeholder="PHONE" value="${loginUser.phone}" >
	                   	</div>	
	                   	
	                   	<hr>          	
	                   
	                    <span class="item_text email">이메일</span>
	                   	<div>
	                   	 	<input type="text" class="form-control" id="email" name="email" placeholder="EMAIL" value="${loginUser.email}" >
	                   	</div>	
	                   	
	                   	<hr>   
	    
	    				<span class="item_text address">주소</span>
	                   	<div>
	                   	 	<input type="text" class="form-control" id="email" name="email" placeholder="EMAIL" value="${loginUser.email}" >
	                   	</div>
	                   	
	                   	
	                </ul>
                </form>
            </div>           
        </section> 
                               
      </div>
            <!-- Additional toggles can be added here -->
 

     <%@ include file="../common/footer.jsp" %>
     
</body>
</html>

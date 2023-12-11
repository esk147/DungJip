<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
    
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>GARO ESTATE | Register page</title>
        <meta name="description" content="GARO is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">
	
    </head>
    <body>

       <%@ include file="../common/header.jsp" %>

        <div class="page-head"> 
            <div class="container">
                <div class="row">
                    <div class="page-head-content">
                        <h1 class="page-title"></h1>               
                    </div>
                </div>
            </div>
        </div>
        <!-- End page header -->
 

        <!-- register-area -->
        <div class="register-area" style="background-color: rgb(249, 249, 249);">
        
            <div class="container" style="display: flex; justify-content: center;">
                <div class="col-md-6">
                    <div class="box-for overflow" style="width: 600px; height: 600px;">                         
                        <div class="col-md-12 col-xs-12 login-blocks">
                            <h2>Login : </h2> 
                            <form action="login.me" method="post">
                                <div class="form-group">
                                    <label for="userId">Id</label>
                                    <input type="text" class="form-control" id="userId">
                                </div>
                                <div class="form-group">
                                    <label for="userPwd">Password</label>
                                    <input type="password" class="form-control" id="userPwd">
                                </div>
                                
                                <!-- 아이디 저장하기 -->
								<div class="form-check <!-- form-check-reverse py-2 -->">
								  <label class="form-check-label" for="reverseCheck1" style="padding:0px 10px 0 0px">아이디 저장하기</label>
								  <input class="form-check-input" type="checkbox" id="reverseCheck1" name="saveId" style="width: min-content;">
								 	<br><br>
								</div>
								
								<div class="col-md-12 form-group"  align = center>
									<span> <a href="findInfo.bo">아이디 찾기 / 비밀번호 찾기</a></span> 
									<span><a href="enrollType.me">/ 회원가입</a></span>
									
								</div>
                                
                                
                                <div class="text-center">                                	
                                    <button type="submit" class="btn btn-default"> Log in</button>
                                </div>
                            </form>
                            <br>
                            
                            <h2>Social login :  </h2> 
                            
                            <p>
                            <a class="login-social" href="#"><i class="fa fa-facebook"></i>&nbsp;Facebook</a> 
                            <a class="login-social" href="#"><i class="fa fa-google-plus"></i>&nbsp;Gmail</a> 
                            <a class="login-social" href="#"><i class="fa fa-twitter"></i>&nbsp;Twitter</a>  
                            </p> 
                        </div>
                        
                    </div>
                </div>

            </div>
        </div>      

          <!-- Footer area-->
         <%@ include file="../common/footer.jsp" %>

    </body>
</html>
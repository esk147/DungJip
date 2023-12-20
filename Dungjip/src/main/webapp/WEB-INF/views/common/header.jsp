<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.kh.dungjip.member.model.vo.Member"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>DungJip Header</title>
    
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
    
     <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="/dungjip/resources/assets/css/normalize.css">
        <link rel="stylesheet" href="/dungjip/resources/assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="/dungjip/resources/assets/css/fontello.css">
        <link href="/dungjip/resources/assets/fonts/icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet">
        <link href="/dungjip/resources/assets/fonts/icon-7-stroke/css/helper.css" rel="stylesheet">
        <link href="/dungjip/resources/assets/css/animate.css" rel="stylesheet" media="screen">
        <link rel="stylesheet" href="/dungjip/resources/assets/css/bootstrap-select.min.css"> 
        <link rel="stylesheet" href="/dungjip/resources/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="/dungjip/resources/assets/css/icheck.min_all.css">
        <link rel="stylesheet" href="/dungjip/resources/assets/css/price-range.css">
        <link rel="stylesheet" href="/dungjip/resources/assets/css/owl.carousel.css">  
        <link rel="stylesheet" href="/dungjip/resources/assets/css/owl.theme.css">
        <link rel="stylesheet" href="/dungjip/resources/assets/css/owl.transitions.css">
        <link rel="stylesheet" href="/dungjip/resources/assets/css/style.css">
        <link rel="stylesheet" href="/dungjip/resources/assets/css/responsive.css">
        
		<noscript>
        <link rel="stylesheet" type="text/css" href="/dungjip/resources/assets/css/styleNoJS.css" />
        </noscript>
 
  </head>
  
  <style>
  	.navbar-brand p {
  		padding: 0.5em 0 0;
  	}
  	.bounceInRight {
  		margin-right: 10px;
  	}
  </style>
  <body>
        <nav class="navbar navbar-default ">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navigation">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/dungjip"><img src="" alt=""><p>DungJip</p></a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
            <c:choose>   
            
            	<c:when test="${loginUser == null }">
            	
            	<!-- 로그인 전  -->
	                <div class="collapse navbar-collapse yamm" id="navigation">
	                    <div class="button navbar-right">
	                        <button class="navbar-btn nav-button wow bounceInRight" onclick='location.href="login.be"' data-wow-delay="0.4s">Login</button>
	                        <button class="navbar-btn nav-button wow fadeInRight" onclick='location.href="enquiry.en"' data-wow-delay="0.5s">QnA</button>
	                    </div>
	                    <ul class="main-nav nav navbar-nav navbar-right">
	                        <li class="dropdown ymm-sw " data-wow-delay="0.1s"><a href="villa.map" class="active">빌라</a></li>
	                        <li class="wow fadeInDown" data-wow-delay="0.1s"><a class="" href="">투룸</a></li>
	                        <li class="wow fadeInDown" data-wow-delay="0.1s"><a class="" href="">집내놓기</a></li>
	                        <li class="wow fadeInDown" data-wow-delay="0.4s"><a href="">Contact</a></li>
	                    </ul>
	                </div>  
	                  
                </c:when>
                
                <c:otherwise>
                
                <!-- 로그인 후  -->
                	<div class="collapse navbar-collapse yamm" id="navigation">
	                    <div class="button navbar-right">
	                        <button class="navbar-btn nav-button wow bounceInRight" onclick='location.href="logout.me?userNo=${loginUser.userNo}"' data-wow-delay="0.4s">Logout</button>
	                        <button class="navbar-btn nav-button wow fadeInRight" onclick='location.href="enquiry.en"' data-wow-delay="0.5s">QnA</button>
	                    </div>
	                    <ul class="main-nav nav navbar-nav navbar-right">
                 
	                        <li class="wow fadeInDown" data-wow-delay="0.1s"><a href="villa.map" class="active">빌라</a></li>
	                        <li class="wow fadeInDown" data-wow-delay="0.1s"><a class="" href="">투룸</a></li>
	                        <li class="wow fadeInDown" data-wow-delay="0.1s"><a class="" href="">집내놓기</a></li>
	                        <li class="wow fadeInDown" data-wow-delay="0.4s"><a href="">Contact</a></li>
	                       
	                        <li class="dropdown ymm-sw" data-wow-delay="0.1s">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">
									${loginUser.userName } 님 환영합니다! <b class="caret"></b>
								</a>
								<ul class="dropdown-menu">
								
									<c:if test="${loginUser.userType == '관리자' }">
										<li class="nav-item"><a class="nav-link" href="">관리자 페이지</a></li>
										
									</c:if>
										<li class="nav-item"><a class="nav-link" href="myPage.me">마이페이지</a></li>
										
								</ul>
							</li>
							
	                    </ul>
	                </div><!-- /.navbar-collapse -->           
                </c:otherwise>               
                
             </c:choose>    
                
            </div><!-- /.container-fluid -->
        </nav>
  
        <script src="/dungjip/resources/assets/js/modernizr-2.6.2.min.js"></script>

        <script src="/dungjip/resources/assets/js/jquery-1.10.2.min.js"></script>
        <script src="/dungjip/resources/bootstrap/js/bootstrap.min.js"></script>
        <script src="/dungjip/resources/assets/js/bootstrap-select.min.js"></script>
        <script src="/dungjip/resources/assets/js/bootstrap-hover-dropdown.js"></script>

        <script src="/dungjip/resources/assets/js/easypiechart.min.js"></script>
        <script src="/dungjip/resources/assets/js/jquery.easypiechart.min.js"></script>

        <script src="/dungjip/resources/assets/js/owl.carousel.min.js"></script>        

        <script src="/dungjip/resources/assets/js/wow.js"></script>

        <script src="/dungjip/resources/assets/js/icheck.min.js"></script>
        <script src="/dungjip/resources/assets/js/price-range.js"></script>


        <script src="/dungjip/resources/assets/js/jquery.ba-cond.min.js"></script>
        <script src="/dungjip/resources/assets/js/jquery.slitslider.js"></script>

        <script src="/dungjip/resources/assets/js/main.js"></script>
        
  </body>
</html>

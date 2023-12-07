<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>GARO ESTATE | Register page</title>
        <meta name="description" content="GARO is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>

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
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	
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
        
         <h3 align="center" style="padding: 15px;"><b>회원가입</b></h3>
         
            <div class="container">

                <div class="col-md-6">
                    <div class="box-for overflow">
                        <div class="col-md-12 col-xs-12 register-blocks">
                            <h2>사용자 / 임대인 : </h2> 
                            <form action="agree.me" method="post">
                                <img src="resources/assets/img/u1.png" alt="">
                                <div class="text-center" style="padding: 10px;">
                                    <button type="submit" class="btn btn-default">가입하기</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-md-6" >
                    <div class="box-for overflow" >
                        <div class="col-md-12 col-xs-12 register-blocks">
                            <h2>중개인 : </h2> 
                            <form action="agree.me" method="post">
                                <img class="img-fluid" src="resources/assets/img/e1.png" alt="">
                                <div class="text-center" style="padding: 10px;">
                                    
                                    <button type="submit" class="btn btn-default">가입하기</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>          

          <!-- Footer area-->
         <%@ include file="../common/footer.jsp" %>

         <script src="resources/assets/js/modernizr-2.6.2.min.js"></script>

        <script src="resources/assets/js/jquery-1.10.2.min.js"></script> 
        <script src="resources/bootstrap/js/bootstrap.min.js"></script>
        <script src="resources/assets/js/bootstrap-select.min.js"></script>
        <script src="resources/assets/js/bootstrap-hover-dropdown.js"></script>

        <script src="resources/assets/js/easypiechart.min.js"></script>
        <script src="resources/assets/js/jquery.easypiechart.min.js"></script>

        <script src="resources/assets/js/owl.carousel.min.js"></script>
        <script src="resources/assets/js/wow.js"></script>

        <script src="resources/assets/js/icheck.min.js"></script>
        <script src="resources/assets/js/price-range.js"></script>

        <script src="resources/assets/js/main.js"></script>

    </body>
</html>
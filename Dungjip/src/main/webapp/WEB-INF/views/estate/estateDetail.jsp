<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>부동산 상세페이지</title>
        <meta name="description" content="company is a real-estate template">
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
        <link rel="stylesheet" href="resources/assets/css/lightslider.min.css">
        <link rel="stylesheet" href="resources/assets/css/style.css">
        <link rel="stylesheet" href="resources/assets/css/responsive.css">
        <style>
            .fa-star {
            color: #D27E04;
             }

             #num {
            color: #D27E04;
             }


        </style>
         <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    </head>
    <body>
	<%@ include file="../common/header.jsp"%>
        <div id="preloader">
            <div id="status">&nbsp;</div>
        </div>
        <!-- Body content -->

        
        <!--End top header -->

        
        <!-- End of nav bar -->

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

        <!-- property area -->
        <div class="content-area single-property" style="background-color: #FFFFFF;">&nbsp;
            <div class="container" style="width: 1500px;">   

                <div class="clearfix padding-top-40" >
                    <div class="col-md-4 single-property-content prp-style-1 " style="width: 370px;"> 
                        <aside class="sidebar sidebar-property blog-asside-right">
                            
                            <div class="dealer-widget">
                         
                                <div class="dealer-content">
                                    <div class="inner-wrapper">

                                        <div class="clear">
                                            <div class="col-xs-4 col-sm-4 dealer-face">
                                               <img src="resources/img/person/${e.member.changeName}" class="img-circle" >
                                            </div>
                                            <div class="col-xs-8 col-sm-8 ">
                                                <h3 class="dealer-name">
                                                    <a style="font-size: 14px;">${e.esName}</a> 
                                                </h3>
                                                

                                            </div>
                                        </div>

                                        <div class="clear">
                                        
                                            
                                        </div>

                                    </div>
                                </div>
                                
                            </div>
                      

                            

                            

                            <div class="panel panel-default sidebar-menu wow fadeInRight animated" >
                                <div class="panel-heading">
                                    <h3 class="panel-title">예약 정보</h3>
                                </div>
                                <div class="panel-body search-widget">
                                    <form action="" class=" form-inline"> 
                                        <fieldset>
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <input type="text" class="form-control" placeholder="Key word">
                                                </div>
                                            </div>
                                        </fieldset>

                                        <fieldset>
                                            <div class="row">
                                                <div class="col-xs-6">

                                                    <select id="lunchBegins" class="selectpicker" data-live-search="true" data-live-search-style="begins" title="Select Your City">

                                                        <option>New york, CA</option>
                                                        <option>Paris</option>
                                                        <option>Casablanca</option>
                                                        <option>Tokyo</option>
                                                        <option>Marraekch</option>
                                                        <option>kyoto , shibua</option>
                                                    </select>
                                                </div>
                                                <div class="col-xs-6">

                                                    <select id="basic" class="selectpicker show-tick form-control">
                                                        <option> -Status- </option>
                                                        <option>Rent </option>
                                                        <option>Boy</option>
                                                        <option>used</option>  

                                                    </select>
                                                </div>
                                            </div>
                                        </fieldset>

                                        <fieldset class="padding-5">
                                            <div class="row">
                                                <div class="col-xs-6">
                                                    <label for="price-range">Price range ($):</label>
                                                    <input type="text" class="span2" value="" data-slider-min="0" 
                                                           data-slider-max="600" data-slider-step="5" 
                                                           data-slider-value="[0,450]" id="price-range" ><br />
                                                    <b class="pull-left color">2000$</b> 
                                                    <b class="pull-right color">100000$</b>                                                
                                                </div>
                                                <div class="col-xs-6">
                                                    <label for="property-geo">Property geo (m2) :</label>
                                                    <input type="text" class="span2" value="" data-slider-min="0" 
                                                           data-slider-max="600" data-slider-step="5" 
                                                           data-slider-value="[50,450]" id="property-geo" ><br />
                                                    <b class="pull-left color">40m</b> 
                                                    <b class="pull-right color">12000m</b>                                                
                                                </div>                                            
                                            </div>
                                        </fieldset>                                

                                        <fieldset class="padding-5">
                                            <div class="row">
                                                <div class="col-xs-6">
                                                    <label for="price-range">Min baths :</label>
                                                    <input type="text" class="span2" value="" data-slider-min="0" 
                                                           data-slider-max="600" data-slider-step="5" 
                                                           data-slider-value="[250,450]" id="min-baths" ><br />
                                                    <b class="pull-left color">1</b> 
                                                    <b class="pull-right color">120</b>                                                
                                                </div>

                                                <div class="col-xs-6">
                                                    <label for="property-geo">Min bed :</label>
                                                    <input type="text" class="span2" value="" data-slider-min="0" 
                                                           data-slider-max="600" data-slider-step="5" 
                                                           data-slider-value="[250,450]" id="min-bed" ><br />
                                                    <b class="pull-left color">1</b> 
                                                    <b class="pull-right color">120</b>

                                                </div>
                                            </div>
                                        </fieldset>

                                        <fieldset class="padding-5">
                                            <div class="row">
                                                <div class="col-xs-6">
                                                    <div class="checkbox">
                                                        <label> <input type="checkbox" checked> Fire Place</label>
                                                    </div> 
                                                </div>

                                                <div class="col-xs-6">
                                                    <div class="checkbox">
                                                        <label> <input type="checkbox"> Dual Sinks</label>
                                                    </div>
                                                </div>                                            
                                            </div>
                                        </fieldset>

                                        <fieldset class="padding-5">
                                            <div class="row">
                                                <div class="col-xs-6"> 
                                                    <div class="checkbox">
                                                        <label> <input type="checkbox" checked> Swimming Pool</label>
                                                    </div>
                                                </div>  
                                                <div class="col-xs-6"> 
                                                    <div class="checkbox">
                                                        <label> <input type="checkbox" checked> 2 Stories </label>
                                                    </div>
                                                </div>  
                                            </div>
                                        </fieldset>

                                        <fieldset class="padding-5">
                                            <div class="row">
                                                <div class="col-xs-6"> 
                                                    <div class="checkbox">
                                                        <label><input type="checkbox"> Laundry Room </label>
                                                    </div>
                                                </div>  
                                                <div class="col-xs-6"> 
                                                    <div class="checkbox">
                                                        <label> <input type="checkbox"> Emergency Exit</label>
                                                    </div>
                                                </div>  
                                            </div>
                                        </fieldset>

                                        <fieldset class="padding-5">
                                            <div class="row">
                                                <div class="col-xs-6"> 
                                                    <div class="checkbox">
                                                        <label>  <input type="checkbox" checked> Jog Path </label>
                                                    </div>
                                                </div>  
                                                <div class="col-xs-6"> 
                                                    <div class="checkbox">
                                                        <label>  <input type="checkbox"> 26' Ceilings </label>
                                                    </div>
                                                </div>  
                                            </div>
                                        </fieldset>

                                        <fieldset class="padding-5">
                                            <div class="row">
                                                <div class="col-xs-12"> 
                                                    <div class="checkbox">
                                                        <label>  <input type="checkbox"> Hurricane Shutters </label>
                                                    </div>
                                                </div>  
                                            </div>
                                        </fieldset>

                                        <fieldset >
                                            <div class="row">
                                                <div class="col-xs-12">  
                                                    <input class="button btn largesearch-btn" value="상담하기" type="submit">
                                                </div>  
                                            </div>
                                        </fieldset>                                     
                                    </form>
                                </div>
                            </div>

                        </aside>
                    </div>
                    <div class="col-md-8 single-property-content prp-style-1 " style="width: 1100px;"> 
                     
                        <section class="product_description_area">
                            <div class="container">
                                <ul class="nav nav-tabs" id="myTab" role="tablist" style="width: 1100px;">
                                    <li class="nav-item">
                                        <a class="nav-link" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Description</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
                                         aria-selected="false">Specification</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
                                         aria-selected="false">House List</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link active" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review"
                                         aria-selected="false">Reviews</a>
                                    </li>
                                </ul>
                                <div class="tab-content" id="myTabContent" style="width: 1100px;">
                                    <div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab" style="margin: 20px;">
                                        <p>${e.esContent}</p>
                                    </div>
                                    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab" style="width: 1100px;">
                                        <div class="table-responsive" style="margin: 20px;">
                                            <table class="table">
                                                <tbody>
                                                    <tr>
                                                        <td style="width: 550px;">
                                                            <h5>중개사무소명</h5>
                                                        </td>
                                                        <td>
                                                            <h5>${e.esName }</h5>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <h5>대표</h5>
                                                        </td>
                                                        <td>
                                                            <h5>${e.esCeo }</h5>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <h5>전화번호</h5>
                                                        </td>
                                                        <td>
                                                            <h5>${e.esPhone} </h5>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <h5>사업자 등록 번호</h5>
                                                        </td>
                                                        <td>
                                                            <h5>${e.esNum }</h5>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <h5>중개 등록 번호</h5>
                                                        </td>
                                                        <td>
                                                            <h5>${e.esRegisterNum }</h5>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <h5>둥집 가입일</h5>
                                                        </td>
                                                        <td>
                                                            <h5>${e.enrollDate }</h5>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <h5>주소</h5>
                                                        </td>
                                                        <td>
                                                            <h5>${e.esAddress }</h5>
                                                        </td>
                                                    </tr>
                                                    
                                                </tbody>
                                            </table>
                                        </div>
                                       
									
										



								</div>
                                    <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab" style="width: 850px;">
                                        <div class="row">
                                            <div class="col-lg">
                                                
                                                <div class="properties-area recent-property" style="background-color: #FFF;">
                                                    <div class="container"> 
                                                        <div class="row  pr0 padding-top-40 properties-page">
                                                            
                                        
                                                            <div class="col-md-12  clear"> 
                                                                <div class="col-xs-10 page-subheader sorting pl0">
                                                                    <ul class="sort-by-list">
                                                                        <li class="active">
                                                                            <a href="javascript:void(0);" class="order_by_date" data-orderby="property_date" data-order="ASC">
                                                                                Property Date <i class="fa fa-sort-amount-asc"></i>					
                                                                            </a>
                                                                        </li>
                                                                        <li class="">
                                                                            <a href="javascript:void(0);" class="order_by_price" data-orderby="property_price" data-order="DESC">
                                                                                Property Price <i class="fa fa-sort-numeric-desc"></i>						
                                                                            </a>
                                                                        </li>
                                                                    </ul><!--/ .sort-by-list-->
                                        
                                                                    <div class="items-per-page">
                                                                        <label for="items_per_page"><b>Property per page :</b></label>
                                                                        <div class="sel">
                                                                            <select id="items_per_page" name="per_page">
                                                                                <option value="3">3</option>
                                                                                <option value="6">6</option>
                                                                                <option value="9">9</option>
                                                                                <option selected="selected" value="12">12</option>
                                                                                <option value="15">15</option>
                                                                                <option value="30">30</option>
                                                                                <option value="45">45</option>
                                                                                <option value="60">60</option>
                                                                            </select>
                                                                        </div><!--/ .sel-->
                                                                    </div><!--/ .items-per-page-->
                                                                </div>
                                        
                                                                <div class="col-xs-2 layout-switcher">
                                                                    <a class="layout-list" href="javascript:void(0);"> <i class="fa fa-th-list"></i>  </a>
                                                                    <a class="layout-grid active" href="javascript:void(0);"> <i class="fa fa-th"></i> </a>                          
                                                                </div><!--/ .layout-switcher-->
                                                            </div>
                                        
                                                            <div class="col-md-12 clear "> 
                                                                <div id="list-type" class="proerty-th">
                                                                    <div class="col-sm-6 col-md-3 p0">
                                                                        <div class="box-two proerty-item">
                                                                            <div class="item-thumb">
                                                                                <a href="property-1.html" ><img src="assets/img/demo/property-3.jpg"></a>
                                                                            </div>
                                        
                                                                            <div class="item-entry overflow">
                                                                                <h5><a href="property-1.html"> Super nice villa </a></h5>
                                                                                <div class="dot-hr"></div>
                                                                                <span class="pull-left"><b> Area :</b> 120m </span>
                                                                                <span class="proerty-price pull-right"> $ 300,000</span>
                                                                                <p style="display: none;">Suspendisse ultricies Suspendisse ultricies Nulla quis dapibus nisl. Suspendisse ultricies commodo arcu nec pretium ...</p>
                                                                                <div class="property-icon">
                                                                                    <img src="assets/img/icon/bed.png">(5)|
                                                                                    <img src="assets/img/icon/shawer.png">(2)|
                                                                                    <img src="assets/img/icon/cars.png">(1)  
                                                                                </div>
                                                                            </div>
                                        
                                        
                                                                        </div>
                                                                    </div> 
                                        
                                                                    <div class="col-sm-6 col-md-3 p0">
                                                                        <div class="box-two proerty-item">
                                                                            <div class="item-thumb">
                                                                                <a href="property-1.html" ><img src="assets/img/demo/property-2.jpg"></a>
                                                                            </div>
                                        
                                                                            <div class="item-entry overflow">
                                                                                <h5><a href="property-1.html"> Super nice villa </a></h5>
                                                                                <div class="dot-hr"></div>
                                                                                <span class="pull-left"><b> Area :</b> 120m </span>
                                                                                <span class="proerty-price pull-right"> $ 300,000</span>
                                                                                <p style="display: none;">Suspendisse ultricies Suspendisse ultricies Nulla quis dapibus nisl. Suspendisse ultricies commodo arcu nec pretium ...</p>
                                                                                <div class="property-icon">
                                                                                    <img src="assets/img/icon/bed.png">(5)|
                                                                                    <img src="assets/img/icon/shawer.png">(2)|
                                                                                    <img src="assets/img/icon/cars.png">(1)  
                                                                                </div>
                                                                            </div>
                                        
                                        
                                                                        </div>
                                                                    </div> 
                                        
                                                                    <div class="col-sm-6 col-md-3 p0">
                                                                        <div class="box-two proerty-item proerty-item-ads">
                                                                            <a href="" ><img src="assets/img/pro-ads.jpg"></a>
                                                                        </div>
                                                                    </div> 
                                        
                                                                    <div class="col-sm-6 col-md-3 p0">
                                                                        <div class="box-two proerty-item">
                                                                            <div class="item-thumb">
                                                                                <a href="property-1.html" ><img src="assets/img/demo/property-3.jpg"></a>
                                                                            </div>
                                        
                                                                            <div class="item-entry overflow">
                                                                                <h5><a href="property-1.html"> Super nice villa </a></h5>
                                                                                <div class="dot-hr"></div>
                                                                                <span class="pull-left"><b> Area :</b> 120m </span>
                                                                                <span class="proerty-price pull-right"> $ 300,000</span>
                                                                                <p style="display: none;">Suspendisse ultricies Suspendisse ultricies Nulla quis dapibus nisl. Suspendisse ultricies commodo arcu nec pretium ...</p>
                                                                                <div class="property-icon">
                                                                                    <img src="assets/img/icon/bed.png">(5)|
                                                                                    <img src="assets/img/icon/shawer.png">(2)|
                                                                                    <img src="assets/img/icon/cars.png">(1)  
                                                                                </div>
                                                                            </div>
                                        
                                        
                                                                        </div>
                                                                    </div> 
                                        
                                                                    <div class="col-sm-6 col-md-3 p0">
                                                                        <div class="box-two proerty-item">
                                                                            <div class="item-thumb">
                                                                                <a href="property-1.html" ><img src="assets/img/demo/property-1.jpg"></a>
                                                                            </div>
                                        
                                                                            <div class="item-entry overflow">
                                                                                <h5><a href="property-1.html"> Super nice villa </a></h5>
                                                                                <div class="dot-hr"></div>
                                                                                <span class="pull-left"><b> Area :</b> 120m </span>
                                                                                <span class="proerty-price pull-right"> $ 300,000</span>
                                                                                <p style="display: none;">Suspendisse ultricies Suspendisse ultricies Nulla quis dapibus nisl. Suspendisse ultricies commodo arcu nec pretium ...</p>
                                                                                <div class="property-icon">
                                                                                    <img src="assets/img/icon/bed.png">(5)|
                                                                                    <img src="assets/img/icon/shawer.png">(2)|
                                                                                    <img src="assets/img/icon/cars.png">(1)  
                                                                                </div>
                                                                            </div>
                                        
                                        
                                                                        </div>
                                                                    </div> 
                                        
                                                                    <div class="col-sm-6 col-md-3 p0">
                                                                        <div class="box-two proerty-item">
                                                                            <div class="item-thumb">
                                                                                <a href="property-1.html" ><img src="assets/img/demo/property-2.jpg"></a>
                                                                            </div>
                                        
                                                                            <div class="item-entry overflow">
                                                                                <h5><a href="property-1.html"> Super nice villa </a></h5>
                                                                                <div class="dot-hr"></div>
                                                                                <span class="pull-left"><b> Area :</b> 120m </span>
                                                                                <span class="proerty-price pull-right"> $ 300,000</span>
                                                                                <p style="display: none;">Suspendisse ultricies Suspendisse ultricies Nulla quis dapibus nisl. Suspendisse ultricies commodo arcu nec pretium ...</p>
                                                                                <div class="property-icon">
                                                                                    <img src="assets/img/icon/bed.png">(5)|
                                                                                    <img src="assets/img/icon/shawer.png">(2)|
                                                                                    <img src="assets/img/icon/cars.png">(1)  
                                                                                </div>
                                                                            </div>
                                        
                                        
                                                                        </div>
                                                                    </div> 
                                        
                                                                    <div class="col-sm-6 col-md-3 p0">
                                                                        <div class="box-two proerty-item">
                                                                            <div class="item-thumb">
                                                                                <a href="property-1.html" ><img src="assets/img/demo/property-3.jpg"></a>
                                                                            </div>
                                        
                                                                            <div class="item-entry overflow">
                                                                                <h5><a href="property-1.html"> Super nice villa </a></h5>
                                                                                <div class="dot-hr"></div>
                                                                                <span class="pull-left"><b> Area :</b> 120m </span>
                                                                                <span class="proerty-price pull-right"> $ 300,000</span>
                                                                                <p style="display: none;">Suspendisse ultricies Suspendisse ultricies Nulla quis dapibus nisl. Suspendisse ultricies commodo arcu nec pretium ...</p>
                                                                                <div class="property-icon">
                                                                                    <img src="assets/img/icon/bed.png">(5)|
                                                                                    <img src="assets/img/icon/shawer.png">(2)|
                                                                                    <img src="assets/img/icon/cars.png">(1)  
                                                                                </div>
                                                                            </div>
                                        
                                        
                                                                        </div>
                                                                    </div> 
                                        
                                                                    <div class="col-sm-6 col-md-3 p0" >
                                                                        <div class="box-two proerty-item">
                                                                            <div class="item-thumb">
                                                                                <a href="property-1.html" ><img src="assets/img/demo/property-2.jpg"></a>
                                                                            </div>
                                        
                                                                            <div class="item-entry overflow">
                                                                                <h5><a href="property-1.html"> Super nice villa </a></h5>
                                                                                <div class="dot-hr"></div>
                                                                                <span class="pull-left"><b> Area :</b> 120m </span>
                                                                                <span class="proerty-price pull-right"> $ 300,000</span>
                                                                                <p style="display: none;">Suspendisse ultricies Suspendisse ultricies Nulla quis dapibus nisl. Suspendisse ultricies commodo arcu nec pretium ...</p>
                                                                                <div class="property-icon">
                                                                                    <img src="assets/img/icon/bed.png">(5)|
                                                                                    <img src="assets/img/icon/shawer.png">(2)|
                                                                                    <img src="assets/img/icon/cars.png">(1)  
                                                                                </div>
                                                                            </div>
                                        
                                        
                                                                        </div>
                                                                    </div> 
                                        
                                                                    <div class="col-sm-6 col-md-3 p0">
                                                                        <div class="box-two proerty-item">
                                                                            <div class="item-thumb">
                                                                                <a href="property-1.html" ><img src="assets/img/demo/property-1.jpg"></a>
                                                                            </div>
                                        
                                                                            <div class="item-entry overflow">
                                                                                <h5><a href="property-1.html"> Super nice villa </a></h5>
                                                                                <div class="dot-hr"></div>
                                                                                <span class="pull-left"><b> Area :</b> 120m </span>
                                                                                <span class="proerty-price pull-right"> $ 300,000</span>
                                                                                <p style="display: none;">Suspendisse ultricies Suspendisse ultricies Nulla quis dapibus nisl. Suspendisse ultricies commodo arcu nec pretium ...</p>
                                                                                <div class="property-icon">
                                                                                    <img src="assets/img/icon/bed.png">(5)|
                                                                                    <img src="assets/img/icon/shawer.png">(2)|
                                                                                    <img src="assets/img/icon/cars.png">(1)  
                                                                                </div>
                                                                            </div>
                                        
                                        
                                                                        </div>
                                                                    </div> 
                                                                    
                                                                    <div class="col-sm-6 col-md-3 p0">
                                                                        <div class="box-two proerty-item proerty-item-ads">
                                                                            <a href="" ><img src="assets/img/pro-ads.jpg"></a>
                                                                        </div>
                                                                    </div>
                                        
                                                                    <div class="col-sm-6 col-md-3 p0">
                                                                        <div class="box-two proerty-item">
                                                                            <div class="item-thumb">
                                                                                <a href="property-1.html" ><img src="assets/img/demo/property-2.jpg"></a>
                                                                            </div>
                                        
                                                                            <div class="item-entry overflow">
                                                                                <h5><a href="property-1.html"> Super nice villa </a></h5>
                                                                                <div class="dot-hr"></div>
                                                                                <span class="pull-left"><b> Area :</b> 120m </span>
                                                                                <span class="proerty-price pull-right"> $ 300,000</span>
                                                                                <p style="display: none;">Suspendisse ultricies Suspendisse ultricies Nulla quis dapibus nisl. Suspendisse ultricies commodo arcu nec pretium ...</p>
                                                                                <div class="property-icon">
                                                                                    <img src="assets/img/icon/bed.png">(5)|
                                                                                    <img src="assets/img/icon/shawer.png">(2)|
                                                                                    <img src="assets/img/icon/cars.png">(1)  
                                                                                </div>
                                                                            </div>
                                        
                                        
                                                                        </div>
                                                                    </div> 
                                        
                                                                    <div class="col-sm-6 col-md-3 p0">
                                                                        <div class="box-two proerty-item">
                                                                            <div class="item-thumb">
                                                                                <a href="property-1.html" ><img src="assets/img/demo/property-1.jpg"></a>
                                                                            </div>
                                        
                                                                            <div class="item-entry overflow">
                                                                                <h5><a href="property-1.html"> Super nice villa </a></h5>
                                                                                <div class="dot-hr"></div>
                                                                                <span class="pull-left"><b> Area :</b> 120m </span>
                                                                                <span class="proerty-price pull-right"> $ 300,000</span>
                                                                                <p style="display: none;">Suspendisse ultricies Suspendisse ultricies Nulla quis dapibus nisl. Suspendisse ultricies commodo arcu nec pretium ...</p>
                                                                                <div class="property-icon">
                                                                                    <img src="assets/img/icon/bed.png">(5)|
                                                                                    <img src="assets/img/icon/shawer.png">(2)|
                                                                                    <img src="assets/img/icon/cars.png">(1)  
                                                                                </div>
                                                                            </div>
                                        
                                        
                                                                        </div>
                                                                    </div> 
                                                                </div>
                                                            </div>
                                        
                                                            <div class="col-md-12 clear text-right center"> 
                                                                
                                                                    <div class="pagination">
                                                                        <ul>
                                                                            <li><a href="#">Prev</a></li>
                                                                            <li><a href="#">1</a></li>
                                                                            <li><a href="#">2</a></li>
                                                                            <li><a href="#">3</a></li>
                                                                            <li><a href="#">4</a></li>
                                                                            <li><a href="#">Next</a></li>
                                                                        </ul>
                                                                    </div>
                                                                               
                                                            </div>
                                                        </div>                
                                                    </div>
                                                </div>
                                        
                    
                                            </div>
                                            
                                        </div>
                                    </div>
                                    <div class="tab-pane fade active" id="review" role="tabpanel" aria-labelledby="review-tab" style="width: 850px;">
                                        <div class="row">
                                            <div class="col-lg">
                                                <div class="row total_rate" style="display: flex;">
                                                    <div class="col-6" style="flex:1">
                                                        <div class="box_total"  >
                                                            <br>
                
                                                            <h3 style="text-align: center; font-weight: bold; margin: 20px 0 0 0;">Overall</h3>
                                                            
                                                            <h1 style="text-align: center; color: #D27E04; font-weight: bold; margin: 0;">4.0</h1>
                                                            
                                                            <h5 style="text-align: center;">(03 Reviews)</h5>
                                                        </div>
                                                    </div>
                                                    <div class="col-6" style="flex:0.3">
                                                        <div class="rating_list" style="margin-top:25px;">
                                                            <h5 style="text-align: left;">Based on 3 Reviews</h5>
                                                            <ul class="list" style="padding: 0;">
                                                                <li><a href="#" id="num">5 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                                         class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
                                                                <li><a href="#" id="num">4 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                                         class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
                                                                <li><a href="#" id="num">3 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                                         class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
                                                                <li><a href="#" id="num">2 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                                         class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
                                                                <li><a href="#" id="num">1 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                                         class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="review_list" style="width: 1100px;">
                                                    <div class="review_item">
                                                        <div class="media">
                                                            <div class="d-flex">
                                                                <img src="resources/img/product/review-1.png" alt="">
                                                            </div>
                                                            <div class="media-body">
                                                                <h4>Blake Ruiz</h4>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </div>
                                                        </div>
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                                                            dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
                                                            commodo</p>
                                                    </div>
                                                    <div class="review_item">
                                                        <div class="media">
                                                            <div class="d-flex">
                                                                <img src="resources/img/product/review-2.png" alt="">
                                                            </div>
                                                            <div class="media-body">
                                                                <h4>Blake Ruiz</h4>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </div>
                                                        </div>
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                                                            dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
                                                            commodo</p>
                                                    </div>
                                                    <div class="review_item">
                                                        <div class="media">
                                                            <div class="d-flex">
                                                                <img src="resources/img/product/review-3.png" alt="">
                                                            </div>
                                                            <div class="media-body">
                                                                <h4>Blake Ruiz</h4>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </div>
                                                        </div>
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                                                            dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
                                                            commodo</p>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                           
     <div id="map" style="width:1000px;height:500px; "></div>
                                        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c9d3f1c90fc1cea85b8bb8303f360c81&libraries=services,clusterer,drawing"></script>
			
    
                     
                    </div>
                        
                    </div>

                   
                    


                    
                </div>

            </div>
        </div>


          <!-- Footer area-->
        
        
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

        <script>
            $(document).ready(function() {
                // Description 탭을 활성화
                $('#myTab a[href="#profile"]').tab('show');
              
            });
        </script>
     
			<script>
			
			
			
			$(document).ready(function() {
			    // myTab 링크 클릭 시 함수 실행
			   
			        // 클릭 시 실행하고자 하는 함수 내용
			        var container = document.getElementById('map'); // 지도를 담을 영역
			        container.style.display = 'block';
			        var options = {
			            center: new kakao.maps.LatLng(37.533067592513866, 126.89622037964806),
			            level: 3
			        };
			        var map = new kakao.maps.Map(container, options);
			        var geocoder = new kakao.maps.services.Geocoder();
			        // 주소로 좌표를 검색합니다
			        geocoder.addressSearch('${e.esAddress}', function(result, status) {
			            // 정상적으로 검색이 완료됐으면
			            if (status === kakao.maps.services.Status.OK) {
			                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			                var marker = new kakao.maps.Marker({
			                    map: map,
			                    position: coords
			                });
			                var infowindow = new kakao.maps.InfoWindow({
			                    content: '<div style="width:200px;padding:0 0 0 7px;z-index:1;">${e.esName}</div>'
			                });
			                infowindow.open(map, marker);
							
			                map.setCenter(coords);
			            }
			        });
		
			        $('#review-tab, #contact-tab, #home-tab' ).on('click', function () {
				        var container = document.getElementById('map');
				        container.style.display = 'none';
				    });
			        
			        
			        $('#profile-tab').on('click', function () {
			            container.style.display = 'block';
			        });
			});
			
			

			</script>
        
        
        <%@ include file="../common/footer.jsp"%>

    </body>
</html>
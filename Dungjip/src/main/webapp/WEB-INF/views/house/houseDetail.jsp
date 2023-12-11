<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>집 상세 페이지</title>
<meta name="description" content="company is a real-estate template">
<meta name="author" content="Kimarotec">
<meta name="keyword"
	content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800'
	rel='stylesheet' type='text/css'>


<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="icon" href="favicon.ico" type="image/x-icon">




<link rel="stylesheet" href="resources/assets/css/lightslider.min.css">

<style>
.fa-star {
	color: #D27E04;
}

#num {
	color: #D27E04;
}
</style>
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
				<div class="page-head-content"></div>
			</div>
		</div>
	</div>
	<!-- End page header -->

	<!-- property area -->
	<div class="content-area single-property"
		style="background-color: #FCFCFC;">
		&nbsp;
		<div class="container">

			<div class="clearfix padding-top-40">

				<div class="col-md-8 single-property-content prp-style-1 ">
					<div class="row">
						<div class="light-slide-item">
							<div class="clearfix">
								<div class="favorite-and-print">
									<a class="add-to-fav" href="#login-modal" data-toggle="modal">
										<i class="fa fa-star-o"></i>
									</a> <a class="printer-icon " href="javascript:window.print()">
										<i class="fa fa-print"></i>
									</a>
								</div>

								<ul id="image-gallery" class="gallery list-unstyled cS-hidden">
									<li data-thumb="resources/assets/img/property-1/property1.jpg"
										style="width: 1000px";><img
										src="resources/assets/img/property-1/property1.jpg" /></li>
									<li data-thumb="resources/assets/img/property-1/property2.jpg">
										<img src="resources/assets/img/property-1/property3.jpg" />
									</li>
									<li data-thumb="resources/assets/img/property-1/property3.jpg">
										<img src="resources/assets/img/property-1/property3.jpg" />
									</li>
									<li data-thumb="resources/assets/img/property-1/property4.jpg">
										<img src="resources/assets/img/property-1/property4.jpg" />
									</li>
								</ul>
							</div>
						</div>
					</div>

					<div class="single-property-wrapper">
						<div class="single-property-header">
							<h1 class="property-title pull-left">Villa in Coral Gables</h1>
							<span class="property-price pull-right">$825,000</span>
						</div>

						<div class="property-meta entry-meta clearfix ">

							<div class="col-xs-6 col-sm-3 col-md-3 p-b-15">
								<span class="property-info-icon icon-tag"> <img
									src="resources/assets/img/icon/sale-orange.png">
								</span> <span class="property-info-entry"> <span
									class="property-info-label">Status</span> <span
									class="property-info-value">For Sale</span>
								</span>
							</div>

							<div class="col-xs-6 col-sm-3 col-md-3 p-b-15">
								<span class="property-info icon-area"> <img
									src="resources/assets/img/icon/room-orange.png">
								</span> <span class="property-info-entry"> <span
									class="property-info-label">Area</span> <span
									class="property-info-value">3500<b
										class="property-info-unit">Sq Ft</b></span>
								</span>
							</div>

							<div class="col-xs-6 col-sm-3 col-md-3 p-b-15">
								<span class="property-info-icon icon-bed"> <img
									src="resources/assets/img/icon/bed-orange.png">
								</span> <span class="property-info-entry"> <span
									class="property-info-label">Bedrooms</span> <span
									class="property-info-value">3</span>
								</span>
							</div>

							<div class="col-xs-6 col-sm-3 col-md-3 p-b-15">
								<span class="property-info-icon icon-bed"> <img
									src="resources/assets/img/icon/cars-orange.png">
								</span> <span class="property-info-entry"> <span
									class="property-info-label">Car garages</span> <span
									class="property-info-value">1</span>
								</span>
							</div>

							<div class="col-xs-6 col-sm-3 col-md-3 p-b-15">
								<span class="property-info-icon icon-bath"> <img
									src="resources/assets/img/icon/os-orange.png">
								</span> <span class="property-info-entry"> <span
									class="property-info-label">Bathrooms</span> <span
									class="property-info-value">3.5</span>
								</span>
							</div>

							<div class="col-xs-6 col-sm-3 col-md-3 p-b-15">
								<span class="property-info-icon icon-garage"> <img
									src="resources/assets/img/icon/room-orange.png">
								</span> <span class="property-info-entry"> <span
									class="property-info-label">Garages</span> <span
									class="property-info-value">2</span>
								</span>
							</div>

							<div class="col-xs-6 col-sm-3 col-md-3 p-b-15">
								<span class="property-info-icon icon-garage"> <img
									src="resources/assets/img/icon/shawer-orange.png">
								</span> <span class="property-info-entry"> <span
									class="property-info-label">Garages</span> <span
									class="property-info-value">2</span>
								</span>
							</div>


						</div>
						<!-- .property-meta -->


						<!-- End description area  -->


						<!-- End additional-details area  -->

						<div class="section property-features">

							<h4 class="s-property-title">Features</h4>
							<ul>
								<li><a href="properties.html">Swimming Pool</a></li>
								<li><a href="properties.html">3 Stories</a></li>
								<li><a href="properties.html">Central Cooling</a></li>
								<li><a href="properties.html">Jog Path 2</a></li>
								<li><a href="properties.html">2 Lawn</a></li>
								<li><a href="properties.html">Bike Path</a></li>
							</ul>

						</div>
						<!-- End features area  -->


						<!-- End video area  -->




						<!-- End video area  -->

					</div>
				</div>
				<div class="col-md-4 p0">
					<aside class="sidebar sidebar-property blog-asside-right">
						<div class="dealer-widget">
							<c:forEach var="estate" items="${elist}">
								<div class="dealer-content">
									<div class="inner-wrapper">
										<div class="clear">
											<div class="col-xs-4 col-sm-4 dealer-face">
												<a href=""> <img src="resources/img/person/${estate.esImage} "
													class="img-circle">
												</a>
											</div>
											<div class="col-xs-8 col-sm-8">
												<h3 class="dealer-name">
													<a href="" style="font-size: 14px;">${estate.esName}</a> 
												</h3>
											</div>
										</div>
										<div class="clear">
											<!-- 추가적인 내용이 있다면 여기에 추가할 수 있습니다. -->
										</div>
									</div>
								</div>
							</c:forEach>






							<div
								class="panel panel-default sidebar-menu wow fadeInRight animated">
								<div class="panel-heading">
									<h3 class="panel-title">Smart search</h3>
								</div>
								<div class="panel-body search-widget">
									<form action="" class=" form-inline">
										<fieldset>
											<div class="row">
												<div class="col-xs-12">
													<input type="text" class="form-control"
														placeholder="Key word">
												</div>
											</div>
										</fieldset>

										<fieldset>
											<div class="row">
												<div class="col-xs-6">

													<select id="lunchBegins" class="selectpicker"
														data-live-search="true" data-live-search-style="begins"
														title="Select Your City">

														<option>New york, CA</option>
														<option>Paris</option>
														<option>Casablanca</option>
														<option>Tokyo</option>
														<option>Marraekch</option>
														<option>kyoto , shibua</option>
													</select>
												</div>
												<div class="col-xs-6">

													<select id="basic"
														class="selectpicker show-tick form-control">
														<option>-Status-</option>
														<option>Rent</option>
														<option>Boy</option>
														<option>used</option>

													</select>
												</div>
											</div>
										</fieldset>

										<fieldset class="padding-5">
											<div class="row">
												<div class="col-xs-6">
													<label for="price-range">Price range ($):</label> <input
														type="text" class="span2" value="" data-slider-min="0"
														data-slider-max="600" data-slider-step="5"
														data-slider-value="[0,450]" id="price-range"><br />
													<b class="pull-left color">2000$</b> <b
														class="pull-right color">100000$</b>
												</div>
												<div class="col-xs-6">
													<label for="property-geo">Property geo (m2) :</label> <input
														type="text" class="span2" value="" data-slider-min="0"
														data-slider-max="600" data-slider-step="5"
														data-slider-value="[50,450]" id="property-geo"><br />
													<b class="pull-left color">40m</b> <b
														class="pull-right color">12000m</b>
												</div>
											</div>
										</fieldset>

										<fieldset class="padding-5">
											<div class="row">
												<div class="col-xs-6">
													<label for="price-range">Min baths :</label> <input
														type="text" class="span2" value="" data-slider-min="0"
														data-slider-max="600" data-slider-step="5"
														data-slider-value="[250,450]" id="min-baths"><br />
													<b class="pull-left color">1</b> <b
														class="pull-right color">120</b>
												</div>

												<div class="col-xs-6">
													<label for="property-geo">Min bed :</label> <input
														type="text" class="span2" value="" data-slider-min="0"
														data-slider-max="600" data-slider-step="5"
														data-slider-value="[250,450]" id="min-bed"><br />
													<b class="pull-left color">1</b> <b
														class="pull-right color">120</b>

												</div>
											</div>
										</fieldset>

										<fieldset class="padding-5">
											<div class="row">
												<div class="col-xs-6">
													<div class="checkbox">
														<label> <input type="checkbox" checked>
															Fire Place
														</label>
													</div>
												</div>

												<div class="col-xs-6">
													<div class="checkbox">
														<label> <input type="checkbox"> Dual Sinks
														</label>
													</div>
												</div>
											</div>
										</fieldset>

										<fieldset class="padding-5">
											<div class="row">
												<div class="col-xs-6">
													<div class="checkbox">
														<label> <input type="checkbox" checked>
															Swimming Pool
														</label>
													</div>
												</div>
												<div class="col-xs-6">
													<div class="checkbox">
														<label> <input type="checkbox" checked> 2
															Stories
														</label>
													</div>
												</div>
											</div>
										</fieldset>

										<fieldset class="padding-5">
											<div class="row">
												<div class="col-xs-6">
													<div class="checkbox">
														<label><input type="checkbox"> Laundry
															Room </label>
													</div>
												</div>
												<div class="col-xs-6">
													<div class="checkbox">
														<label> <input type="checkbox"> Emergency
															Exit
														</label>
													</div>
												</div>
											</div>
										</fieldset>

										<fieldset class="padding-5">
											<div class="row">
												<div class="col-xs-6">
													<div class="checkbox">
														<label> <input type="checkbox" checked>
															Jog Path
														</label>
													</div>
												</div>
												<div class="col-xs-6">
													<div class="checkbox">
														<label> <input type="checkbox"> 26'
															Ceilings
														</label>
													</div>
												</div>
											</div>
										</fieldset>

										<fieldset class="padding-5">
											<div class="row">
												<div class="col-xs-12">
													<div class="checkbox">
														<label> <input type="checkbox"> Hurricane
															Shutters
														</label>
													</div>
												</div>
											</div>
										</fieldset>

										<fieldset>
											<div class="row">
												<div class="col-xs-12">
													<input class="button btn largesearch-btn" value="Search"
														type="submit">
												</div>
											</div>
										</fieldset>
									</form>
								</div>
							</div>
					</aside>
				</div>
			</div>

			<section class="product_description_area">
				<div class="container">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item"><a class="nav-link active" id="home-tab"
							data-toggle="tab" href="#home" role="tab" aria-controls="home"
							aria-selected="true">Description</a></li>

						<li class="nav-item"><a class="nav-link" id="profile-tab"
							data-toggle="tab" href="#profile" role="tab"
							aria-controls="profile" aria-selected="false">Specification</a></li>
						<li class="nav-item"><a class="nav-link" id="contact-tab"
							data-toggle="tab" href="#contact" role="tab"
							aria-controls="contact" aria-selected="false">Comments</a></li>
						<li class="nav-item"><a class="nav-link active"
							id="review-tab" data-toggle="tab" href="#review" role="tab"
							aria-controls="review" aria-selected="false">Reviews</a></li>
					</ul>
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade" id="home" role="tabpanel"
							aria-labelledby="home-tab" style="margin: 20px;">
							<p>Beryl Cook is one of Britain’s most talented and amusing
								artists .Beryl’s pictures feature women of all shapes and sizes
								enjoying themselves .Born between the two world wars, Beryl Cook
								eventually left Kendrick School in Reading at the age of 15,
								where she went to secretarial school and then into an insurance
								office. After moving to London and then Hampton, she eventually
								married her next door neighbour from Reading, John Cook. He was
								an officer in the Merchant Navy and after he left the sea in
								1956, they bought a pub for a year before John took a job in
								Southern Rhodesia with a motor company. Beryl bought their young
								son a box of watercolours, and when showing him how to use it,
								she decided that she herself quite enjoyed painting. John
								subsequently bought her a child’s painting set for her birthday
								and it was with this that she produced her first significant
								work, a half-length portrait of a dark-skinned lady with a
								vacant expression and large drooping breasts. It was aptly named
								‘Hangover’ by Beryl’s husband and</p>
							<p>It is often frustrating to attempt to plan meals that are
								designed for one. Despite this fact, we are seeing more and more
								recipe books and Internet websites that are dedicated to the act
								of cooking for one. Divorce and the death of spouses or grown
								children leaving for college are all reasons that someone
								accustomed to cooking for more than one would suddenly need to
								learn how to adjust all the cooking practices utilized before
								into a streamlined plan of cooking that is more efficient for
								one person creating less</p>
						</div>
						<div class="tab-pane fade" id="profile" role="tabpanel"
							aria-labelledby="profile-tab">
							<div class="table-responsive" style="margin: 20px;">
								<table class="table">
									<tbody>
										<tr>
											<td>
												<h5>Width</h5>
											</td>
											<td>
												<h5>128mm</h5>
											</td>
										</tr>
										<tr>
											<td>
												<h5>Height</h5>
											</td>
											<td>
												<h5>508mm</h5>
											</td>
										</tr>
										<tr>
											<td>
												<h5>Depth</h5>
											</td>
											<td>
												<h5>85mm</h5>
											</td>
										</tr>
										<tr>
											<td>
												<h5>Weight</h5>
											</td>
											<td>
												<h5>52gm</h5>
											</td>
										</tr>
										<tr>
											<td>
												<h5>Quality checking</h5>
											</td>
											<td>
												<h5>yes</h5>
											</td>
										</tr>
										<tr>
											<td>
												<h5>Freshness Duration</h5>
											</td>
											<td>
												<h5>03days</h5>
											</td>
										</tr>
										<tr>
											<td>
												<h5>When packeting</h5>
											</td>
											<td>
												<h5>Without touch of hand</h5>
											</td>
										</tr>
										<tr>
											<td>
												<h5>Each Box contains</h5>
											</td>
											<td>
												<h5>60pcs</h5>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="tab-pane fade" id="contact" role="tabpanel"
							aria-labelledby="contact-tab">
							<div class="row">
								<div class="col-lg">

									<div class="properties-area recent-property"
										style="background-color: #FFF;">
										<div class="container">
											<div class="row  pr0 padding-top-40 properties-page">


												<div class="col-md-12  clear">
													<div class="col-xs-10 page-subheader sorting pl0">
														<ul class="sort-by-list">
															<li class="active"><a href="javascript:void(0);"
																class="order_by_date" data-orderby="property_date"
																data-order="ASC"> Property Date <i
																	class="fa fa-sort-amount-asc"></i>
															</a></li>
															<li class=""><a href="javascript:void(0);"
																class="order_by_price" data-orderby="property_price"
																data-order="DESC"> Property Price <i
																	class="fa fa-sort-numeric-desc"></i>
															</a></li>
														</ul>
														<!--/ .sort-by-list-->

														<div class="items-per-page">
															<label for="items_per_page"><b>Property per
																	page :</b></label>
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
															</div>
															<!--/ .sel-->
														</div>
														<!--/ .items-per-page-->
													</div>

													<div class="col-xs-2 layout-switcher">
														<a class="layout-list" href="javascript:void(0);"> <i
															class="fa fa-th-list"></i>
														</a> <a class="layout-grid active" href="javascript:void(0);">
															<i class="fa fa-th"></i>
														</a>
													</div>
													<!--/ .layout-switcher-->
												</div>

												<div class="col-md-12 clear ">
													<div id="list-type" class="proerty-th">
														<div class="col-sm-6 col-md-3 p0">
															<div class="box-two proerty-item">
																<div class="item-thumb">
																	<a href="property-1.html"><img
																		src="resources/assets/img/demo/property-3.jpg"></a>
																</div>

																<div class="item-entry overflow">
																	<h5>
																		<a href="property-1.html"> Super nice villa </a>
																	</h5>
																	<div class="dot-hr"></div>
																	<span class="pull-left"><b> Area :</b> 120m </span> <span
																		class="proerty-price pull-right"> $ 300,000</span>
																	<p style="display: none;">Suspendisse ultricies
																		Suspendisse ultricies Nulla quis dapibus nisl.
																		Suspendisse ultricies commodo arcu nec pretium ...</p>
																	<div class="property-icon">
																		<img src="resources/assets/img/icon/bed.png">(5)|
																		<img src="resources/assets/img/icon/shawer.png">(2)|
																		<img src="resources/assets/img/icon/cars.png">(1)
																	</div>
																</div>


															</div>
														</div>

														<div class="col-sm-6 col-md-3 p0">
															<div class="box-two proerty-item">
																<div class="item-thumb">
																	<a href="property-1.html"><img
																		src="resources/assets/img/demo/property-2.jpg"></a>
																</div>

																<div class="item-entry overflow">
																	<h5>
																		<a href="property-1.html"> Super nice villa </a>
																	</h5>
																	<div class="dot-hr"></div>
																	<span class="pull-left"><b> Area :</b> 120m </span> <span
																		class="proerty-price pull-right"> $ 300,000</span>
																	<p style="display: none;">Suspendisse ultricies
																		Suspendisse ultricies Nulla quis dapibus nisl.
																		Suspendisse ultricies commodo arcu nec pretium ...</p>
																	<div class="property-icon">
																		<img src="resources/assets/img/icon/bed.png">(5)|
																		<img src="resources/assets/img/icon/shawer.png">(2)|
																		<img src="resources/assets/img/icon/cars.png">(1)
																	</div>
																</div>


															</div>
														</div>

														<div class="col-sm-6 col-md-3 p0">
															<div class="box-two proerty-item proerty-item-ads">
																<a href=""><img
																	src="resources/assets/img/pro-ads.jpg"></a>
															</div>
														</div>

														<div class="col-sm-6 col-md-3 p0">
															<div class="box-two proerty-item">
																<div class="item-thumb">
																	<a href="property-1.html"><img
																		src="resources/assets/img/demo/property-3.jpg"></a>
																</div>

																<div class="item-entry overflow">
																	<h5>
																		<a href="property-1.html"> Super nice villa </a>
																	</h5>
																	<div class="dot-hr"></div>
																	<span class="pull-left"><b> Area :</b> 120m </span> <span
																		class="proerty-price pull-right"> $ 300,000</span>
																	<p style="display: none;">Suspendisse ultricies
																		Suspendisse ultricies Nulla quis dapibus nisl.
																		Suspendisse ultricies commodo arcu nec pretium ...</p>
																	<div class="property-icon">
																		<img src="resources/assets/img/icon/bed.png">(5)|
																		<img src="resources/assets/img/icon/shawer.png">(2)|
																		<img src="resources/assets/img/icon/cars.png">(1)
																	</div>
																</div>


															</div>
														</div>

														<div class="col-sm-6 col-md-3 p0">
															<div class="box-two proerty-item">
																<div class="item-thumb">
																	<a href="property-1.html"><img
																		src="resources/assets/img/demo/property-1.jpg"></a>
																</div>

																<div class="item-entry overflow">
																	<h5>
																		<a href="property-1.html"> Super nice villa </a>
																	</h5>
																	<div class="dot-hr"></div>
																	<span class="pull-left"><b> Area :</b> 120m </span> <span
																		class="proerty-price pull-right"> $ 300,000</span>
																	<p style="display: none;">Suspendisse ultricies
																		Suspendisse ultricies Nulla quis dapibus nisl.
																		Suspendisse ultricies commodo arcu nec pretium ...</p>
																	<div class="property-icon">
																		<img src="resources/assets/img/icon/bed.png">(5)|
																		<img src="resources/assets/img/icon/shawer.png">(2)|
																		<img src="resources/assets/img/icon/cars.png">(1)
																	</div>
																</div>


															</div>
														</div>

														<div class="col-sm-6 col-md-3 p0">
															<div class="box-two proerty-item">
																<div class="item-thumb">
																	<a href="property-1.html"><img
																		src="resources/assets/img/demo/property-2.jpg"></a>
																</div>

																<div class="item-entry overflow">
																	<h5>
																		<a href="property-1.html"> Super nice villa </a>
																	</h5>
																	<div class="dot-hr"></div>
																	<span class="pull-left"><b> Area :</b> 120m </span> <span
																		class="proerty-price pull-right"> $ 300,000</span>
																	<p style="display: none;">Suspendisse ultricies
																		Suspendisse ultricies Nulla quis dapibus nisl.
																		Suspendisse ultricies commodo arcu nec pretium ...</p>
																	<div class="property-icon">
																		<img src="resources/assets/img/icon/bed.png">(5)|
																		<img src="resources/assets/img/icon/shawer.png">(2)|
																		<img src="resources/assets/img/icon/cars.png">(1)
																	</div>
																</div>


															</div>
														</div>

														<div class="col-sm-6 col-md-3 p0">
															<div class="box-two proerty-item">
																<div class="item-thumb">
																	<a href="property-1.html"><img
																		src="resources/assets/img/demo/property-3.jpg"></a>
																</div>

																<div class="item-entry overflow">
																	<h5>
																		<a href="property-1.html"> Super nice villa </a>
																	</h5>
																	<div class="dot-hr"></div>
																	<span class="pull-left"><b> Area :</b> 120m </span> <span
																		class="proerty-price pull-right"> $ 300,000</span>
																	<p style="display: none;">Suspendisse ultricies
																		Suspendisse ultricies Nulla quis dapibus nisl.
																		Suspendisse ultricies commodo arcu nec pretium ...</p>
																	<div class="property-icon">
																		<img src="resources/assets/img/icon/bed.png">(5)|
																		<img src="resources/assets/img/icon/shawer.png">(2)|
																		<img src="resources/assets/img/icon/cars.png">(1)
																	</div>
																</div>


															</div>
														</div>

														<div class="col-sm-6 col-md-3 p0">
															<div class="box-two proerty-item">
																<div class="item-thumb">
																	<a href="property-1.html"><img
																		src="resources/assets/img/demo/property-2.jpg"></a>
																</div>

																<div class="item-entry overflow">
																	<h5>
																		<a href="property-1.html"> Super nice villa </a>
																	</h5>
																	<div class="dot-hr"></div>
																	<span class="pull-left"><b> Area :</b> 120m </span> <span
																		class="proerty-price pull-right"> $ 300,000</span>
																	<p style="display: none;">Suspendisse ultricies
																		Suspendisse ultricies Nulla quis dapibus nisl.
																		Suspendisse ultricies commodo arcu nec pretium ...</p>
																	<div class="property-icon">
																		<img src="resources/assets/img/icon/bed.png">(5)|
																		<img src="resources/assets/img/icon/shawer.png">(2)|
																		<img src="resources/assets/img/icon/cars.png">(1)
																	</div>
																</div>


															</div>
														</div>

														<div class="col-sm-6 col-md-3 p0">
															<div class="box-two proerty-item">
																<div class="item-thumb">
																	<a href="property-1.html"><img
																		src="resources/assets/img/demo/property-1.jpg"></a>
																</div>

																<div class="item-entry overflow">
																	<h5>
																		<a href="property-1.html"> Super nice villa </a>
																	</h5>
																	<div class="dot-hr"></div>
																	<span class="pull-left"><b> Area :</b> 120m </span> <span
																		class="proerty-price pull-right"> $ 300,000</span>
																	<p style="display: none;">Suspendisse ultricies
																		Suspendisse ultricies Nulla quis dapibus nisl.
																		Suspendisse ultricies commodo arcu nec pretium ...</p>
																	<div class="property-icon">
																		<img src="resources/assets/img/icon/bed.png">(5)|
																		<img src="resources/assets/img/icon/shawer.png">(2)|
																		<img src="resources/assets/img/icon/cars.png">(1)
																	</div>
																</div>


															</div>
														</div>

														<div class="col-sm-6 col-md-3 p0">
															<div class="box-two proerty-item proerty-item-ads">
																<a href=""><img
																	src="resources/assets/img/pro-ads.jpg"></a>
															</div>
														</div>

														<div class="col-sm-6 col-md-3 p0">
															<div class="box-two proerty-item">
																<div class="item-thumb">
																	<a href="property-1.html"><img
																		src="resources/assets/img/demo/property-2.jpg"></a>
																</div>

																<div class="item-entry overflow">
																	<h5>
																		<a href="property-1.html"> Super nice villa </a>
																	</h5>
																	<div class="dot-hr"></div>
																	<span class="pull-left"><b> Area :</b> 120m </span> <span
																		class="proerty-price pull-right"> $ 300,000</span>
																	<p style="display: none;">Suspendisse ultricies
																		Suspendisse ultricies Nulla quis dapibus nisl.
																		Suspendisse ultricies commodo arcu nec pretium ...</p>
																	<div class="property-icon">
																		<img src="resources/assets/img/icon/bed.png">(5)|
																		<img src="resources/assets/img/icon/shawer.png">(2)|
																		<img src="resources/assets/img/icon/cars.png">(1)
																	</div>
																</div>


															</div>
														</div>

														<div class="col-sm-6 col-md-3 p0">
															<div class="box-two proerty-item">
																<div class="item-thumb">
																	<a href="property-1.html"><img
																		src="resources/assets/img/demo/property-1.jpg"></a>
																</div>

																<div class="item-entry overflow">
																	<h5>
																		<a href="property-1.html"> Super nice villa </a>
																	</h5>
																	<div class="dot-hr"></div>
																	<span class="pull-left"><b> Area :</b> 120m </span> <span
																		class="proerty-price pull-right"> $ 300,000</span>
																	<p style="display: none;">Suspendisse ultricies
																		Suspendisse ultricies Nulla quis dapibus nisl.
																		Suspendisse ultricies commodo arcu nec pretium ...</p>
																	<div class="property-icon">
																		<img src="resources/assets/img/icon/bed.png">(5)|
																		<img src="resources/assets/img/icon/shawer.png">(2)|
																		<img src="resources/assets/img/icon/cars.png">(1)
																	</div>
																</div>


															</div>
														</div>
													</div>
												</div>

												<div class="col-md-12 clear">
													<div class="pull-right">
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
						</div>
						<div class="tab-pane fade show active" id="review" role="tabpanel"
							aria-labelledby="review-tab">
							<div class="row">
								<div class="col-lg">
									<div class="row total_rate" style="display: flex;">
										<div class="col-6" style="flex: 1">
											<div class="box_total">
												<br>

												<h3
													style="text-align: center; font-weight: bold; margin: 20px 0 0 0;">Overall</h3>

												<h1
													style="text-align: center; color: #D27E04; font-weight: bold; margin: 0;">4.0</h1>

												<h5 style="text-align: center;">(03 Reviews)</h5>
											</div>
										</div>
										<div class="col-6" style="flex: 1">
											<div class="rating_list" style="margin-top: 25px;">
												<h5 style="text-align: left;">Based on 3 Reviews</h5>
												<ul class="list" style="padding: 0;">
													<li><a href="#" id="num">5 Star <i
															class="fa fa-star"></i><i class="fa fa-star"></i><i
															class="fa fa-star"></i><i class="fa fa-star"></i><i
															class="fa fa-star"></i> 01
													</a></li>
													<li><a href="#" id="num">4 Star <i
															class="fa fa-star"></i><i class="fa fa-star"></i><i
															class="fa fa-star"></i><i class="fa fa-star"></i><i
															class="fa fa-star"></i> 01
													</a></li>
													<li><a href="#" id="num">3 Star <i
															class="fa fa-star"></i><i class="fa fa-star"></i><i
															class="fa fa-star"></i><i class="fa fa-star"></i><i
															class="fa fa-star"></i> 01
													</a></li>
													<li><a href="#" id="num">2 Star <i
															class="fa fa-star"></i><i class="fa fa-star"></i><i
															class="fa fa-star"></i><i class="fa fa-star"></i><i
															class="fa fa-star"></i> 01
													</a></li>
													<li><a href="#" id="num">1 Star <i
															class="fa fa-star"></i><i class="fa fa-star"></i><i
															class="fa fa-star"></i><i class="fa fa-star"></i><i
															class="fa fa-star"></i> 01
													</a></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="review_list">
										<div class="review_item">
											<div class="media">
												<div class="d-flex">
													<img src="resources/img/product/review-1.png" alt="">
												</div>
												<div class="media-body">
													<h4>Blake Ruiz</h4>
													<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i>
												</div>
											</div>
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing
												elit, sed do eiusmod tempor incididunt ut labore et dolore
												magna aliqua. Ut enim ad minim veniam, quis nostrud
												exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
										</div>
										<div class="review_item">
											<div class="media">
												<div class="d-flex">
													<img src="resources/img/product/review-2.png" alt="">
												</div>
												<div class="media-body">
													<h4>Blake Ruiz</h4>
													<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i>
												</div>
											</div>
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing
												elit, sed do eiusmod tempor incididunt ut labore et dolore
												magna aliqua. Ut enim ad minim veniam, quis nostrud
												exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
										</div>
										<div class="review_item">
											<div class="media">
												<div class="d-flex">
													<img src="resources/img/product/review-3.png" alt="">
												</div>
												<div class="media-body">
													<h4>Blake Ruiz</h4>
													<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i>
												</div>
											</div>
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing
												elit, sed do eiusmod tempor incididunt ut labore et dolore
												magna aliqua. Ut enim ad minim veniam, quis nostrud
												exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</section>





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
	<script type="text/javascript"
		src="resources/assets/js/lightslider.min.js"></script>
	<script src="resources/assets/js/main.js"></script>

	<script>
		$(document).ready(function() {

			$('#image-gallery').lightSlider({
				gallery : true,
				item : 1,
				thumbItem : 9,
				slideMargin : 0,
				speed : 500,
				auto : true,
				loop : true,
				onSliderLoad : function() {
					$('#image-gallery').removeClass('cS-hidden');
				}
			});
		});
	</script>

	<script>
		$(document).ready(function() {
			// Description 탭을 활성화
			$('#myTab a[href="#home"]').tab('show');
		});
	</script>

	<%@ include file="../common/footer.jsp"%>

</body>
</html>
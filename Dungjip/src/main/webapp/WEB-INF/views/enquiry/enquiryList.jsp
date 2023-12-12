<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html class="no-js">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>1:1문의 내역</title>
        <meta name="description" content="company is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

    </head>
    <style>
		.nav-menu {
			display: flex;
			justify-content: center;
			list-style: none;
			padding: 0;
			background-color: #f4f4f4;
			margin: 20px 0;
		}
		
		.nav-item {
			padding: 10px 50px; /* Adjust the padding as necessary */
			margin: 0 10px; /* Space between items */
			border: 1px solid #ddd; /* Border color */
			background-color: #fff; /* Background color for non-active items */
			cursor: pointer;
			color:#000;
		}
		
		.nav-item.active {
			background-color: #000; /* Active item background color */
			color: #fff; /* Active item text color */
		}
		
		.nav-item:hover{
		    background-color: #000;
		    color: #fff;
		}    
		
		.textBox{
			color: #000;
			font-size: 15px;
		}
		
		.panel-body{
			color: #000;
			font-size: 15px;
		}
		
		.row-feat{
    		display: flex;
    		justify-content: center;			
		}		
		
		.col-sm-6{
			width: 81%;
		}
		
		.col-md-12 {
    		width: 60%;
		}
		
		.feat-list{
			margin-left: 70px;
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
		
		.title{
			margin-left: 300px;
		}
		
		.feat-list{
			margin-left: 290px;
		}
		
    </style>
    <body>
    <%@ include file="../common/header.jsp" %>
         <div class="page-head"> 
            <div class="container">
            </div>
        </div>
       	<br><br>
		<div align="center">
			<a href="enList.en" class="nav-item active" style="width:180px;">1:1문의 내역</a>
			<a href="enquiry.en" class="nav-item" style="width:180px;">1:1문의</a>
			<a href="#" class="nav-item">공지사항</a>
		</div>
        <div class="content-area recent-property" style="background-color: #FCFCFC; padding-bottom: 55px;">
            <div class="container">    
                    <br>
                     <br>
				<c:forEach items="${enList}" var="en">
			      	<form method="post" action="reply.en">
		                <div class="row row-feat"> 
		                    <div class="col-md-12">
		                        <div class="col-sm-6 feat-list">
		                            <div class="panel-group">
		                                <div class="panel panel-default">
		                                    <div class="panel-heading">
		                                         <h4 class="panel-title fqa-title" data-toggle="collapse" data-target="#fqa${en.enquiryNo}" >
		                                         		<span>${en.enquiryTitle}</span>
		                                         </h4> 
		                                    </div>
		                                    <div id="fqa${en.enquiryNo}" class="panel-collapse collapse fqa-body">
		                                        <div class="panel-body">
			                                        <c:if test="${not empty en.enquiryImage}">
			                                        	<a href="${en.changeName}" download="${en.enquiryImage}">${en.enquiryImage}</a>
			                                        <br>
			                                        </c:if>
			                                        	  작성자 : <span>${en.userName}</span> <br>
			                                        	   내용 : <span>${en.enquiryContent}</span> <br>
													    작성일자 : <span>${en.enquiryEnrollDate}</span>			                                            
			                                        <br> <br>
			                                        <c:choose>
				                                        <c:when test="${not empty en.enquiryReply}">
				                                        	<textarea rows="2" cols="65" style="resize: none;" disabled>${en.enquiryReply}</textarea>
				                                        </c:when>
				                                        <c:otherwise>
				                                        	<input type="hidden" name="userNo" value="${en.userNo}">
				                                        	<input type="hidden" name="enquiryNo" value="${en.enquiryNo}"
				                                        	>
				                                        	<textarea rows="2" cols="65" style="resize: none;" id="enquiryReply" name="enquiryReply" ></textarea>
				                                        	<br>
				                                        	<div align="right">
				                                        	<br>
				                                        		<button type="submit">전송</button>
				                                        	</div>
				                                        </c:otherwise>
			                                        </c:choose>
		                                        </div> 
		                                    </div>
		                                </div>
		                            </div>
                                </div>
                            </div>
                        </div>
					</form>    
		          </c:forEach>
		        <div id="oldList">
                </div>
                <div align="center">
		          <button id="moreEnquiry" class="submit-button">더보기</button>
		        </div>  
               	</div>
           </div>
       <script>
       	  $(document).ready(function(){
       		  
       	  });
       </script>

       <%@ include file="../common/footer.jsp" %>
    </body>
</html>
















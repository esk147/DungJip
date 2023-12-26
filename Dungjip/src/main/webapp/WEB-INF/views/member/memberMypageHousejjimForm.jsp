<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.dungjip.member.model.vo.Member"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>하우스 리뷰내역</title>
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
        
      	.list {
		  list-style: none;
		  padding: 0;
		}
		
		.list .form-check {
		  display: inline-block;
		  margin-right: 10px; /* 각 요소 사이의 간격을 조정할 수 있습니다. */
		}
        
    </style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>

	<div class="container" style="display: flex; width: 67%;">

		<!-- 마이페이지 메뉴바 -->
		<%@ include file="memberMypagemenubar.jsp"%>

		<section class="main-content"
			style="width: 100%; margin: 70px 0 70px 50px; margin-left: 4%;">

			<c:if test="${not empty hlike}">
				<c:forEach items="${hlike}" var="hlike" varStatus="status">
					<div class="col-md-4" >
						 <div class="card mb-3">
							  <img class="homeImg" src="${himg[status.index].changeName }" class="card-img-top" alt="...">
							  <div class="card-body">
							    <h5 class="card-title">${hlike.houseTitle }</h5>
							    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
							    <div style="display: flex;justify-content: end;">
							    	<a href="#" class="btn btn-light btn-sm" style="color: brown;">해제</a>
							  	</div>
							  </div>
						 </div> 
					</div>
				</c:forEach>	
			</c:if>
			<c:if test="${empty hlike }">
				<p>※ 찜 내역이 존재하지 않습니다.</p>
	
			</c:if>			
			
		</section>
	</div>

	<%@ include file="../common/footer.jsp" %>
      
     
     
</body>
</html>

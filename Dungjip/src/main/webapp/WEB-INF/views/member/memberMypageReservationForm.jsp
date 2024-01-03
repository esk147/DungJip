<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.kh.dungjip.member.model.vo.Member"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약내역</title>

<style>
.card {
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

.item_text {
	padding: 20px 0 10px 0px;
	line-height: 30px;
	font-size: 14px;
	letter-spacing: -0.8;
}

.btn_edit {
	float: right;
	padding: 2px 9px 3px 10px;
	color: #7b8994;
	border: none;
}
</style>
</head>
<body>

	<%@ include file="../common/header.jsp"%>

	<div class="container" style="display: flex; width: 67%;">

		<!-- 마이페이지 메뉴바 --> 
		<c:choose>
	    <c:when test="${loginUser.userType eq '임차인' || loginUser.userType eq '임대인'}">
	        <%@ include file="memberMypagemenubar.jsp" %>
	    </c:when>
	    <c:when test="${loginUser.userType eq '중개인'}">
	        <%@ include file="memberMypageEsmenubar.jsp" %>
	    </c:when>
	    </c:choose>  

		<section class="main-content" style="width: 100%; margin: 70px 0 70px 50px; margin-left: 4%;">				
		        
			<div class="cart_inner">
			
				<div class="table-responsive" style="margin-top:20px;">
					<table class="table">
						<thead>
							<tr class="text-center">
								<th scope="col" style="width:10%;">NO</th>
								<th scope="col">예약 상세정보</th>
								<th scope="col" style="width:15%;">리뷰</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="reservation" items="${rlist }" >
							<tr>
								<td class="text-center" >
									<h5>NO. ${reservation.reservationNo }</h5>
								</td>
								<td>
									<div class="media">
										<div class="d-flex"></div>
										<div class="media-body">
											<p>
												<b><i class="fa fa-clock-o" ></i> </b>
												<fmt:formatDate value="${rervation.reservationDate}" pattern="yyyy년 MM월 dd일" /> 
												${reservation.time.timeValue }
											</p>
											<p>
												<b>중개사 : </b> ${reservation.estate.esName }
												<input type="hidden" id="esNo" value="${reservation.esNo}">
											</p>
										</div>
									</div>
								</td>
									
								<td>
								
								  <!-- 예약 내역의 esReNo가 비어있는지 여부 확인 -->
				                    <a href="#" class="genric-btn primary-border small" onclick="insertEstateReview(this);">작성</a>
						            <%-- <c:choose>
						                <c:when test="${empty reservation.estateReview.esReNo}">
						                    <!-- esReNo가 비어있으면 리뷰가 작성되지 않은 상태 -->
						                </c:when>
						                <c:otherwise>
						                    <!-- esReNo가 존재하면 이미 리뷰를 작성한 상태 -->
						                    <a href="#" class="genric-btn primary-border small" disabled>작성완료</a>
						                </c:otherwise>
						            </c:choose> --%>
								
								</td>
								
								
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			
		</section> 

	</div>
	
	
	<script>
	function insertEstateReview(el){
		var esNo = $(el).closest('tr').find('#esNo').val();
		console.log(esNo);
		window.location.href = "/dungjip/insert.esre?esNo="+esNo;
	}
	
	</script>


	<%@ include file="../common/footer.jsp"%>

</body>
</html>

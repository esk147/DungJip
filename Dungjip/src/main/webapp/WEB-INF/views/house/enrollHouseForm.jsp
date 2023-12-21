<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>집 매물 등록 폼</title>
</head>
<body>
    <%@ include file="../common/header.jsp" %>
<h2>집 매물 등록 폼</h2>

<form action="/dungjip/house/enroll" method="post" enctype="multipart/form-data">

	<fieldset>
	        <legend>매물 정보</legend>
	
	    <label for="housePrice">가격:</label>
	    <input type="text" id="housePrice" name="housePrice"><br>
	
	    <label for="houseRent">월세 가격:</label>
	    <input type="text" id="houseRent" name="houseRent"><br>
	
	    <label for="houseSquare">집 평수:</label>
	    <input type="text" id="houseSquare" name="houseSquare" required><br>
	
	    <label for="houseStyle">월세/전세:</label>
	    <input type="text" id="houseStyle" name="houseStyle" required><br>
	
	    <label for="houseTitle">집 이름:</label>
	    <input type="text" id="houseTitle" name="houseTitle" required><br>
	
	    <label for="houseDetails">집 상세정보:</label>
	    <input type="text" id="houseDetails" name="houseDetails" required><br>
	
	        <label for="houseType">유형:</label>
	        <select id="houseType" name="houseType">
	            <option value="원룸">원룸</option>
	            <option value="빌라">빌라(아파트)</option>
	        </select><br>
	
	    <label for="houseLatitude">위도:</label>
	    <input type="text" id="houseLatitude" name="houseLatitude" required><br>
	
	    <label for="houseLongitude">경도:</label>
	    <input type="text" id="houseLongitude" name="houseLongitude" required><br>
	
	    <label for="houseAddress">집 주소:</label>
	    <input type="text" id="houseAddress" name="houseAddress" required><br>
	
	    <label for="houseFloor">집 층수:</label>
	    <input type="text" id="houseFloor" name="houseFloor" required><br>
	
	    <label for="houseBuildingFloor">건물 층수:</label>
	    <input type="text" id="houseBuildingFloor" name="houseBuildingFloor" required><br>
	</fieldset>
	
	<fieldset>
		<legend>매물 이미지</legend>
        <!-- 파일 첨부 -->
        <label for="files">이미지 파일:</label>
        <input type="file" id="files" name="files" multiple="multiple" accept="image/*"><br>
        <small>최대 4개까지 업로드 가능합니다.</small>
	</fieldset>
	
    <button type="submit">등록</button>
</form>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>
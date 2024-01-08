<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Estate List</title>
	<style>
		body {
            font-family: 'Noto Sans KR', sans-serif;
        }
        .text-primary {
            color: #2c2c2c;
        }
        .bg-secondary {
            background-color: #f7f7f7;
        }
        .accordion-header {
            cursor: pointer;
            padding: 1rem;
            background-color: #fff;
            border: 1px solid #ddd;
            border-bottom: none;
        }
        .accordion-body {
            display: none;
            padding: 1rem;
            border: 1px solid #ddd;
            background-color: #fff;
        }
	</style>
</head>
<body class="bg-secondary">
    <%@ include file="../common/header.jsp" %>
    <h2>중개인 관리</h2>
    <button class="btn btn-primary" onclick="redirectToMemberList()">유저 관리</button>
    <button class="btn btn-primary" onclick="redirectToReportList()">신고 관리</button>
    <c:forEach var="estate" items="${estateList}">
        <div class="accordion">
            <div class="accordion-header" onclick="toggleAccordion(${estate.esNo})">
                부동산 이름 : ${estate.esName} 대표자명 : ${estate.esCeo}
            </div>
            <div class="accordion-body" id="detailContent-${estate.esNo}">
				<p>전화 번호: ${estate.esPhone}</p>
                <p>사업자 번호: ${estate.esNum}</p>
                <p>중개사 등록 번호: ${estate.esRegisterNum}</p>
                <p>중개사 주소: ${estate.esAddress}</p>
                <p id="status-${estate.esNo}">활동상태 : ${estate.esStatus}</p>
                <button class="btn-stop" onclick="banEstate(${estate.esNo})">활동 정지</button>
                <button class="btn-release" onclick="permitEstate(${estate.esNo})">활동 허용</button>
            </div>
		</div>
    </c:forEach>
	<script>
		function toggleAccordion(esNo) {
	        var content = document.getElementById("detailContent-" + esNo);
	        content.style.display = (content.style.display === "block") ? "none" : "block";
	        
	        var status = document.getElementById("status-" + esNo).textContent; 
	        var btnStop = document.querySelector("#detailContent-" + esNo + " .btn-stop");
	        var btnRelease = document.querySelector("#detailContent-" + esNo + " .btn-release");
	       
	        if (status === '활동상태 : Y') {//활동중지 버튼 활성화
	        	btnStop.style.display = 'block';
	            btnRelease.style.display = 'none';
	        } else {//활동허용 버튼 활성화
	            btnStop.style.display = 'none';
	            btnRelease.style.display = 'block';
	            
	        }
	    }
		
		 function banEstate(esNo) {
		        // AJAX 호출을 통해 banEstate 엔드포인트와 상호 작용
		        $.ajax({
		            type: "POST",
		            url: "/dungjip/admin/banEstate",
		            contentType: "application/json",
		            data: JSON.stringify({ esNo: esNo }),
		            success: function(response) {
		                // 서버 응답에 따라 버튼 및 회원 상태 업데이트
		                if (response === "Success") {
		                	showSuccess("성공","중개사 활동이 정지되었습니다.","확인");
		                    // 필요한 경우 버튼 및 회원 상태 업데이트 로직 추가
		                    // 페이지 새로고침 또는 필요한 동작 수행
		                    location.reload();
		                } else {
		                	showError("오류", "회원이 이미 정지 상태입니다.", "확인");
		                }
		            },
		            error: function() {
	                	showError("오류", "에러", "확인");
		            }
		        });
		    }

		    function permitEstate(esNo) {
		        // AJAX 호출을 통해 permitMember 엔드포인트와 상호 작용
		        $.ajax({
		            type: "POST",
		            url: "/dungjip/admin/permitEstate",
		            contentType: "application/json",
		            data: JSON.stringify({ esNo: esNo }),
		            success: function(response) {
		                // 서버 응답에 따라 버튼 및 회원 상태 업데이트
		                if (response === "Success") {
		                    showSuccess("성공","중개사 활동이 허용되었습니다.","확인");
		                    // 필요한 경우 버튼 및 회원 상태 업데이트 로직 추가
		                    // 페이지 새로고침 또는 필요한 동작 수행
		                    location.reload();
		                } else {
		                    showError("오류", "회원이 정지 상태가 아닙니다.", "확인");
		                }
		            },
		            error: function() {
		            	showError("오류", "에러", "확인");
		            }
		        });
		    }
		    
		    function redirectToMemberList() {
		        // 중개인 관리 페이지로 이동
		        window.location.href = "http://localhost:9999/dungjip/admin/list";
		    }
		    
		    function redirectToReportList() {
		        // 중개인 관리 페이지로 이동
		        window.location.href = "http://localhost:9999/dungjip/admin/reportList";
		    }
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>
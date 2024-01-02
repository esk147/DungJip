<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Member List</title>
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
    <h2>유저 관리</h2>
    <button class="btn btn-primary" onclick="redirectToEstateList()">중개인 관리</button>
    <button class="btn btn-primary" onclick="redirectToReportList()">신고 관리</button>
    <c:forEach var="member" items="${memberList}">
	    <c:if test="${member.userType != '관리자'}">
	        <div class="accordion">
	            <div class="accordion-header" onclick="toggleAccordion(${member.userNo})">
	                이름 : ${member.userName} 아이디 : ${member.userId}
	            </div>
	            <div class="accordion-body" id="detailContent-${member.userNo}">
					<p>유저 타입: ${member.userType}</p>
	                <p>닉네임: ${member.userNickName}</p>
	                <p>나이: ${member.age}</p>
	                <p>성별: ${member.gender}</p>
	                <p>이메일: ${member.email}</p>
	                <p>핸드폰: ${member.phone}</p>
	                <p>주소: ${member.address}</p>
	                <p id="status-${member.userNo}">회원상태 : ${member.status}</p>
	                <button class="btn-stop" onclick="banMember(${member.userNo})">회원 정지</button>
	                <button class="btn-release" onclick="permitMember(${member.userNo})">정지 해제</button>
	            </div>
			</div>
		</c:if>
    </c:forEach>
   
<script>
    function toggleAccordion(userNo) {
        var content = document.getElementById("detailContent-" + userNo);
        content.style.display = (content.style.display === "block") ? "none" : "block";
        
        var status = document.getElementById("status-" + userNo).textContent; 
        var btnStop = document.querySelector("#detailContent-" + userNo + " .btn-stop");
        var btnRelease = document.querySelector("#detailContent-" + userNo + " .btn-release");

        if (status === '회원상태 : Y') {
            btnStop.style.display = 'block';
            btnRelease.style.display = 'none';
        } else {
            btnStop.style.display = 'none';
            btnRelease.style.display = 'block';
        }
    }

    function banMember(userNo) {
        // AJAX 호출을 통해 banMember 엔드포인트와 상호 작용
        $.ajax({
            type: "POST",
            url: "/dungjip/admin/banMember",
            contentType: "application/json",
            data: JSON.stringify({ userNo: userNo }),
            success: function(response) {
                // 서버 응답에 따라 버튼 및 회원 상태 업데이트
                if (response === "Success") {
                    alert("회원이 정지되었습니다.");
                    // 필요한 경우 버튼 및 회원 상태 업데이트 로직 추가
                    // 페이지 새로고침 또는 필요한 동작 수행
                    location.reload();
                } else {
                    alert("회원이 이미 정지 상태입니다.");
                }
            },
            error: function() {
                alert("에러");
            }
        });
    }

    function permitMember(userNo) {
        // AJAX 호출을 통해 permitMember 엔드포인트와 상호 작용
        $.ajax({
            type: "POST",
            url: "/dungjip/admin/permitMember",
            contentType: "application/json",
            data: JSON.stringify({ userNo: userNo }),
            success: function(response) {
                // 서버 응답에 따라 버튼 및 회원 상태 업데이트
                if (response === "Success") {
                    alert("회원 정지가 해제되었습니다.");
                    // 필요한 경우 버튼 및 회원 상태 업데이트 로직 추가
                    // 페이지 새로고침 또는 필요한 동작 수행
                    location.reload();
                } else {
                    alert("회원이 정지 상태가 아닙니다.");
                }
            },
            error: function() {
            	alert("에러");
            }
        });
    }
    
    function redirectToEstateList() {
        // 중개인 관리 페이지로 이동
        window.location.href = "http://localhost:9999/dungjip/admin/estateList";
    }
    
    function redirectToReportList() {
        // 중개인 관리 페이지로 이동
        window.location.href = "http://localhost:9999/dungjip/admin/reportList";
    }
</script>
   
   
    <jsp:include page="../common/footer.jsp" />
</body>
</html>
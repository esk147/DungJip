<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <style>
        /* Ensure the font is set correctly */
        body {
            font-family: 'Noto Sans KR', sans-serif;
        }
        /* Helper classes for text and bg colors extracted from the screenshot */
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
        /* 글 수정 모달 */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
            padding-top: 60px;
        }
        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body class="bg-secondary">
    <%@ include file="../common/header.jsp" %>
    <h2>공지사항</h2>
    <c:forEach var="notice" items="${noticeList}">
        <div class="accordion">
            <div class="accordion-header" onclick="toggleAccordion(${notice.noticeNo})">
                ${notice.noticeNo}. ${notice.noticeTitle}
            </div>
            <div class="accordion-body" id="detailContent-${notice.noticeNo}">
            	<p>공지사항 번호 : ${notice.noticeNo }</p>
                <h2>제목 : ${notice.noticeTitle}</h2>
                <p>${notice.noticeContent}</p>
                <p>작성일 : ${notice.enrollDate}</p>
                <p>조회수: <span id="count-${notice.noticeNo}">${notice.count}</span></p>
                <button onclick="openUpdateModal(${notice.noticeNo})">수정하기</button>
                <button onclick="confirmDelete(${notice.noticeNo})">삭제하기</button>
            </div>
        </div>
    </c:forEach>

	<!-- 글 작성 버튼 -->
    <button onclick="openModal()">글 작성</button>
    
    <!-- 모달 창 -->
	<div id="myModal" class="modal">
	    <div class="modal-content">
	        <span class="close" onclick="closeModal()">&times;</span>
	        <h2>글 작성</h2>
	
	        <!-- 글 작성 폼 -->
	        <form id="noticeForm">
	            <label for="title">제목:</label>
	            <input type="text" id="title" name="noticeTitle" placeholder="제목" required> <br> <br>
	
	            <label for="content">내용:</label>
	            <textarea id="content" name="noticeContent" placeholder="내용" rows="4" required></textarea> <br> <br>
	
	            <!-- 작성 완료 및 취소 버튼 -->
	            <div>
	                <button type="button" onclick="submitNotice()">작성 완료</button> <br>
	                <button type="button" onclick="closeModal()">취소</button>
	            </div>
	        </form>
	    </div>
	</div>
	
	<!-- 수정 모달 창 -->
    <div id="updateModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeUpdateModal()">&times;</span>
            <h2>글 수정</h2>

            <!-- 글 수정 폼 -->
            <form id="updateForm">
                <label for="updateTitle">제목:</label>
                <input type="text" id="updateTitle" name="noticeTitle" placeholder="제목" required> <br> <br>

                <label for="updateContent">내용:</label>
                <textarea id="updateContent" name="noticeContent" placeholder="내용" rows="4" required></textarea> <br> <br>

                <!-- 수정 완료 및 취소 버튼 -->
                <div>
                    <button type="button" onclick="submitUpdate()">수정 완료</button> <br>
                    <button type="button" onclick="closeUpdateModal()">취소</button>
                </div>
            </form>
        </div>
    </div>
    
    <!-- 삭제 모달 창 -->
	<div id="deleteModal" class="modal">
	    <div class="modal-content">
	        <span class="close" onclick="closeDeleteModal()">&times;</span>
	        <h2>삭제 확인</h2>
	        <p>정말 삭제하시겠습니까?</p>
	        <button id="deleteConfirmBtn">삭제</button>
	        <button id="deleteCancelBtn" onclick="closeDeleteModal()">취소</button>
	    </div>
	</div>
	
    <script>
    function toggleAccordion(noticeNo) {
        var detailContent = $("#detailContent-" + noticeNo);

        // 아코디언이 현재 숨겨져 있는지 여부를 확인
        var isHidden = detailContent.is(":hidden");

        // 모든 아코디언 바디 숨김
        $(".accordion-body").hide();

        // 아코디언을 펼칠 때
        if (isHidden) {
            // 아직 로드되지 않은 경우에만 Ajax 호출을 수행
            if (!detailContent.data("loaded")) {
                // Ajax 호출을 통해 서버의 "/notice/increaseCount/" 엔드포인트에 noticeNo를 파라미터로 전달하여 조회수 증가
                $.ajax({
                    type: "GET",
                    url: "/dungjip/notice/increaseCount/" + noticeNo,
                    success: function () {
                        // Ajax 호출 성공 시 조회수 업데이트.
                        
                        console.log("조회수 증가 성공.");
                        var countSpan = $("#count-" + noticeNo);
                        var currentCount = parseInt(countSpan.text());
                        countSpan.text(currentCount + 1);
                    },
                    error: function () {
                        // Ajax 호출 실패 시 에러 출력
                        console.error("조회수 증가 실패.");
                    }
                });
                // 데이터 속성 "loaded"를 true로 설정하여 중복 호출 방지
                detailContent.data("loaded", true);
            }
            // 선택된 아코디언 바디 펼치기
            detailContent.show();
        } else {
            // 아코디언을 닫을 때
            detailContent.hide();
        }
    }
    
 	// 글 작성 모달 열기
    function openModal() {
        document.getElementById("myModal").style.display = "block";
    }

    // 글 작성 모달 닫기
    function closeModal() {
        document.getElementById("myModal").style.display = "none";
    }
    
 	// 글 작성 완료 버튼 클릭 시
    function submitNotice() {
        // 글 작성 폼 데이터 가져오기
        var title = document.getElementById("title").value;
        var content = document.getElementById("content").value;

        // Ajax를 통해 서버로 JSON 형식의 데이터 전송
        $.ajax({
            type: "POST",
            url: "/dungjip/notice/insert",
            contentType: "application/json", // JSON 형식으로 데이터 전송
            data: JSON.stringify({
                noticeTitle: title,
                noticeContent: content
            }),
            success: function (response) {
                // Ajax 호출 성공 시, 작성한 글을 화면에 추가
                alert("글 작성이 완료되었습니다.");

                // 모달 창 닫기
                closeModal();

                // 페이지 새로고침 또는 필요한 동작 수행
                location.reload();
            },
            error: function () {
                // Ajax 호출 실패 시 에러 처리
                alert("글 작성 중 오류가 발생했습니다.");
            }
        });
    }
    
    function openUpdateModal(noticeNo) {
        var updateModal = document.getElementById("updateModal");
        updateModal.style.display = "block";

        // Ajax를 통해 해당 공지사항의 정보를 가져와서 모달에 표시
        $.ajax({
            type: "GET",
            url: "/dungjip/notice/update/" + noticeNo,
            success: function (response) {
                $("#updateTitle").val(response.noticeTitle);
                $("#updateContent").val(response.noticeContent);
            },
            error: function () {
                console.error("공지사항 정보를 불러오는 데 실패했습니다.");
            }
        });
        
        selectedNoticeNo = noticeNo;
    }

 	// 글 수정 모달 닫기
    function closeUpdateModal() {
        document.getElementById("updateModal").style.display = "none";
    }

    function submitUpdate() {
        var noticeNo = selectedNoticeNo;
        var title = document.getElementById("updateTitle").value;
        var content = document.getElementById("updateContent").value;

        $.ajax({
            type: "POST",
            url: "/dungjip/notice/update/",
            contentType: "application/json",
            data: JSON.stringify({
                noticeNo: noticeNo,
                noticeTitle: title,
                noticeContent: content
            }),
            success: function (response) {
                alert("글 수정이 완료되었습니다.");
                closeUpdateModal();
                location.reload();
            },
            error: function () {
                alert("글 수정 중 오류가 발생했습니다.");
            }
        });
    }	
    
 	// 삭제 확인 모달 창 열기
    function confirmDelete(noticeNo) {
        // 모달 열기
        var modal = document.getElementById("deleteModal");
        modal.style.display = "block";

        // 삭제 버튼에 해당 공지사항 번호 저장
        $("#deleteConfirmBtn").data("noticeNo", noticeNo);
    }

    function closeDeleteModal() {
        var modal = document.getElementById("deleteModal");
        modal.style.display = "none";
    }

    // 삭제 확인 모달에서 확인 버튼 클릭 시
    $("#deleteConfirmBtn").click(function () {
        // 모달 닫기
        closeDeleteModal();

        // 선택된 공지사항 번호 가져오기
        var noticeNo = $("#deleteConfirmBtn").data("noticeNo");

        // Ajax를 통해 삭제 요청 전송
        deleteNotice(noticeNo);
    });

    // 글 삭제 Ajax 호출
    function deleteNotice(noticeNo) {
        $.ajax({
            type: "POST",
            url: "/dungjip/notice/delete",
            contentType: "application/json",
            data: JSON.stringify({
                noticeNo: noticeNo
            }),
            success: function (response) {
                alert("삭제되었습니다.");
                location.reload();
            },
            error: function () {
                alert("삭제 중 오류가 발생했습니다.");
            }
        });
    }
 	

    </script>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>
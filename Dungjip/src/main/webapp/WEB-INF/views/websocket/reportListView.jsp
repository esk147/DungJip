<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
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
        #chatHistoryModalContent, .closeModalBtn {
            position: relative;
            top: 340px;
            width: 50%;
        }
        .modal-buttons {
            margin-top: 10px;
            text-align: center;
            position: relative;
            z-index: 9999;
        }
        .modal-buttons button {
            margin-right: 10px;
        }
    </style>
</head>
<body class="bg-secondary">
    <%@ include file="../common/header.jsp" %>
    <h2>부동산 신고 관리</h2>
    <button class="btn btn-primary" onclick="redirectToMemberList()">유저 관리</button>
    <button class="btn btn-primary" onclick="redirectToEstateList()">중개인 관리</button>
    <c:forEach var="reportEstate" items="${reportList}">
        <div class="accordion">
            <div class="accordion-header">
                피신고자 : ${reportEstate.estate.userName}
            </div>
            <div class="accordion-body">
                <p>신고자 : ${reportEstate.user.userName} </p>
                <p>신고사유 : ${reportEstate.reportReason }</p>
                <!-- 채팅 내역을 불러오는 버튼 -->
                <button class="loadChatHistoryBtn" value="${reportEstate.chatRoomNo}">채팅 내역 불러오기</button>
            </div>
        </div>
    </c:forEach>

    <!-- 채팅 내역 모달창 -->
    <div id="chatHistoryModal" class="modal">
        <div class="modal-content" id="chatHistoryModalContent">
            <!-- 채팅 내역을 출력할 공간 -->
        </div>
        <div class="modal-buttons">
            <button id="approveBtn">승인</button>
            <button id="cancelBtn">취소</button>
        </div>
        <button class="closeModalBtn">닫기</button>
    </div>
    <script>
        $(document).ready(function () {
            $(".accordion-header").click(function () {
                var detailContent = $(this).next(".accordion-body");
                detailContent.slideToggle();
            });

            $(".loadChatHistoryBtn").click(function () {
                var chatRoomNo = $(this).val();
                // Ajax를 이용하여 채팅 내역을 불러오기
                $.ajax({
                    type: "GET",
                    url: "/dungjip/admin/chatHistory",
                    data: { chatRoomNo: chatRoomNo },
                    success: function (chatHistory) {
                        // 동적으로 모달 창에 채팅 내역을 표시
                        showModal(chatHistory);
                    },
                    error: function (xhr, status, error) {
                        console.error("Error fetching chat history:", error);
                    }
                });
            });

            function showModal(chatHistory) {
                // 모달 창 열기
                var modal = $("#chatHistoryModal");
                modal.css("display", "block");

                // 채팅 내역 표시
                var modalContent = $("#chatHistoryModalContent");
                modalContent.html(""); // 모달 내용 초기화

                // chatHistory가 배열인지 확인 후 처리
                if (Array.isArray(chatHistory)) {
                    chatHistory.forEach(function (message) {
                        var formattedMessage = formatChatMessage(message);
                        var messageDiv = $("<div class='chat-message'></div>");
                        messageDiv.text(formattedMessage);
                        modalContent.append(messageDiv);
                    });
                } else {
                    // chatHistory가 배열이 아닌 경우 처리
                    var messageDiv = $("<div class='chat-message'></div>");
                    messageDiv.text("Invalid chat history data");
                    modalContent.append(messageDiv);
                }
            }

            // 채팅 메시지 포맷팅 함수
            function formatChatMessage(message) {
                return message.sendMessageTime + " - " + message.userName + " : " + message.contentMessage;
            }

            // 모달 창 닫기
            $(".closeModalBtn").click(function () {
                var modal = $("#chatHistoryModal");
                modal.css("display", "none");
            });

         // 승인 버튼 클릭 시
            $("#approveBtn").click(function () {
                var chatRoomNo = $(".loadChatHistoryBtn").val();
                // Ajax를 이용하여 승인 처리
                $.ajax({
                    type: "POST",
                    url: "/dungjip/admin/approveReport",
                    data: { chatRoomNo: chatRoomNo },
                    success: function () {
                        alert("신고가 승인되었습니다.");
                        var modal = $("#chatHistoryModal");
                        modal.css("display", "none");

                        // 새로고침
                        location.reload();
                    },
                    error: function (xhr, status, error) {
                        console.error("Error approving report:", error);
                    }
                });
            });

            // 취소 버튼 클릭 시
            $("#cancelBtn").click(function () {
                var chatRoomNo = $(".loadChatHistoryBtn").val();
                // Ajax를 이용하여 취소 처리
                $.ajax({
                    type: "POST",
                    url: "/dungjip/admin/cancelReport",
                    data: { chatRoomNo: chatRoomNo },
                    success: function () {
                        alert("신고가 취소되었습니다.");
                        var modal = $("#chatHistoryModal");
                        modal.css("display", "none");

                        // 새로고침
                        location.reload();
                    },
                    error: function (xhr, status, error) {
                        console.error("Error canceling report:", error);
                    }
                });
            });
        });
        
	    function redirectToMemberList() {
	        // 중개인 관리 페이지로 이동
	        window.location.href = "http://localhost:9999/dungjip/admin/list";
	    }
        
        function redirectToEstateList() {
            // 중개인 관리 페이지로 이동
            window.location.href = "http://localhost:9999/dungjip/admin/estateList";
        }
    </script>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>
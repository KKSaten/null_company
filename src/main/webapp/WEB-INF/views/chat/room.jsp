<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <title>Chat Room</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .chat-container {
            height: 70vh;
            overflow-y: auto;
            border: 1px solid #ced4da;
            margin-bottom: 20px;
            padding: 10px;
            background-color: #ffffff;
        }
        .message {
            margin: 5px 0;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">채팅방</h2>
        <div class="chat-container" id="chatContainer"></div>
        <div class="input-group">
            <input type="text" id="messageInput" class="form-control" placeholder="메시지를 입력하세요...">
            <div class="input-group-append">
                <button id="sendButton" class="btn btn-primary">전송</button>
            </div>
        </div>
    </div>

    <script>
        var sock = new SockJS('/chat');

        const chatContainer = document.getElementById('chatContainer');
        const messageInput = document.getElementById('messageInput');
        const sendButton = document.getElementById('sendButton');


        sock.onopen = function() {
            console.log('open');
            sock.send('test');
        };

        sock.onmessage = function(e) {
            console.log('message', e.data);

            addMessageToChat(e.data);
        };

        sock.onclose = function() {
            console.log('close');
        };

            // 메시지를 채팅창에 추가하는 함수
    function addMessageToChat(message) {
        const messageElement = document.createElement('div');
        messageElement.className = 'message';
        messageElement.textContent = message;
        chatContainer.appendChild(messageElement);
        chatContainer.scrollTop = chatContainer.scrollHeight; // 스크롤을 가장 아래로 이동
    }

    // 메시지 전송 버튼 클릭 시
    sendButton.onclick = function() {
        const message = messageInput.value;
        if (message) {
            sock.send(message); // 서버로 메시지 전송
            messageInput.value = ''; // 입력 필드 초기화
        }
    };



        // var stompClient = null;

        // function connect() {
        //     var socket = new SockJS('/chat/room');
        //     stompClient = Stomp.over(socket);
        //     stompClient.connect({}, function (frame) {
        //         console.log('Connected: ' + frame);
        //         stompClient.subscribe('/topic/messages', function (message) {
        //             showMessage(JSON.parse(message.body));
        //         });
        //     });
        // }

        // function sendMessage() {
        //     var messageContent = document.getElementById('message').value;
        //     var message = {
        //         sender: "User", // 사용자 이름이나 ID를 사용할 수 있습니다.
        //         content: messageContent,
        //         type: "CHAT"
        //     };
        //     stompClient.send("/chat/send", {}, JSON.stringify(message)); // 메시지 전송
        //     document.getElementById('message').value = ''; // 입력 필드 비우기
        // }

        // function showMessage(message) {
        //     var messagesElement = document.getElementById('messages');
        //     var messageElement = document.createElement('li');
        //     messageElement.appendChild(document.createTextNode(message.sender + ": " + message.content));
        //     messagesElement.appendChild(messageElement); // 메시지 추가
        // }

        // window.onload = function() {
        //     connect(); // 페이지 로드 시 연결
        // };
    </script>
</body>
</html>

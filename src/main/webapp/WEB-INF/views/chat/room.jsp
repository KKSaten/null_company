<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <title>Chat Room</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
</head>
<body>
    <h1>Chat Room</h1>
    <div id="chat">
        <input id="message" type="text" placeholder="Type your message...">
        <button onclick="sendMessage()">Send</button>
    </div>
    <ul id="messages"></ul>

    <script>
        var stompClient = null;

        function connect() {
            var socket = new SockJS('/chat');
            stompClient = Stomp.over(socket);
            stompClient.connect({}, function (frame) {
                console.log('Connected: ' + frame);
                stompClient.subscribe('/topic/messages', function (message) {
                    showMessage(JSON.parse(message.body));
                });
            });
        }

        function sendMessage() {
            var messageContent = document.getElementById('message').value;
            var message = {
                sender: "User", // 사용자 이름이나 ID를 사용할 수 있습니다.
                content: messageContent,
                type: "CHAT"
            };
            stompClient.send("/chat/send", {}, JSON.stringify(message)); // 메시지 전송
            document.getElementById('message').value = ''; // 입력 필드 비우기
        }

        function showMessage(message) {
            var messagesElement = document.getElementById('messages');
            var messageElement = document.createElement('li');
            messageElement.appendChild(document.createTextNode(message.sender + ": " + message.content));
            messagesElement.appendChild(messageElement); // 메시지 추가
        }

        window.onload = function() {
            connect(); // 페이지 로드 시 연결
        };
    </script>
</body>
</html>

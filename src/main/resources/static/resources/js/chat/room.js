let roomNum = document.getElementById("roomNum");
let fileName = document.getElementById("fileName");

var sock = null;

//websocket 연결 함수
function connect() {
  sock = new SockJS("/chat/room?roomId=" + roomNum.value);
}

connect();

const chatContainer = document.getElementById("chatContainer");
const messageInput = document.getElementById("messageInput");
const sendButton = document.getElementById("sendButton");
const empName = document.getElementById("empName");
chatContainer.scrollTop = chatContainer.scrollHeight;

//websocket 정상 연결되었을 때 실행
sock.onopen = function () {
  console.log("open");
};

//websocket 으로 message 전송되었을 때
sock.onmessage = function (e) {
  const data = JSON.parse(e.data);

  console.log(data);
  console.log(data.employeeVO.empName);

  addMessageToChat(data, empName.value == data.employeeVO.empName);
};

//websocket 연결 중단 되었을 때 실행
sock.onclose = function () {
  console.log("close");

  // 1초 뒤 재연결
  setTimeout(connect, 1000);
};

// 메시지를 채팅창에 추가하는 함수
function addMessageToChat(message, isMyMessage) {
  const messageElement = document.createElement("div");
  const messageContainer = document.createElement("div");

  messageContainer.className = "message-container";

  messageElement.className =
    "message " + (isMyMessage ? "my-message" : "other-message");
  messageElement.style.width = "fit-content";
  const span = document.createElement("span");
  span.className = "chat-content";
  const p = document.createElement("p");
  const status = document.createElement("span");
  status.className = "read-count";

  const timestamp = document.createElement("div");
  timestamp.className = "timestamp";
  timestamp.setAttribute("style", isMyMessage ? "position:absolute;" : "");

  if (!isMyMessage) {
    const img = document.createElement("img");
    img.setAttribute(
      "src",
      "/file/employee/" + message.employeeVO.employeeFileVO.fileName
    );
    img.className = "rounded-image";

    const strong = document.createElement("strong");
    strong.append(message.employeeVO.empName);

    chatContainer.appendChild(img);
    chatContainer.appendChild(strong);
  }

  let time = new Date(message.createTime);

  timestamp.append(time.toLocaleString());

  p.append(message.chatContents);
  status.append(message.readCount);
  span.appendChild(p);

  if (!isMyMessage) {
    messageElement.appendChild(span);
    messageElement.appendChild(status);
  } else {
    messageElement.appendChild(status);
    messageElement.appendChild(span);
  }

  messageContainer.appendChild(messageElement);
  messageContainer.appendChild(timestamp);

  chatContainer.appendChild(messageContainer);

  chatContainer.scrollTop = chatContainer.scrollHeight; // 스크롤을 가장 아래로 이동
}

// 메시지 전송 함수
function sendMessage() {
  const message = messageInput.value;
  if (message) {
    sock.send(message); // 서버로 메시지 전송
    messageInput.value = ""; // 입력 필드 초기화
  }
}

// 메시지 전송 버튼 클릭 시
sendButton.onclick = sendMessage;

// Enter 키를 눌렀을 때 메시지 전송
messageInput.addEventListener("keydown", function (event) {
  if (event.key === "Enter") {
    event.preventDefault(); // 기본 동작 방지 (줄 바꿈 방지)
    sendMessage(); // 메시지 전송 함수 호출
  }
});

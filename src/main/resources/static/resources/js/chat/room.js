let roomNum = document.getElementById('roomNum')
let fileName = document.getElementById('fileName')

			var sock = new SockJS('/chat/room?roomId=' + roomNum.value);

			const chatContainer = document.getElementById('chatContainer');
			const messageInput = document.getElementById('messageInput');
			const sendButton = document.getElementById('sendButton');
			const empName = document.getElementById('empName');

			sock.onopen = function() {
				console.log('open');
			};

			sock.onmessage = function(e) {
				console.log('message', e.data);
				let sender = e.data.split(' : ')[0];
				addMessageToChat(e.data, empName.value == sender);

			};

			sock.onclose = function() {
				console.log('close');
			};

			// 메시지를 채팅창에 추가하는 함수
			function addMessageToChat(message, isMyMessage) {
				const messageElement = document.createElement('div');
				const img = document.createElement('img');
				img.src='/file/'+fileName;
				messageElement.className = 'message'
						+ (isMyMessage ? ' my-message' : '');
				
				messageElement.appendChild(img);
				
				const textNode = document.createTextNode(message);
				messageElement.appendChild(textNode);

				chatContainer.appendChild(messageElement);

				chatContainer.scrollTop = chatContainer.scrollHeight; // 스크롤을 가장 아래로 이동
			}

			// 메시지 전송 함수
			function sendMessage() {
				const message = messageInput.value;
				if (message) {
					sock.send(message); // 서버로 메시지 전송
					messageInput.value = ''; // 입력 필드 초기화
				}
			}

			// 메시지 전송 버튼 클릭 시
			sendButton.onclick = sendMessage;

			// Enter 키를 눌렀을 때 메시지 전송
			messageInput.addEventListener('keydown', function(event) {
				if (event.key === 'Enter') {
					event.preventDefault(); // 기본 동작 방지 (줄 바꿈 방지)
					sendMessage(); // 메시지 전송 함수 호출
				}
			});
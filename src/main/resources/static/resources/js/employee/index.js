
const sse = new EventSource('/notification/connect');

sse.addEventListener('test', (e) => {
	const { data: receivedConnectData } = e;
	console.log('connect event data: ',receivedConnectData);  // "connected!"
});
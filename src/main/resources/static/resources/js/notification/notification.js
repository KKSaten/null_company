
const sse = new EventSource('/notification/connect');

sse.addEventListener('test', (e) => {
	console.log(e);
	console.log(e.data);
});
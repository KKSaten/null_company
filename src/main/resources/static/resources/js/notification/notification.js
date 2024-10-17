const content = {};

let num = 0;

function clickNotify(message) {
	content.message = message;
	content.title = "로그인";
	content.icon = "fa fa-bell";
	content.url = "index.html";
	content.target = message;

	$.notify(content, {
	  type: 'secondary',
	  placement: {
		from: 'bottom',
		align: 'right',
	  },
	  time: 1,
	  delay: 5000,
	});
}



const sse = new EventSource('/notification/connect');
sse.addEventListener('CONNECT', (e) => {
	console.log(e.data)
});


sse.addEventListener('LOGIN', (e)=>{
	console.log("login");

	clickNotify(e.data)
});
const content = {};

let num = 0;

function clickNotify(data) {
	content.message = data.notificationContent;
	content.title = "알림";
	content.icon = "fa fa-bell";
	content.url = data.url;
	content.target = data.notificationContent;

	$.notify(content, {
	  type: 'primary',
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
	const data = JSON.parse(e.data);
	console.log(data.notificationContent)

});

sse.addEventListener('LOGIN', (e)=>{
	console.log("login");
	const data = JSON.parse(e.data);
	clickNotify(data)
});

sse.addEventListener('COMMENT', (e)=>{
	console.log("comment");
	const data = JSON.parse(e.data);
	clickNotify(data)
});


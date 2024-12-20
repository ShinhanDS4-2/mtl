$(function() {
	let url_v = "/user/info";
	
	let data_v = {
		"userIdx": 1
	};
	
	comm.send(url_v, data_v, "POST", function(resp) {
		console.log(resp);
	});
});
$(function() {
	let url_v = "/user/info";
	
	let data_v = {
		"userIdx": 1
	};
	
	comm.send(url_v, data_v, "POST", function(resp) {
		console.log(resp);
		
		let code = resp.body.code;
		if (code != 200) {
			alert("일치하는 데이터가 없습니다.");
		}
	});
});
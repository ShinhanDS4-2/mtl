$(function() {
	$.ajax({
		url: "/mtl/user/info",
		data: {
			"userIdx": 1
		},
		method: "POST",
		success: function(resp) {
			console.log(resp);
		}
	});
});
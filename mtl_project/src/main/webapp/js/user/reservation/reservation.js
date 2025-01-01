const reservation = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_eventInit();
		_event.getRoomDetail();
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='reservation'][data-act]").off();
		evo.on("click", function(e) {
			_eventAction(e);
		});
	};
	
	// 이벤트 분기
	function _eventAction(e) {
		let evo = $(e.currentTarget);
		
		let action = evo.attr("data-act");
		
		let type = e.type;
		
		if(type == "click") {
			if(action == "clickDuplication") {

			};
		};
	};
	
	// 이벤트
	let _event = {
		getRoomDetail: function() {
			let roomIdx = comm.getUrlParam().idx;
			
			let url = "/user/partner/room/detail";
			
			let data = { "room_idx" : roomIdx };
			
			comm.sendJson(url, data, "POST", function(resp) {
				_draw.drawDetail(resp.data);
			});
		},
	};
	
	// 그리기
	let _draw = {
		drawDetail: function(data) {
			$("#partnerImg").attr("src", data.image);
			$("#partnerName").html(data.name);
			$("#partnerAddress").html(data.address);
			$("#roomType").html(data.room_type);
		},
	};
	
	return {
		init,
	};
})();
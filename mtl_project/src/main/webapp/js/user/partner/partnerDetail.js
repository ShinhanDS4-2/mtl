const partnerDetail = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_eventInit();
		_event.getDetail();
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='partnerDetail'][data-act]").off();
		evo.on("click", function(e) {
			_eventAction(e);
		});
	};
	
	// 이벤트 분기
	function _eventAction(e) {
		let evo = $(e.currentTarget);
		
		let action = evo.attr("data-act");
		
		let type = e.type;
		
		if (type == "click") {
		};
	};
	
	// 이벤트
	let _event = {
		getDetail: function() {
			let partnerIdx = comm.getUrlParam().idx;
        
	        let url = "/user/partner/detail";
	        
	        let data = { "partner_idx" : partnerIdx };
	        
			comm.sendJson(url, data, "POST", function(resp) {
				let data = resp.data;
				
				// 지도
				_mapInit(data);
				
				$("#partnerName").html(data.name);
				$("#partnerDescription").html(data.description);
				$("#partnerAddress").html(data.address);
				$("#partnerPhone").html(data.phone);
			});
		}
	};
	
	// 리스트
	let _list = {
	};
	
	// 네이버 지도
	function _mapInit(data) {
		let option = {
			zoom: 16,
			latitude: data.latitude,
			hardness: data.hardness,
		};
		
		comm.setMapWithGeo(option);
	};
	
	return {
		init,
	};
})();
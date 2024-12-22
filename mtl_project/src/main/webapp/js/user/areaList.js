const areaList = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_eventInit();
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='areaList'][data-act]").off();
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
			if (action == "clickPartner") {
				_event.clickPartner(evo);
			} else if (action == "clickLocation") {
				_event.clickLocation(evo);
			} 
		};
	};
	
	// 이벤트
	let _event = {
		// 숙소 상세 페이지로 이동
		clickPartner: function(evo) {
			let partnerIdx = evo.attr("data-partner-idx");
			location.href = "/mtl/partner/detail?idx=" + partnerIdx;
		},
		
		// 여행지 상세 페이지로 이동
		clickLocation: function(evo) {
			let locationIdx = evo.attr("data-location-idx");
			location.href = "/mtl/location/detail?idx=" + locationIdx;
		},
	};
	
	return {
		init,
	};
})();
const partnerList = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_eventInit();
		_randomBanner();
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='partnerList'][data-act]").off();
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
			if(action == "clickPartner") {
				_event.clickPartner(evo);
			};
		};
	};
	
	// 이벤트
	let _event = {
		clickPartner: function(evo) {
			let partnerIdx = evo.attr("data-partner-idx");
			location.href = "/mtl/partner/detail?idx=" + partnerIdx;
		},
	};
	
	// 배너 랜덤으로 변경
	function _randomBanner() {
		let num = Math.floor(Math.random() * 7) + 1;
		$("#banner").css("background-image","url(assets/images/banner/" + num +".jpg)");
	};

	return {
		init,
	};
})();
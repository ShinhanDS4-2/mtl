const reservation = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_menuActive();
		_eventInit();
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
			if(action == "") {
			
			};
		};
	};
	
	// 이벤트
	let _event = {
	
	};
	
	// 메뉴 active
	function _menuActive() {
		$("#menuReservation").addClass("active");
	};
	
	return {
		init,
	};
})();
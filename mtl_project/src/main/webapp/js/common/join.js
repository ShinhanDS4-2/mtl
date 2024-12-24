const join = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_eventInit();
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='join'][data-act]").off();
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
			if(action == "clickEmailAuth") {
				_event.checkEmail();
			} else if (action == "clickAuthCheck") {
				
			}
		};
	};
	
	// 이벤트
	let _event = {
		// 이메일 형식 체크
		checkEmail: function() {
			let email = $("#joinEmail").val();
			if (!comm.validateEmail(email)) {
			    alert('올바른 이메일 주소를 입력하세요.');
			    return;
		    }
	    },
    
	};
	
	return {
		init,
	};
})();
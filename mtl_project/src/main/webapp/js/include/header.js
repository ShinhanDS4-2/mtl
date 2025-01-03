const header = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_eventInit();
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='header'][data-act]").off();
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
			if(action == "clickLogo") {
				_event.clickLogo();
			} else if(action == "clickLogoutBtn") {
				_event.handleLogout();
			}
		};
	};
	
	// 이벤트
	let _event = {
		// 로고 클릭
		clickLogo: function() {
			location.href = "/mtl/";
		},
		
		handleLogout: function() {
			let url = "/user/logout";
			
			comm.send(url, {}, "POST", function() {
				alert("로그아웃 되었습니다.");
				location.href = "/mtl/";
			});
		}
	};
	
	return {
		init,
	};
})();
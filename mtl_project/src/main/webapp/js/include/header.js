const header = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_eventInit();
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='header'][data-act]").off();
		evo.on("click change", function(e) {
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
		} else if (type == "change") {
			if (action == "chagneSite") {
				_event.chagneSite();
			}
		}
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
				modal.alert({
					"content" : "로그아웃 되었습니다.",
					"confirmCallback" : function() {
						location.href = "/mtl/";
					}
				});
			});
		},
		
		chagneSite: function() {
			let site = $("#site option:selected").val();
			
			if (site == "partner") {
				window.open("/mtl/partner/login", "_blank");
			} else if (site == "admin") {
				window.open("/mtl/admin/login", "_blank");
			};
		}
	};
	
	return {
		init,
	};
})();
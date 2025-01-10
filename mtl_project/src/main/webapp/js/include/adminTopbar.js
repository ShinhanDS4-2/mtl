const adminTopbar = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_menuActive();
		_eventInit();
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='adminTopbar'][data-act]").off();
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
			location.href = "/mtl/admin/dashboard";
		},
		
		handleLogout: function() {
			let url = "/admin/logout";
			
			comm.send(url, {}, "POST", function() {
				modal.alert({
					"content" : "로그아웃 되었습니다.",
					"confirmCallback" : function() {
						location.href = "/mtl/admin/login";
					}
				});
			});
		}
	};
	
	function _menuActive() {
		let url = window.location.pathname;
		let path = url.replace("/mtl/admin/", "");
		let index = path.indexOf("/");
		if (index == -1) {
			index = path.length;
		};
		let prePath = path.substring(0, index);
		
		let link = "";
		
		switch (prePath) {
			case "user":
			case "partner":
				link = "#collapsemember";
		    	break;
			case "accomodation":
			case "partner":
				link = "#collapsehotel";
		    	break;
		    case "payout":
		    	link = "#collapsepayment";
		    	break;
		    case "location":
		    	link = "#collapsetravel";
		    	break;
		    case "question":
		    case "faq":
		    case "notice":
		    	link = "#customerInquiry";
		    	break;
		  	default:
		    	break;
		};
		
		if (prePath != "dashbord") {
			$(link + " a[href='" + url + "']").addClass("active");
			$(link).addClass("show");
			$(link).siblings("a").attr("aria-expanded", true);
		};
	};
	
	return {
		init,
	};
})();
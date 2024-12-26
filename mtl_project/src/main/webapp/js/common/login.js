const login = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_eventInit();
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='login'][data-act]").off();
		evo.on("click keyup", function(e) {
			_eventAction(e);
		});
		
		// 폼 제출 이벤트 추가
		$("#loginForm").on("submit", function (e) {
            _handleLogin(e);
        });
	};
	
	// 이벤트 분기
	function _eventAction(e) {
		let evo = $(e.currentTarget);
		
		let action = evo.attr("data-act");
		
		let type = e.type;
		
		if(type == "click") {
			if(action == "clickLoginBtn") {
				_event.handleLogin();
			};
		} else if(type == "keyup") {
			if (window.event.keyCode == 13) {
				_event.handleLogin();
			}
		}
	};
	
	// 이벤트
	let _event = {
		handleLogin: function() {
			let formData = {
	        	email: $("#email").val(),
	            password: $("#pw").val(),
	        };
	
	        $.ajax({
	            url: "/mtl/api/user/login",
	            method: "POST",
	            data: formData,
	            success: function (response) {
	            	let code = response.body.code;
	                if (code == 200) {
	                    // 로그인 성공 시 메인 페이지로 이동
	                    location.href = "/mtl/";
	                } else {
	                    // 실패 메시지 표시
	                    alert("로그인에 실패했습니다. 다시 시도해주세요.");
	                }
	            },
	            error: function (error) {
	                console.error("Login error:", error);
	                alert("로그인 중 오류가 발생했습니다. 다시 시도해주세요.");
	            }
	        });
		},
		
		
	};
	
	return {
		init,
	};
})();
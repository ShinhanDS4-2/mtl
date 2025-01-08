const login = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_eventInit();
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='login'][data-act]").off();
		evo.on("click", function(e) {
			_eventAction(e);
		});
		
		// 엔터키 감지 이벤트
		$(document).on("keyup", function(e) {
        	if (e.key === "Enter") {
            	_event.handleLogin();
        	}
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
			} else if (action == "clickPartnerCenter") {
				location.href = "/mtl/partner/login";
			} else if (action == "clickFindModal") {
				$("#findPwEmail").val("");
				$("#findPwName").val("");
			} else if (action == "clickSendMail") {
				_event.clickSendMail();
			};
		}
	};
	
	// 이벤트
	let _event = {
		handleLogin: function() {
			let url = "/user/login";

			let formData = {
	        	email: $("#email").val(),
	        	// MD5 암호화 적용
	            password: CryptoJS.MD5($("#pw").val()).toString(),
	        };
			
			comm.send(url, formData, "POST", function(response) {
            	let code = response.code;
                if (code == 200) {
                    // 로그인 성공 시 메인 페이지로 이동
                    location.href = "/mtl/";
                } else if (code == 600) {
                    // 실패 메시지 표시
                    modal.alert({
                    	"content" : "로그인에 실패하였습니다.<br>다시 시도해 주세요." 
                    });
                }
			}, function(error) {
                console.error("Login error:", error);
                modal.alert({
                	"content" : "오류가 발생하였습니다.<br>다시 시도해 주세요."
                });
			});
		},
		
		// 비밀번호 찾기
		clickSendMail: function() {
			let url = "/email/find/password";
			
			let data = {
				"target" : "USER",
				"email" : $("#findPwEmail").val(),
				"name" : $("#findPwName").val(),
			};
			
			comm.sendJson(url, data, "POST", function(resp) {
				if (resp.result == true) {
					modal.alert({
						"content" : "입력하신 메일로 임시 비밀번호가 발송되었습니다.",
						"confirmCallback" : function() {
							$("#findPwModal").modal("hide");
						}
					});
				} else {
					modal.alert({
						"content" : "존재하지 않는 회원입니다.",
					});
				}
			});
		}
	};
	
	return {
		init,
	};
})();
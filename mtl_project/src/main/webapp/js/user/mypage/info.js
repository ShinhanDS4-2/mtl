const info = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_menuActive();
		_setInfo();
		_eventInit();
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='info'][data-act]").off();
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
			if(action == "updateInfo") {
				_event.updateInfo();
			} else if(action == "changePassword") {
				_event.changePassword();
			} else if(action == "withdraw") {
				_event.withdraw();
			};
		};
	};
	
	// 이벤트
	let _event = {
		// 사용자 정보 수정
		updateInfo: function() {
            const formData = {
                userIdx: $("#userIdx").val(),
                name: $("#name").val(),
                phone: $("#phone").val(),
            };
            
	        // 유효성 검사
			if (!formData.name) {
				modal.alert({
					"content" : "이름을 입력해 주세요."
				});
				return;
			}
		    if (!formData.phone) {
		    	modal.alert({
					"content" : "연락처를 입력해 주세요."
				});
		        return;
		    }
			if (!/^010-\d{3,4}-\d{4}$/.test(formData.phone)) {
				modal.alert({
					"content" : "올바른 연락처를 입력해 주세요.<br>형식은 010-0000-0000입니다."
				});
			    return;
			}
			
			// 서버로 데이터 전송
        	modal.confirm({
        		"content" : "정보를 수정하시겠습니까?", 
        		"confirmCallback": function() {
		            comm.send("/user/update", formData, "POST", function(response) {
		                if (response.result == true) {
		                	modal.alert({
		                		"content" : "정보 수정이 완료되었습니다.",
		                		"confirmCallback" : function() {
				                    location.reload();
		                		}
		                	});
		                } else {
		                	modal.alert({
		                		"content" : "정보 수정에 실패하였습니다.<br>다시 시도해 주세요."
		                	});
		                };
		            }, function(error) {
		                modal.alert({
		                	"content" : "오류가 발생하였습니다.<br>다시 시도해 주세요."
		                });
		            });
	           	}
        	});
        },
        
        // 비밀번호 변경
        changePassword: function() {
        	const formData = {
        		password: $("#password").val(),
                newPassword: $("#newPassword").val(),
                confirmPassword: $("#confirmPassword").val(),
        	};
        
	        // 유효성 검사
	        if (!formData.password) {
	            modal.alert({ "content" : "현재 비밀번호를 입력해 주세요." });
	            return;
	        }
	        if (!formData.newPassword) {
	            modal.alert({ "content" : "새 비밀번호를 입력해 주세요." });
	            return;
	        }
	        if (formData.newPassword !== formData.confirmPassword) {
	            modal.alert({ "content" : "새 비밀번호와 일치하지 않습니다." });
	            return;
	        }
	        	
	        // 서버로 데이터 전송
        	modal.confirm({
        		"content" : "비밀번호를 변경하시겠습니까?",
        		"confirmCallback" : function() {
		            comm.send("/user/changePassword", formData, "POST", function(response) {
		                if (response.result) {
		                    modal.alert({ 
		                    	"content" : "비밀번호가 변경되었습니다.",
		                    	"confirmCallback" : function() {
				                    location.reload();
		                    	}
		                    });
		                } else {
		                    modal.alert({ "content" : "현재 비밀번호가 일치하지 않습니다." });
		                };
			        }, function(error) {
			            modal.alert({ "content" : "오류가 발생하였습니다.<br>다시 시도해 주세요." });
			        });
        		}
        	});
        },
        
        // 회원탈퇴
        withdraw: function() {
        	modal.confirm({
        		"content" : "떠날지도를 정말 탈퇴하시겠습니까?<br>탈퇴 후에는 떠날지도 서비스를 이용하실 수 없습니다.",
        		"confirmCallback" : function() {
		        	comm.send("/user/withdraw", null, "POST", function(response) {
		 				if (response.status == true) {
		        			modal.alert({ 
		        				"content" : "회원 탈퇴가 완료되었습니다. 이용해 주셔서 감사합니다.",
								"confirmCallback" : function () {
			        				location.href = "/mtl/";
								}		        		
		        			});
						} else {
		        			modal.alert({ "content" : "회원 탈퇴에 실패하였습니다.<br>다시 시도해 주세요." });
		    			};
		    		}, function(error) {
	        			modal.alert({ "content" : "오류가 발생하였습니다.<br>다시 시도해 주세요." });
		        	});
        		}
        	});
        },
	};
	
	// 정보 세팅
	function _setInfo() {
		comm.send("/user/info", null, "POST", function(response) {
			$("#name").val(response.name);
			$("#email").val(response.email);
			$("#phone").val(response.phone);
			$("#birth").val(response.birth);
        });
	};
     
	// 메뉴 active
	function _menuActive() {
		$("#menuInfo").addClass("active");
	};
	
	return {
		init,
	};
})();
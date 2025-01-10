const info = (function() {
console.log(1178);
	// js 로딩 시 이벤트 초기화 실행
	function init() {
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
			};
		};
	};
	
	// 이벤트
	let _event = {
		// 마이페이지 회원 정보 수정
		updateInfo: function() {
            const formData = {
                adminIdx: $("#adminIdx").val(),
                admin_name: $("#admin_name").val(),
            }; 
            
        // 유효성 검사
	    if (!formData.admin_name) {
	        modal.alert({
				"content" : "이름을 입력해 주세요." 
			});
	        return;
	    }
		
		// 서버로 데이터 전송
            comm.send("/admin/update", formData, "POST", function(response) {
                if (response.result == true) {
                	modal.alert({
	            		"content" : "관리자 정보 수정이 완료되었습니다.",
	            		"confirmCallback": function() {
	            			// 마이페이지 수정 성공 시 페이지 이동x
				            location.reload();
	            		}
	            	});
                } else {
                    modal.alert({
						"content" : "관리자 정보 수정에 실패하였습니다.<br>다시 시도해 주세요" 
					});
                }
            }, function(error) {
                console.error("내 정보 수정 중 오류:", error);
                modal.alert({
					"content" : "관리자 정보 수정 중 오류가<br>발생했습니다!<br>다시 시도해 주세요" 
				});
            });
        },
        
        
        // 비밀번호 변경
        changePassword: function() {
        	const formData = {
        		admin_password: $("#admin_password").val(),
                newPassword: $("#newPassword").val(),
                confirmPassword: $("#confirmPassword").val(),
        	};
        
        // 유효성 검사
        if (!formData.admin_password) {
        	modal.alert({ "content" : "기존 비밀번호를 입력해주세요." });
            return;
        }
        if (!formData.newPassword) {
        	modal.alert({ "content" : "새 비밀번호를 입력해주세요." });
            return;
        }
        if (formData.newPassword !== formData.confirmPassword) {
        	modal.alert({ "content" : "새 비밀번호와 일치하지 않습니다." });
            return;
        }
        	
        // 서버로 데이터 전송
            comm.send("/admin/changePassword", formData, "POST", function(response) {
                if (response.result) {
                	modal.alert({ 
                		"content" : "새 비밀번호와 일치하지 않습니다.",
                		"confirmCallback" : function() {
		                    location.href = "/mtl/admin/mypage";
                		}
                	});
                } else {
	                modal.alert({
						"content" : response.message 
					});
                }
            }, function(error) {
                modal.alert({
					"content" : "비밀번호 변경 중 오류가 발생했습니다.<br>다시 시도해주세요." 
				});
            });
        
        },
    };
    
    // 정보 세팅
    function _setInfo() {
		comm.send("/admin/info", null, "POST", function(response) {
			$("#admin_name").val(response.admin_name);
			$("#admin_email").val(response.admin_email);
			
			if (response.password_update_date != null) {
				$("#passwordUpdateDate").html(response.password_update_date);
			} else {
				$("#passwordUpdateDate").html("-");
			};
        }, function(error) {
        
        });
	};
	
	return {
		init,
	};
})();
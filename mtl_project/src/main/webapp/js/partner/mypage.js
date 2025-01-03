const info = (function() {
console.log(1177);
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
                partnerIdx: $("#partnerIdx").val(),
                name: $("#name").val(),
                phone: $("#phone").val(),
            };
            
        // 유효성 검사
	    if (!formData.phone) {
	        alert("연락처를 입력해주세요.");
	        return;
	    }
		if (!/^010-\d{3,4}-\d{4}$/.test(formData.phone)) {
		    alert("올바른 연락처를 입력하세요. 형식은 010-0000-0000입니다.");
		    return;
		}
		
		// 서버로 데이터 전송
            comm.send("/partner/update", formData, "POST", function(response) {
                if (response.result == true) {
                    alert("내 정보 수정이 완료되었습니다.");
                    // 마이페이지 수정 성공 시 페이지 이동x
                    location.reload();
                } else {
                    alert("내 정보 수정에 실패했습니다. 다시 시도해주세요.");
                }
            }, function(error) {
                console.error("내 정보 수정 중 오류:", error);
                alert("내 정보 수정 중 오류가 발생했습니다. 다시 시도해주세요.");
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
            alert("기존 비밀번호를 입력해주세요.");
            return;
        }
        if (!formData.newPassword) {
            alert("새 비밀번호를 입력해주세요.");
            return;
        }
        if (formData.newPassword !== formData.confirmPassword) {
            alert("새 비밀번호와 일치하지 않습니다.");
            return;
        }
        	
        // 서버로 데이터 전송
            comm.send("/partner/changePassword", formData, "POST", function(response) {
                if (response.result) {
                    alert(response.message);
                    location.href = "/mtl/partner/mypage";
                } else {
                    alert(response.message);
                }
            }, function(error) {
                console.error("비밀번호 변경 중 오류:", error);
                alert("비밀번호 변경 중 오류가 발생했습니다. 다시 시도해주세요.");
            });
        
        },
        
        
        // 회원탈퇴
        withdraw: function() {
        	comm.send("/user/withdraw", null, "POST", function(response) {
 				if (response.status == true) {
        			alert("회원 탈퇴 되셨습니다. 감사합니다!");
        				location.href = "/mtl/";
				} else {
        			alert("회원 탈퇴에 실패하셨습니다.");
    			}
    		}, function(error) {
					alert("회원 탈퇴 중 오류가 발생했습니다. 다시 시도해주세요.");
        	});
        
        },
        
	};
	
	function _setInfo() {
		comm.send("/partner/info", null, "POST", function(response) {
			$("#name").val(response.name);
			$("#email").val(response.email);
			$("#phone").val(response.phone);
        }, function(error) {
        
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
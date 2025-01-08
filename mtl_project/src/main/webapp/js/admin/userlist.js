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
			} else if (action == "clickAuthCheck") {	// 이메일 인증
				
			} else if (action == "clickJoin") {		//회원가입
				_event.handleJoin();
			} else if (action == "clickEmailCheck") {	// 이메일 중복 확인
				_event.checkEmailDuplication();
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
	    
	    
	    // 이메일 중복 확인
	    checkEmailDuplication: function() {
	    	let formData = {
            	admin_email: $("#joinEmail").val(),
            };
	    	if (!formData.admin_email) {
		        alert("이메일을 입력해주세요.");
		        return;
		    }
		    // 이메일 형식 체크
		    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(formData.admin_email)) {
		        alert("올바른 이메일 주소를 입력해주세요! 예: example@gmail.com");
		        return;
		    }
		    
		    
		    // 서버로 이메일 중복 확인 요청
        	comm.send("/admin/clickEmailCheck", formData, "POST", function(response) {
	            if (response.duplicated == false) {
	                alert("사용 가능한 이메일입니다.");
	            } else {
	                alert("이미 사용 중인 이메일입니다. 다른 이메일을 입력하세요.");
	            }
        	}, function(error) {
	            console.error("중복 확인 오류:", error);
	            alert("중복 확인 중 오류가 발생했습니다. 다시 시도해주세요.");
        	});
		    
		    
		    
		},
	    
	    
	    
	    // 회원가입
        handleJoin: function() {
            // 사용자 입력값
            let formData = {
            	admin_email: $("#joinEmail").val(),
            	admin_name: $("#joinName").val(),
                admin_password: $("#joinPw").val(),
            };
            
            // 유효성 검사
		    if (!formData.admin_email) {
		        alert("이메일을 입력해주세요.");
		        return;
		    }
            // 이메일 형식 확인
		    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(formData.admin_email)) {
		        alert("올바른 이메일 주소를 입력해주세요! 예: example@gmail.com");
		        return;
		    }
		    if (!formData.admin_name) {
                alert("이름을 입력해주세요.");
                return;
            }
            if (!formData.admin_password) {
                alert("비밀번호를 입력해주세요.");
                return;
            }
            // 비밀번호 길이 확인
            if (formData.admin_password.length < 8) {
		        alert("비밀번호는 최소 8자리 이상이어야 합니다.");
		        return;
		    }
            
            

            // 서버로 데이터 전송
            comm.send("/admin/join", formData, "POST", function(response) {
                if (response.code == 200) {
                    alert("관리자 등록이 완료되었습니다.");
                    location.reload();
                } else {
                    alert("관리자 등록에 실패했습니다. 다시 시도해주세요.");
                }
            }, function(error) {
                console.error("회원가입 중 오류:", error);
                alert("관리자 등록 중 오류가 발생했습니다. 다시 시도해주세요.");
            });
        },
        
    };
	
	return {
		init,
	};
})();
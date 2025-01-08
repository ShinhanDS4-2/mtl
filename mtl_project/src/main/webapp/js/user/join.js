const join = (function() {
console.log(1);
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
				modal.alert({
					"content" : "올바른 이메일 주소를 입력해 주세요." 
				});
			    return;
		    }
	    },
	    
	    // 이메일 중복 확인
	    checkEmailDuplication: function() {
	    	let formData = {
            	email: $("#joinEmail").val(),
            };
            
	    	if (!formData.email) {
	    		modal.alert({
					"content" : "이메일을 입력해 주세요." 
				});
		        return;
		    };
		    
		    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(formData.email)) {
		    	modal.alert({
					"content" : "올바른 이메일 주소를 입력해 주세요.<br>예: example@gmail.com" 
				});
		        return;
		    };
		    
		    // 서버로 이메일 중복 확인 요청
        	comm.send("/user/clickEmailCheck", formData, "POST", function(response) {
	            if (response.duplicated == false) {
					modal.alert({
						"content" : "사용 가능한 이메일입니다." 
					});	               
	            } else {
	            	modal.alert({
	            		"content" : "이미 사용 중인 이메일입니다.<br>다른 이메일을 입력해 주세요." 
	            	});
	            };
        	}, function(error) {
        		modal.alert({
					"content" : "오류가 발생하였습니다.<br>다시 시도해 주세요." 
				});	 
        	});
		},
	    
	    // 회원가입
        handleJoin: function() {
            // 사용자 입력값
            let formData = {
            	email: $("#joinEmail").val(),
                password: $("#joinPw").val(),
                passwordCheck: $("#joinPwCheck").val(),
                name: $("#joinName").val(),
                birthYear: $("#joinBirthYear").val(),
                birthMonth: $("#joinBirthMonth").val(),
                birthDay: $("#joinBirthDay").val(),
                phone: $("#joinPhone").val(),
            };
            
            // 유효성 검사
		    if (!formData.email) {
		    	modal.alert({
            		"content" : "이메일을 입력해 주세요." 
            	});
		        return;
		    }
            // 이메일 형식 확인
		    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(formData.email)) {
		    	modal.alert({
            		"content" : "올바른 이메일 주소를 입력해 주세요<br>예: example@gmail.com" 
            	});
		        return;
		    }
            if (!formData.password || !formData.passwordCheck) {
            	modal.alert({
            		"content" : "비밀번호를 입력해 주세요." 
            	});
                return;
            }
            // 비밀번호 길이 확인
            if (formData.password.length < 8) {
            	modal.alert({
            		"content" : "비밀번호는 최소 8자리 이상이어야 합니다." 
            	});
		        return;
		    }
		    // 비밀번호 일치 확인
            if (formData.password !== formData.passwordCheck) {
            	modal.alert({
            		"content" : "비밀번호가 일치하지 않습니다." 
            	});
                return;
            }
            if (!formData.name) {
            	modal.alert({
            		"content" : "이름을 입력해 주세요." 
            	});
                return;
            }
            if (!formData.birthYear || !formData.birthMonth || !formData.birthDay) {
            	modal.alert({
            		"content" : "생년월일을 선택해 주세요." 
            	});
                return;
            }
            if (!formData.phone) {
            	modal.alert({
            		"content" : "연락처를 입력해 주세요." 
            	});
                return;
            }
            
            // 생년월일 조합해서 한번에 보내기
			formData.birth = `${formData.birthYear}-${formData.birthMonth}-${formData.birthDay}`;
			delete formData.birthYear;
			delete formData.birthMonth;
			delete formData.birthDay;
            
            // 연락처 형식 확인
			if (!/^010-\d{3,4}-\d{4}$/.test(formData.phone)) {
				modal.alert({
            		"content" : "올바른 연락처를 입력해 주세요.<br>형식은 010-0000-0000입니다." 
            	});
			    return;
			}

            // 서버로 데이터 전송
            modal.confirm({
            	"content" : "가입하시겠습니까?",
            	"confirmCallback" : function() {
		            comm.send("/user/join", formData, "POST", function(response) {
		                if (response.code == 200) {
		                	modal.alert({
		                		"content" : "회원가입이 완료되었습니다.<br>로그인 페이지로 이동합니다.",
		                		"confirmCallback" : function() {
		                			location.href = "/mtl/login";
		                		}
		                	});
		                } else {
		                	modal.alert({
		                		"content" : "회원가입에 실패하였습니다.<br>다시 시도해 주세요." 
		                	});
		                }
		            }, function(error) {
	                	modal.alert({
	                		"content" : "오류가 발생하였습니다.<br>다시 시도해 주세요." 
	                	});
		            });
            	}
            });
        },
    };
	
	return {
		init,
	};
})();
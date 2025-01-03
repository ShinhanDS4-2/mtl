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
            	email: $("#joinEmail").val(),
            };
	    	if (!formData.email) {
		        alert("이메일을 입력해주세요.");
		        return;
		    }
		    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(formData.email)) {
		        alert("올바른 이메일 주소를 입력해주세요! 예: example@gmail.com");
		        return;
		    }
		    
		    
		    // 서버로 이메일 중복 확인 요청
        	comm.send("/partner/clickEmailCheck", formData, "POST", function(response) {
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
            	email: $("#joinEmail").val(),
                password: $("#joinPw").val(),
                passwordCheck: $("#joinPwCheck").val(),
                name: $("#joinName").val(),
                business_name: $("#joinBusiness_Name").val(),
                business_number: $("#joinBusiness_Number").val(),
                phone: $("#joinPhone").val(),
                business_phone: $("#joinBusiness_Phone").val(),
            };
            
            // 유효성 검사
		    if (!formData.email) {
		        alert("이메일을 입력해주세요.");
		        return;
		    }
            // 이메일 형식 확인
		    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(formData.email)) {
		        alert("올바른 이메일 주소를 입력해주세요! 예: example@gmail.com");
		        return;
		    }
            if (!formData.password || !formData.passwordCheck) {
                alert("비밀번호를 입력해주세요.");
                return;
            }
            // 비밀번호 길이 확인
            if (formData.password.length < 8) {
		        alert("비밀번호는 최소 8자리 이상이어야 합니다.");
		        return;
		    }
		    // 비밀번호 일치 확인
            if (formData.password !== formData.passwordCheck) {
                alert("비밀번호가 일치하지 않습니다.");
                return;
            }
            if (!formData.name) {
                alert("업체명을 입력해주세요.");
                return;
            }
            if (!formData.business_name) {
                alert("사업자명을 입력해주세요.");
                return;
            }
            if (!formData.business_number) {
                alert("사업자 등록번호를 입력해주세요.");
                return;
            }
            // 사업자 등록번호 형식 확인
			if (!/^\d{3}-\d{2}-\d{5}$/.test(formData.business_number)) {
			    alert("올바른 사업자 등록번호를 입력하세요. 형식은 000-00-00000입니다.");
			    return;
			}
            if (!formData.phone) {
                alert("업체 연락처를 입력해주세요.");
                return;
            }
            // 업체 연락처 형식 확인
			if (!/^010-\d{3,4}-\d{4}$/.test(formData.phone)) {
			    alert("올바른 업체 연락처를 입력하세요. 형식은 010-0000-0000입니다.");
			    return;
			}
            if (!formData.business_phone) {
                alert("사업자 연락처를 입력해주세요.");
                return;
            }
            // 사업자 연락처 형식 확인
			if (!/^010-\d{3,4}-\d{4}$/.test(formData.business_phone)) {
			    alert("올바른 사업자 연락처를 입력하세요. 형식은 010-0000-0000입니다.");
			    return;
			}
            
            

            

            // 서버로 데이터 전송
            comm.send("/partner/join", formData, "POST", function(response) {
                if (response.code == 200) {
                    alert("회원가입이 완료되었습니다.");
                    // 회원가입 성공 시 메인 페이지로 이동
                    location.href = "/mtl/partner/dashboard";
                } else {
                    alert("회원가입에 실패했습니다. 다시 시도해주세요.");
                }
            }, function(error) {
                console.error("회원가입 중 오류:", error);
                alert("회원가입 중 오류가 발생했습니다. 다시 시도해주세요.");
            });
        },
        
    };
	
	return {
		init,
	};
})();
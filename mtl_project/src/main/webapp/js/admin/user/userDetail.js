const userDetail = (function () {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_eventInit();
		_loadUserDetail();
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='userDetail'][data-act]").off();
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
			}
		};
	};
	
	
	
	
    
    
    // userDetail.jsp
	function _loadUserDetail() {
		let userIdx = comm.getUrlParam().idx; // common.js에서 함수 지정
		
        comm.send("/admin/detail", { userIdx: userIdx }, "POST", function(response) {
            if (response.userDetail) {
                const user = response.userDetail;

                // 데이터 동적으로 삽입
                $('#email').val(user.email);
                $('#name').val(user.name);
                $('#birth').val(user.birth);
                $('#phone').val(user.phone);
                $('#create_date').val(user.create_date);
                $('#user_status').val(user.user_status);
            } else {
                alert("사용자 상세 정보를 불러오지 못했습니다.");
            }
        }, function(error) {
            console.error("사용자 상세 정보 로드 오류:", error);
        });
    }
    





	
	
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
	    
	    
	    
	    
	    
        
    };
	
	return {
		init,
	};
})();
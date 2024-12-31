const info = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_menuActive();
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
			alert("이름을 입력해주세요.");
			return;
		}
	    if (!formData.phone) {
	        alert("연락처를 입력해주세요.");
	        return;
	    }
		if (!/^010-\d{3,4}-\d{4}$/.test(formData.phone)) {
		    alert("올바른 연락처를 입력하세요. 형식은 010-0000-0000입니다.");
		    return;
		}
		
		// 서버로 데이터 전송
            comm.send("/user/update", formData, "POST", function(response) {
                if (response.code == 200) {
                    alert("내 정보 수정이 완료되었습니다.");
                    // 마이페이지 수정 성공 시 페이지 이동x
                    location.href = "/mtl/mypage/info/";
                } else {
                    alert("내 정보 수정에 실패했습니다. 다시 시도해주세요.");
                }
            }, function(error) {
                console.error("내 정보 수정 중 오류:", error);
                alert("내 정보 수정 중 오류가 발생했습니다. 다시 시도해주세요.");
            });
        },
	};
	
	
            
	
	// 메뉴 active
	function _menuActive() {
		$("#menuInfo").addClass("active");
	};
	
	return {
		init,
	};
})();
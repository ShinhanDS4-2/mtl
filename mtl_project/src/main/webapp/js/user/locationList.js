const locationList = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_eventInit();
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='locationList'][data-act]").off();
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
			if(action == "clickDuplication") {
				_event.clickDuplication();
			};
		};
	};
	
	// 이벤트
	let _event = {
		clickDuplication: function() {
			$.ajax({
		        url: "dupleKeyword",  // 중복 확인을 위한 URL (Controller에서 매핑 필요)
		        method: "POST",  // POST 방식
		        data: {
		            "keyword": $("#placeName").val() // 입력한 키워드
		        },
		        success: function(resp) {
		        	console.log(resp);
		            if (resp == 1) {  // 중복 키워드가 있을 경우
		                alert("이미 사용 중인 키워드입니다.");
		                $("#placeName").attr("disabled", "disabled");  // 키워드 입력 비활성화
		            } else {  // 중복이 없으면
		                alert("사용 가능한 키워드입니다.");
		                $("#placeName").removeAttr("disabled");  // 키워드 입력 활성화
		            }
		        },
		        error: function() {
		            alert("중복 확인을 실패했습니다. 다시 시도해주세요.");
		        }
		    });	
		}
	};
	
	return {
		init,
	};
})();
const home = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_eventInit();
		_randomBanner();
		_event.example(); // 추후 삭제
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='home'][data-act]").off();
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
			if(action == "") {
			
			};
		};
	};
	
	// 이벤트
	let _event = {
		example: function() {
			let url_v = "/user/info";
			
			let data_v = {
				"userIdx": 1
			};
			
			comm.send(url_v, data_v, "POST", function(resp) {
				console.log(resp);
				
				let code = resp.body.code;
				if (code != 200) {
					alert("일치하는 데이터가 없습니다.");
				}
			});
		},
	};
	
	// 배너 랜덤으로 변경
	function _randomBanner() {
		let num = Math.floor(Math.random() * 7) + 1;
		$("#banner").css("background-image","url(assets/images/banner/" + num +".jpg)");
	};

	return {
		init,
	};
})();
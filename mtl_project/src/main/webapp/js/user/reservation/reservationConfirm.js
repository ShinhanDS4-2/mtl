let reservationConfirm = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_eventInit();
		_event.getReservation();
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='reservationConfirm'][data-act]").off();
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
			if(action == "clickMypage") {
				_event.clickMypage();
			} else if (action == "clickCustom") {
				_event.clickCustom();
			};
		};
	};
	
	// 이벤트
	let _event = {
		// 예약내역 클릭 -> 마이페이지 예약내역 이동
		clickMypage: function() {
			location.href = "/mtl/mypage/reservation";
		},

		// 여행지 추천 클릭
		clickCustom: function() {
			// location.href = "/mtl/mypage/reservation";
		},
		
		// 예약 정보 가져오기
		getReservation: function() {
			let reservationIdx = comm.getUrlParam().idx;
			
			let url = "/user/reservation/detail";
			
			let data = { "reservation_idx" : reservationIdx };
			
			comm.sendJson(url, data, "POST", function(resp) {
				if(resp.data == null) {
					location.href = "/mtl/";
				} else {
					_draw.drawDetail(resp.data);
				};
			});
		},
	};
	
	let _draw = {
		// 예약 상세 정보 세팅
		drawDetail: function(data) {
			$("#partnerImage").attr("src", data.image);
			$("#buyerName").html(data.name);
			$("#checkInDate").html(comm.formatDate(data.check_in_date) + " " + data.check_in_time);
			$("#checkOutDate").html(comm.formatDate(data.check_out_date) + " " + data.check_out_time);
			$("#totalPrice").html(comm.numberWithComma(data.price) + "원");
			$("#guest").html(data.guest_cnt + "인");
		},
	};

	return {
		init,
	};
})();
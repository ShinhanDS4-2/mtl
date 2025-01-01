const reservation = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_eventInit();
		_event.getRoomDetail();
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='reservation'][data-act]").off();
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
			if(action == "clickPayment") {
				_event.clickPayment();
			};
		};
	};
	
	// 이벤트
	let _event = {
		getRoomDetail: function() {
			let roomIdx = comm.getUrlParam().idx;
			
			let url = "/user/partner/room/detail";
			
			let data = { "room_idx" : roomIdx };
			
			comm.sendJson(url, data, "POST", function(resp) {
				_draw.drawDetail(resp.data);
			});
		},
		
		// 결제
		clickPayment: function() {
			let IMP = window.IMP; 
        	IMP.init("imp87617854"); 
        	
        	// 예약정보
        	let roomIdx = comm.getUrlParam().idx;
        	let code = comm.makeReservationCode(roomIdx);
        	let name = "떠날지도 숙소 예약 - " + $("#partnerName").text() + " / " + $("#roomType").text() ;
        	
        	/*
        	function requestPay() {
	            IMP.request_pay({
	                pg : "html5_inicis",
	                pay_method : "card",
	                merchant_uid: code, 
	                name : name,
	                amount : 1004,
	                buyer_email : "Iamport@chai.finance",
	                buyer_name : "포트원 기술지원팀",
	                buyer_tel : "010-1234-5678",
	                buyer_addr : "서울특별시 강남구 삼성동",
	                buyer_postcode : "123-456"
	            }, function (resp) { 
	                //resp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
	            });
	        };
	        */
		},
	};
	
	// 그리기
	let _draw = {
		drawDetail: function(data) {
			$("#partnerImg").attr("src", data.image);
			$("#partnerName").html(data.name);
			$("#partnerAddress").html(data.address);
			$("#roomType").html(data.room_type);
			$("#guest").html(sessionStorage.getItem("search_guest"));
			$("#checkInDate").html(comm.formatDate(sessionStorage.getItem("search_start_date")));
			$("#checkOutDate").html(comm.formatDate(sessionStorage.getItem("search_end_date")));
			$("#onePrice").html(comm.numberWithComma(sessionStorage.getItem("reservation_one_price")));
			$("#totalPrice").html(comm.numberWithComma(sessionStorage.getItem("reservation_total_price")));
			
			// _sessionReset();
		},
	};
	
	// 예약 세션 삭제
	function _sessionReset() {
		sessionStorage.removeItem("reservation_total_price");
		sessionStorage.removeItem("reservation_one_price");
	};

	return {
		init,
	};
})();
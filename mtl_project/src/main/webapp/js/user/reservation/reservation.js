const reservation = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_eventInit();
		_event.getRoomDetail();
		_event.getUserInfo();
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
		
		// 사용자 정보
		getUserInfo: function() {
			let url = "/user/info";
			
			comm.sendJson(url, null, "POST", function(resp) {
				$("#buyerName").val(resp.name);
				$("#buyerEmail").val(resp.email);
				$("#buyerPhone").val(resp.phone);
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
        	let amount = $("#totalPrice").text().replaceAll(",", "");
        	
        	// 일자 분리
        	let checkInDate = $("#checkInDate").attr("data-date");
        	let checkOutDate = $("#checkOutDate").attr("data-date");
        	
        	data = {
				"partner_idx" : $("#partnerName").attr("data-partner-idx"),
        		"room_idx" : roomIdx,
        		"check_in_date" : checkInDate,
        		"check_out_date" : checkOutDate,
        		"guest_cnt" : $("#guest").text(),
        		"price" : amount,
        		"calculate_price" : amount - Math.ceil(amount / 10),
        		"reservation_code" : code,
        		"name" : name,
        	};
        	
        	requestPay(data);
		},
	};
	
	// 그리기
	let _draw = {
		drawDetail: function(data) {
			$("#partnerImg").attr("src", data.image);
			$("#partnerName").html(data.name).attr("data-partner-idx", data.partner_idx);
			$("#partnerAddress").html(data.address);
			$("#roomType").html(data.room_type);
			$("#guest").html(sessionStorage.getItem("search_guest"));
			$("#checkInDate").attr("data-date", sessionStorage.getItem("search_start_date"));
			$("#checkInDate").html(comm.formatDate(sessionStorage.getItem("search_start_date")));
			$("#checkOutDate").attr("data-date", sessionStorage.getItem("search_end_date"));
			$("#checkOutDate").html(comm.formatDate(sessionStorage.getItem("search_end_date")));
			$("#onePrice").html(comm.numberWithComma(sessionStorage.getItem("reservation_one_price")));
			$("#totalPrice").html(comm.numberWithComma(sessionStorage.getItem("reservation_total_price")));
			$("#checkIn").html(data.check_in);
			$("#checkOut").html(data.check_out);
			
			// _sessionReset();
		},
	};
	
	// 예약 세션 삭제
	function _sessionReset() {
		sessionStorage.removeItem("reservation_total_price");
		sessionStorage.removeItem("reservation_one_price");
	};
	
	// 결제창
	function requestPay(data) {
        IMP.request_pay({
            pg : "html5_inicis",
            pay_method : "card",
            merchant_uid: data.reservation_code, 
            name : data.name,
            amount : 1,
            buyer_email : $("#buyerEmail").val(),
            buyer_name : $("#buyerName").val(),
            buyer_tel : $("#buyerPhone").val(),
        }, function (resp) { 
			if (resp.success) {
				let url = "/payment/reservation";
				
				data.imp = resp.imp_uid;
				
				comm.sendJson(url, data, "POST", function(resp2) {
					alert("결제가 완료되었습니다.");
					// location.href = "/mtl/reservationConfirm?code=" + resp2.reservation_idx;
				});
			} else {
				// 에러
				alert("결제에 실패하였습니다.");
			}
        });
    };

	return {
		init,
	};
})();
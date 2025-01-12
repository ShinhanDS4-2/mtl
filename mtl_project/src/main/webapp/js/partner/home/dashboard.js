const dashboard = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_event.getInfo();
		_eventInit();
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='dashboard'][data-act]").off();
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
		}
		
	};
	
	// 이벤트
	let _event = {
		getInfo: function() {
			let url = "/partner/dashboard/info";
			
			let data = {};
			
			comm.sendJson(url, data, "POST", function(resp) {
				// 객실 예약
				let today = new Date();   
				let year = today.getFullYear(); 
				let month = today.getMonth() + 1; 
				let date = today.getDate(); 
				
				$("#today").html(year + "-" + month + "-" + date);
				
				let roomList = $("#roomList").empty();
				for (let data of resp.room) {
					let row = 
					`
						<div class="item d-flex justify-content-between border-bottom mt-2 mb-4">
							<h6>${data.room_type}</h6>
							<p>${data.cnt} / ${data.count}</p>
						</div>
					`;
					
					roomList.append(row);
				};
				
				// 매출
				$("#today_pay").html(comm.numberWithComma(resp.payout.today_sale) + "원");
				$("#month_pay").html(comm.numberWithComma(resp.payout.month_sale) + "원");
				
				// 평점
				let score = resp.score.score
				$("#score").html(score);
				let star = $("#star");
				for (let i = 0; i < score; i++) {
					star.append("<i class='fas fa-star text-warning'></i>");
				};
				for (let i = 0; i < 5 - score; i++) {
					star.append("<i class='far fa-star text-warning'></i>");
				};
				
				// 리뷰
				$("#review").html(resp.review.review_count);
				$("#noReply").html(resp.no_review.no_review_count);
				
				// 공지사항
				let noticeList = $("#noticeList").empty();
				for (let data of resp.notice) {
					let row = 
					`
						<div class="item d-flex justify-content-between border-bottom mt-2 mb-4">
							<h6>${data.title}</h6>
							<p>${data.date}</p>
						</div>
					`
					noticeList.append(row);
				};
			});
		}
	};
	
	return {
		init,
	};
})();
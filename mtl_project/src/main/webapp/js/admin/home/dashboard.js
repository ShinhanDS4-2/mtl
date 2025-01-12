const dashboard = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_event.getInfo();
		_eventInit();
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='dashboard'][data-act]").off();
		evo.on("click keyup", function(e) {
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
			let url = "/admin/dashboard/info";
			
			let data = {};
			
			comm.sendJson(url, data, "POST", function(resp) {
				$("#user").html(resp.user.today_user + " / " + resp.user.total_user);
				$("#partner").html(resp.partner.today_partner + " / " + resp.partner.total_partner);
				$("#question").html(resp.question.unanswer_count + " 건");
				$("#reservation").html(resp.reservation.cancel_reservation + " / " + resp.reservation.recent_reservation);
				
				$("#partner1_count").html(resp.partnerArea.seoul);
				$("#partner2_count").html(resp.partnerArea.gangneung);
				$("#partner3_count").html(resp.partnerArea.yeosu);
				$("#partner4_count").html(resp.partnerArea.busan);
				$("#partner5_count").html(resp.partnerArea.jeju);
				$("#location1_count").html(resp.locationArea.seoul);
				$("#location2_count").html(resp.locationArea.gangneung);
				$("#location3_count").html(resp.locationArea.yeosu);
				$("#location4_count").html(resp.locationArea.busan);
				$("#location5_count").html(resp.locationArea.jeju);
				
				let list = $("#recentPartnerList").empty();
				for (data of resp.recentPartner) {
					let col = 
						`
							<div class="col-lg-4">
								<div class="card shadow p-3">
									<div class="row g-4">
										<div class="col-md-3">
											<img src="${data.image}" class="rounded-2 w-100 h-100">
										</div>
										<div class="col-md-9">
											<div class="card-body position-relative d-flex flex-column p-0 h-100">
												<h5 class="card-title mb-2 me-5">
													<a href="/mtl/admin/accomodation/detail?idx=${data.partner_idx}">${data.name}</a>
												</h5>
												<small><i class="bi bi-geo-alt me-2"></i>${data.address}</small>
											</div>
										</div>
									</div>
								</div>
							</div>
						`;
						
					list.append(col);
				};
			});
		}
	};
	
	return {
		init,
	};
})();
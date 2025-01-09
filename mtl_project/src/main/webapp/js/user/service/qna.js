const qna = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_menuActive();
		_event.getList();
		_eventInit();
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='qna'][data-act]").off();
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
			if(action == "clickType") {
				_event.getList(evo.attr("data-type"));
			};
		};
	};
	
	// 이벤트
	let _event = {
		// 리스트
		getList: function(type = "ALL") {
			let url = "/faq//user/list";
			
			let data = {
				"type" : type 
			};
			
			comm.sendJson(url, data, "POST", function(resp) {
				_draw.drawList(resp.list);
			});
		}
	};
	
	let _draw = {
		drawList: function(list) {
			let qnaList = $("#accordionParent").empty();
			
			for (let data of list) {
				let row =
				`
					<div class="accordion-item mb-3">
						<h6 class="accordion-header" id="heading${data.faq_idx}">
							<button class="accordion-button fw-bold rounded d-inline-block collapsed d-block pe-5" type="button" data-bs-toggle="collapse" data-bs-target="#faq${data.faq_idx}" aria-expanded="false" aria-controls="faq${data.faq_idx}">
								<i class="fa-solid fa-q text-primary"></i> ${data.title}
							</button>
						</h6>
						<div id="faq${data.faq_idx}" class="accordion-collapse collapse" aria-labelledby="heading${data.faq_idx}" data-bs-parent="#accordionParent">
							<div class="accordion-body mt-3">
								<p class="space">${data.content}</p>
							</div>
						</div>
					</div>
				`;
				
				qnaList.append(row);
			};
			
			_eventInit();
		}
	};
	
	// 메뉴 active
	function _menuActive() {
		$("#serviceQnA").addClass("active");
	};
	
	return {
		init,
	};
})();
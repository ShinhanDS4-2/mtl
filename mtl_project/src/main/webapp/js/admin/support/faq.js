const faq = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_eventInit();
		_event.getList();
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='faq'][data-act]").off();
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
			if(action == "clickSearch") {
				_event.getList();
			} else if (action == "clickUpdate") {
				_event.clickUpdate(evo);
			} else if (action == "clickRegist") {
				_event.clickRegist();
			} else if (action == "clickModal") {
				$("#questionTitle").val("");
				$("#questionContent").val("");
			}
		};
	};
	
	// 이벤트
	let _event = {
		// 리스트
		getList: function(curPage = 1) {
			let url = "/faq/list";
			
			let  data = {
				"searchType" : $("#searchType option:selected").val(),
				"searchStatus" : $("input[name='searchStatus']:checked").val(),
				"searchKeyword" : $("#searchKeyword option:selected").val(),
				"searchText" : $("#searchText").val()
			};
			
			// 페이징
			let pageOption = {
				limit: 5
			};
			
			let page = $("#pagination").customPaging(pageOption, function(_curPage){
				_list.getPartnerList(_curPage);
			});
			
			let pageParam = page.getParam(curPage);
			
			if(pageParam) {
				data.offset = pageParam.offset;
				data.limit = pageParam.limit;
			};
			
			comm.sendJson(url, data, "POST", function(resp) {
				_draw.drawList(resp.list);
				$("#totalCnt").html(resp.totalCnt);
				page.drawPage(resp.totalCnt);
			});
		},
		
		// 상태변경
		clickUpdate: function(evo) {
			modal.confirm({
				"content" : "상태를 변경하시겠습니까?",
				"confirmCallback" : function() {
					let url = "/faq/update";
					
					let  data = {
						"faq_idx" : evo.attr("data-faq-idx"),
						"status" : evo.attr("data-faq-status") == "Y" ? "N" : "Y"
					};
					
					comm.sendJson(url, data, "POST", function() {
						modal.alert({
							"content" : "상태가 변경되었습니다.",
							"confirmCallback" : function() {
								_event.getList();
							}
						});
					});
				}
			});
		},
		
		// 질문 등록
		clickRegist: function() {
			let url = "/faq/regist";
			
			let  data = {
				"title" : $("#questionTitle").val(),
				"content" : $("#questionContent").val(),
				"type" : $("#questionType option:selected").val(),
			};
			
			// 데이터 null 체크
			for (let key in data) {
				if (data[key] == null || data[key] == "") {
					modal.alert({
						"content" : "입력되지 않은 값이 있습니다."
					});
					return;
				};
			};
					
			modal.confirm({
				"content" : "질문을 등록하시겠습니까?",
				"confirmCallback" : function() {
					comm.sendJson(url, data, "POST", function() {
						modal.alert({
							"content" : "질문이 등록되었습니다.",
							"confirmCallback" : function() {
								_event.getList();
								$("#qnaRegistModal").modal("hide");
							}
						});
					});
				}
			});
		}
    };
    
    let _draw = {
    	drawList: function(list) {
    		let faqList = $("#faqList").empty();
    		
    		for (let data of list) {
	    		let row =
	    			`
	    				<div>
							<div class="row align-items-lg-center g-4 px-2 py-4">
								<div class="col-2">
									<small class="d-block d-lg-none">분류</small>
									<h6 class="ms-1 mb-0 fw-normal">${data.type}</h6>
								</div>
								<div class="col-6">
									<small class="d-block d-lg-none">제목</small>
									<a role="button" class="text-primary fw-bold ms-1 mb-0" data-bs-toggle="collapse" data-bs-target="#faq${data.faq_idx}" aria-expanded="false" aria-controls="faq${data.faq_idx}">${data.title}</a>
								</div>
								<div class="col-2">
									<small class="d-block d-lg-none">작성일</small>
									<h6 class="ms-1 mb-0 fw-normal">${data.create_date_format}</h6>
								</div>
								<div class="col-2">
									<small class="d-block d-lg-none">상태</small>
								<div class="ms-1 badge bg-opacity-10 ${data.status == 'Y' ? 'bg-success text-success' : 'bg-danger text-danger'}">${data.status == 'Y' ? '게시중' : '게시중단'}</div>
								</div>	
							</div>
							<div id="faq${data.faq_idx}" class="accordion-collapse collapse" aria-labelledby="heading-1" data-bs-parent="#faqList">
								<div class="accordion-body border rounded">
									<div class="d-flex justify-content-between">
										<p class="space pe-2 col-10">${data.content}</p>
										<button type="button" class="btn btn-primary-soft col-2 h-40px" style="place-self:center;" data-src="faq" data-act="clickUpdate" data-faq-status="${data.status}" data-faq-idx="${data.faq_idx}">상태변경</button>
									</div>
								</div>
							</div>
						</div>
	    			` 
	    		
	    		faqList.append(row);
    		};
    		
    		_eventInit();
    	},
    };
	
	return {
		init,
	};
})();
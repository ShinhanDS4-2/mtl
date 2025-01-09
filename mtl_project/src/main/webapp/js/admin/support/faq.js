const faq = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_eventInit();
		//_event.getList();
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
			} else if (action == "clickDeatil") {
				_event.clickDetail(evo);
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
		
		// 내용 보기
		clickDetail: function(evo) {
			
		},
    };
    
    let _draw = {
    	drawList: function(list) {
    		let faqList = $("#faqList").empty();
    		
    		for (let data of list) {
	    		let row =
	    			`
	    				<div class="row align-items-lg-center border-bottom g-4 px-2 py-4">
							<div class="col-2">
								<small class="d-block d-lg-none">분류</small>
								<h6 class="ms-1 mb-0 fw-normal">${data.type}</h6>
							</div>
							<div class="col-6">
								<small class="d-block d-lg-none">제목</small>
								<a role="button" class="text-primary fw-bold ms-1 mb-0" data-bs-toggle="modal" data-bs-target="#detailModal" data-scr="faq" data-act="clickDetail" data-faq-idx="${data.faq_idx}">${data.title}</a>
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
const question = (function() {

	 // 초기화
    function init() {
    	_getList();
    	_eventInit();
    }

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='question'][data-act]").off();
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
			if(action == "clickSearch") {
				_getList();
			}	
		};
	};
	
	function _getList(curPage = 1) {
		let url = "/partner/question/list";
		
		let data = {
			"answerStatus" : $("input[name='searchStatus']:checked").val(),
			"searchField" : $("#searchType option:selected").val(),
			"searchText" : $("#searchText").val()
		};
		
		// 페이징 START
		let pageOption = {
            limit: 5  
		};
		
		let page = $("#pagination").customPaging(pageOption, function(_curPage){  
            _getList(_curPage);  
		});
		
		let pageParam = page.getParam(curPage); 
		
		if(pageParam) { 
			data.offset = pageParam.offset;
			data.limit = pageParam.limit;
		};
		// 페이징 END
		
		comm.sendJson(url, data, "POST", function(resp) {
			$("#totalCnt").text(resp.totalCnt);
            _draw.drawList(resp.list);
            page.drawPage(resp.totalCnt); 
		});
	};
	
	let _draw = {
		drawList: function(list) {
			let questiohnList = $("#questionList").empty();
			
			let button = '';
			for (let data of list) {
                if(data.answer_yn == 'Y'){
                    button=`<div class="ms-1 badge bg-success bg-opacity-10 text-success">답변 완료</div>`
                } else{
                    button=`<div class="ms-1 badge bg-danger bg-opacity-10 text-danger">답변 대기</div>`
                };
                
				let row = 
				`
					<div class="row row-cols-xl-4 align-items-lg-center border-bottom g-4 px-2 py-4">
						<div class="col">
							<small class="d-block d-lg-none">제목</small>
							<a role="button" href="/mtl/partner/question/reply?idx=${data.question_idx}" class="ms-1 mb-0 fw-bold text-primary">
							${data.title}
							</a>
						</div>
						<div class="col">
							<small class="d-block d-lg-none">작성자</small>
							<h6 class="ms-1 mb-0 fw-normal">${data.email}</h6>
						</div>
						<div class="col">
							<small class="d-block d-lg-none">작성일</small>
							<h6 class="ms-1 mb-0 fw-normal">${data.format_date}</h6>
						</div>
						<div class="col">
							<small class="d-block d-lg-none">답변상태</small>`
							+ button +
						`</div>
					</div>
				`
			
				questiohnList.append(row);
			};
			
			_eventInit();
		}
	};

    return {
        init: init,
    };
})();

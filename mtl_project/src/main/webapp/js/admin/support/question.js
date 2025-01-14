const question = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
        getList();
		_eventInit();
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='question'][data-act]").off();
		evo.on("click", function(e) {
			_eventAction(e);
		});
		
		$(document).on("click","#searchButton",function(){
			getList();
		});

        $(document).on("click","#resetButton",function(){
        	window.location.reload();			
		});
	};
	
	// 이벤트 분기
	function _eventAction(e) {
		let evo = $(e.currentTarget);
		
		let action = evo.attr("data-act");
		
		let type = e.type;
		
		if(type == "click") {
			if (action == "clickDetail") {
				getDetail(evo);
			} else if (action == "clickRegistAnswer") {
				registAnswer(evo);
			}
		};
	};
	
    function getList(curPage=1) {
		let param = {
			"answerStatus" : $("input[name='flexRadioDefault']:checked").val(),
			"searchField" : $("#searchType option:selected").val(),
			"searchText" : $("#searchText").val()
		};
        
		// 페이징 START
		let pageOption = {
            limit: 5  
		};
		
		let page = $("#pagination").customPaging(pageOption, function(_curPage){  
            getList(_curPage);  
		});
		
		let pageParam = page.getParam(curPage);  // 현재 페이지 번호(curPage)를 기준으로 페이징에 필요한 정보(예: offset, limit)를 반환.
		
		if(pageParam) {  // 위 코드에서 받은 pageParam값을 ajax에 넘겨줄 데이터에 설정하는 부분
			param.offset = pageParam.offset;
			param.limit = pageParam.limit;
		};
		// 페이징 END

        $.ajax({
            url:"/mtl/admin/accomodation/question/list",
            type:"POST",
            contentType:"application/json",
            data:JSON.stringify(param),
            success:function(response){
                $("#totalCnt").text(response.totalCnt);
	            _draw.drawAnswerList(response.list);
	            page.drawPage(response.totalCnt); 
            }
        });
	};
	
	function getDetail(evo) {
		$("#questionAnswer").val("");
	
		let idx = evo.attr("data-question-idx");
		
		let param = {"question_idx" : idx};

        $.ajax({
            url:"/mtl/admin/accomodation/question/detail",
            type:"POST",
            contentType:"application/json",
            data:JSON.stringify(param),
            success:function(response){
            	let status = response.data.answer_yn;
            	if(status == "Y") {
            		$("#answerField").addClass("d-none");
            		$("#replyField").removeClass("d-none");
            		$("#replyContent").html(response.data.answer);
            	} else {
            		$("#answerField").removeClass("d-none");
            		$("#replyField").addClass("d-none");
            	}
            	$("#questionContent").html(response.data.content);
                $("#questionModal").modal("show");
                $("#registAnswerBtn").attr("data-question-idx", idx);
            }
        });
	};
	
	function registAnswer(evo) {
		let idx = evo.attr("data-question-idx");
		
		let param = {
			"answer" : $("#questionAnswer").val(),
			"question_idx" : idx
		};

        $.ajax({
            url:"/mtl/admin/accomodation/question/answer",
            type:"POST",
            contentType:"application/json",
            data:JSON.stringify(param),
            success:function(response){
            	modal.alert({
            		"content" : "답변이 등록되었습니다.",
            		"confirmCallback" : function() {
            			getList();
            			$("#questionModal").modal("hide");
            		}
            	});
            	
            }
        });
	};
	
	function getDetail(evo) {
		$("#questionAnswer").val("");
	
		let idx = evo.attr("data-question-idx");
		
		let param = {"question_idx" : idx};

        $.ajax({
            url:"/mtl/admin/accomodation/question/detail",
            type:"POST",
            contentType:"application/json",
            data:JSON.stringify(param),
            success:function(response){
            	let status = response.data.answer_yn;
            	if(status == "Y") {
            		$("#answerField").addClass("d-none");
            		$("#replyField").removeClass("d-none");
            		$("#replyContent").html(response.data.answer);
            	} else {
            		$("#answerField").removeClass("d-none");
            		$("#replyField").addClass("d-none");
            	}
            	$("#questionContent").html(response.data.content);
                $("#questionModal").modal("show");
                $("#registAnswerBtn").attr("data-question-idx", idx);
            }
        });
	};
	
	let _draw = {

        ToDate: function (timestamp) {
            
            let date = new Date(timestamp);
    
            let year = date.getFullYear();
            let month = String(date.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작
            let day = String(date.getDate()).padStart(2, '0');
            
            return `${year}-${month}-${day}`;
        },

        drawAnswerList:function(list){

            let answerList=$("#answerList").empty();

            for(let data of list){

                let button='';

                if(data.answer_yn == 'Y'){
                    button=`<div class="badge bg-success bg-opacity-10 text-success">답변 완료</div>`
                } else{
                    button=`<div class="badge bg-danger bg-opacity-10 text-danger">답변 대기</div>`
                }

                let row = $("<div>").addClass("row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4 text-center d-flex justify-content-center align-items-center");
                answerList.append(row);


                let content_col=$("<div>").addClass("col");
                row.append(content_col);

                let content_h6=$("<h6>").addClass("ms-1 mb-0 fw-normal").html(data.title);
                content_col.append(content_h6);
                
                let user_col=$("<div>").addClass("col");
                row.append(user_col);

                let user_h6=$("<h6>").addClass("ms-1 mb-0 fw-normal").html(data.name);
                user_col.append(user_h6);
                
                let create_date_col=$("<div>").addClass("col");
                row.append(create_date_col);

                let create_date_h6=$("<h6>").addClass("ms-1 mb-1 fw-light").html(data.format_date);
                create_date_col.append(create_date_h6);

                let answer_yn=$("<div>").addClass("col");
                row.append(answer_yn);

                answer_yn.append(button);
                
                let detail = $("<div>").addClass("col");
	            row.append(detail);
	            
	            let detail_link = $("<a>")
	                .addClass("btn btn-sm btn-light mb-0")
	                .html("상세보기")
	                .attr({
	                	"href" : "javascript:;",
	                	"id" : "detailBnt",
	                	"data-question-idx" : data.question_idx,
	                	"data-act" : "clickDetail",
	                	"data-src" : "question"
	                });
	            detail.append(detail_link);
            };
            
            _eventInit();
        }

    }
	
	return {
		init,
	};
})();
const questionManagement = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
        fetchPayoutList();
		_eventInit();
	};

	// 이벤트 초기화 
	function _eventInit() {
		
		$(document).on("click","#searchButton",function(){
			fetchPayoutList();
		});

        $(document).on("click","#resetButton",function(){
        	window.location.reload();			
		});
	};
	
    function fetchPayoutList(curPage=1) {  //  _curPage=1 : 처음 화면 접속 시 1페이지부터 시작

		let param = {};
        
		// 페이징 START
		let pageOption = {
            limit: 5  
		};
		
		let page = $("#pagination").customPaging(pageOption, function(_curPage){  // customPaging은 사용자 정의함수로 페이징 로직을 생성한다. 
            // ㄴ pageOption객체를 넘겨 한 페이지에 표시할 데이터 수(limit)를 전달.
            // _curPage: 현재 사용자가 보고 있는 페이지 번호.
            
            fetchPayoutList(_curPage);  // 현재 페이지 번호를 전달받아 해당 페이지에 표시할 데이터를 가져오는 함수.
		});
		
		let pageParam = page.getParam(curPage);  // 현재 페이지 번호(curPage)를 기준으로 페이징에 필요한 정보(예: offset, limit)를 반환.
		
		if(pageParam) {  // 위 코드에서 받은 pageParam값을 ajax에 넘겨줄 데이터에 설정하는 부분
			param.offset = pageParam.offset;
			param.limit = pageParam.limit;
		};
		// 페이징 END
		
		let answerStatus=$("input[name='flexRadioDefault']:checked").val();     	  //라디오 버튼 (전체, 답변 대기, 완료 중 선택)
        let searchField=$(".form-select.js-choice").val();                            //숙소명, 사용자명, 내용 중 선택
        let searchText=$("input[type='text']").val();                                 //입력창에 검색한 내용
        
        console.log(answerStatus);
        console.log(searchField);
        console.log(searchText);
        
        param.answerStatus = answerStatus;
        param.searchField = searchField;
        param.searchText = searchText;

        $.ajax({
            url:"/mtl/admin/accomodation/question/search",
            type:"POST",
            contentType:"application/json",
            data:JSON.stringify(param),
            success:function(response){
                console.log("검색 결과 : ",response);
                
                $("#totalCnt").text(response.totalCnt);
                _draw.drawAnswerList(response.list);
                page.drawPage(response.totalCnt); 
            },
            error:function(error){
                console.error("검색 오류 : ",error);
            }
        });
	}
	
	
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

                if(data.answerYN == 'Y'){
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

                let user_h6=$("<h6>").addClass("ms-1 mb-0 fw-normal").html(data.userName);
                user_col.append(user_h6);
                

                let create_date_col=$("<div>").addClass("col");
                row.append(create_date_col);

                let create_date_h6=$("<h6>").addClass("ms-1 mb-1 fw-light").html(this.ToDate(data.create_date));
                create_date_col.append(create_date_h6);

                let answer_yn=$("<div>").addClass("col");
                row.append(answer_yn);

                answer_yn.append(button);
                
                let detail = $("<div>").addClass("col");
	            row.append(detail);
	            
	            let detail_link = $("<a>")
	                .addClass("btn btn-sm btn-light mb-0")
	                .html("상세보기")
	                .attr("href", "javascript:;")
	                .on("click", function () {

	                    $("#questionContent").html(data.content);
	                    $("#replyContent").html(data.answer || "");
	                    $("#questionModal").modal("show");
	                });
	            detail.append(detail_link);


            }
        }

    }
	
	return {
		init,
	};
})();
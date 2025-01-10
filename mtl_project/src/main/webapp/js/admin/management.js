const partnerList = (function() {

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
            limit: 5  // 한페이지에 몇개의 data item을 띄울지 설정  => 얘는 쿼리로 넘겨줄 정보
		};
		
		// 사용자가 $("#pagination") 부분 요소(페이지 번호)를 클릭하면 customPaging 콜백함수 호출하는 부분
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
		
		let answerArea=$("input[name='flexRadioDefault']:checked")
            .map(function(){
                return $(this).val();
            })
            .get();

        console.log(answerArea);
        let searchText=$("input[name='searchText']").val();                                 //입력창에 검색한 내용
        
        console.log(answerArea);
        console.log(searchText);
        if (answerArea.length > 0) {
            param.answerArea=answerArea;
        }
        param.searchText=searchText;

        $.ajax({
            url:"/mtl/admin/accomodation/list",
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

                console.log(data);

                let row = $("<div>").addClass("row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4 text-center d-flex justify-content-center align-items-center");
                answerList.append(row);

                let area_col=$("<div>").addClass("col");
                row.append(area_col);

                let area_h6=$("<h6>").addClass("ms-1 mb-0 fw-normal").html(data.area);
                area_col.append(area_h6);

                let name_col=$("<div>").addClass("col");
                row.append(name_col);

                let name_h6=$("<h6>").addClass("ms-1 mb-0 fw-normal").html(data.name);
                name_col.append(name_h6);

                let room_col=$("<div>").addClass("col");
                row.append(room_col);

                let room_h6=$("<h6>").addClass("ms-1 mb-0 fw-normal").html(data.room_count);
                room_col.append(room_h6);

                let create_date_col=$("<div>").addClass("col");
                row.append(create_date_col);

                let create_date_h6=$("<h6>").addClass("ms-1 mb-1 fw-light").html(this.ToDate(data.create_date));
                create_date_col.append(create_date_h6);
                
                let detail = $("<div>").addClass("col");
	            row.append(detail);

	            let detail_link = $("<a>")
	                .addClass("btn btn-sm btn-light mb-0")
	                .html("상세보기")
	                .attr("href", "admin/accomodation/detail")
	                .on("click", function () {

	                });
	            detail.append(detail_link);


            }
        }

    }
	
	return {
		init,
	};
})();
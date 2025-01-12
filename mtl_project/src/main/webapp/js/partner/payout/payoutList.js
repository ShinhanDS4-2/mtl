const payout = (function() { 
	let isSearchClicked = false;  // 검색 버튼 클릭 여부 상태 관리 
 
	// js 로딩 시 이벤트 초기화 실행   
	function init() {         
		fetchPayoutList();  // 페이지 로드 시 정산내역 리스트를 가져옴
		_eventInit();  
	};    
	                      
	// 이벤트 초기화         
	function _eventInit() {  
		let evo = $("[data-src='payout'][data-act]").off();
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
			if(action == "clickSearchButton") {  // 검색필터에서 검색버튼 클릭 시 
				_event.clickSearchButton(evo);
			}
		};
	};
	
	// 이벤트     
	let _event = {
		// 검색필터 검색 버튼 클릭 시
		clickSearchButton: function() {   
			isSearchClicked = true; // 검색 버튼 클릭 여부 상태 관리     
			fetchPayoutList();  // 조건에 맞는 리스트 조회
		}, 

	};  // let _event 끝
 
  
	// 정산내역 리스트를 가져오는 메서드
	function fetchPayoutList(curPage=1) {  //  _curPage=1 : 처음 화면 접속 시 1페이지부터 시작
		// 그냥 조회했을 때 기본 param값 => 전체조회
		let param = { 
			// 검색필터
			"calculate_date_start" : '',  
			"calculate_date_end" : '',  
			"calculate_status" : ''     
		}; 

		// 검색 버튼이 클릭된 경우 조건 추가
		if (isSearchClicked) {  
			// 검색필터에 입력된 데이터 가져오기
			let [startDate, endDate] = $("#searchDateRange").val().split(" ~ ").map(date => date.trim());
			let payoutStatus = $("input[name='payoutStatus']:checked").val();  // val값은 "" / Y / N
			
			// 검색필터 달력 -> 날짜 하루만 조회 시 or 날짜 하루이상 조회 시 2가지 경우 분기
			if (endDate == null || endDate == "" ) {  // 1. 날짜 하루만 조회 시 (종료일, 시작일 데이터 동일하게 만들어줌)
				endDate = startDate;  
			}  // 2. 날짜 하루이상 조회 시 -> 별도 처리 안해줘도댐
    

			param = { // ajax로 넘겨줄 data값 변수 선언
				"calculate_date_start" : startDate, 
				"calculate_date_end" : endDate,
				"calculate_status" : payoutStatus
			};
			console.log("검색 조건은??????????:", param);
		} else {
			console.log("전체 리스트 조회");
		}

		/* 페이징 START */
		let pageOption = {
			limit: 10  // 한페이지에 몇개의 data item을 띄울지 설정  => 얘는 쿼리로 넘겨줄 정보
		};
		// 사용자가 $("#pagination") 부분 요소(페이지 번호)를 클릭하면 customPaging 콜백함수 호출하는 부분
		let page = $("#pagination").customPaging(pageOption, function(_curPage){  
			fetchPayoutList(_curPage);  // 현재 페이지 번호를 전달받아 해당 페이지에 표시할 데이터를 가져오는 함수.
		});
		
		let pageParam = page.getParam(curPage);  // 현재 페이지 번호(curPage)를 기준으로 페이징에 필요한 정보(예: offset, limit)를 반환.
		
		if(pageParam) {  // 위 코드에서 받은 pageParam값을 ajax에 넘겨줄 데이터에 설정하는 부분
			param.offset = pageParam.offset;
			param.limit = pageParam.limit;
		};
		/* 페이징 END */
		   
		$.ajax({
			type: "POST", 
			url: "/mtl/api/partner/payout/list",   // API 호출
			data: param,   // 호출 시 param값으로 넘겨줄 것 => 정산기간시작일, 정산기간종료일, 정산상태, 페이징offset, 페이징limit

			success: function(response) {   //  API 호출 결과 값: PayoutListCount, PayoutList
				_draw.drawPayoutList(response);  // 리스트 그려줌
				console.log("졸리다", response);
				page.drawPage(response.PayoutListCount);  // 페이지번호 계산 및 렌더링
			},
			error: function(xhr, status, error) {
				console.error("Error :", error); 
			} 
		});  
	}

 
	let _draw = {  
		// 정산내역 페이지
		drawPayoutList: function(list) {  // 위에 API 호출 결과 값으로 받은 response(=PayoutListCount, PayoutList)값을 list라는 이름의 매개변수로 넘겨준다. 
			let partnerInfo = list.partnerInfo;
			let listCount = list.PayoutListCount;
			let payoutList = list.PayoutList;
			let param = list.Param;

		/* 정산정보 Card */
			$("#business_name").html(partnerInfo.business_name);
			$("#business_number").html(partnerInfo.business_number);
			$("#account_number").html(`${partnerInfo.account_bank} ${partnerInfo.account_number}  (예금주:${partnerInfo.account_name})`);


		/* 정산내역 리스트 상단 Tap */
			$("#payoutListCount").html(`총 ${listCount}개`);

		/* 정산내역 리스트 card */
 
			// 정산내역 리스트 Card header 
			$("#settlementDateLabel").html(`정산일 기준 ${param.calculate_date_start} ~  ${param.calculate_date_end}`);
			
			let cardData = $("#cardData");
			cardData.empty();

			// 정산내역 리스트 Data 반복 출력
			for(data of payoutList) { 
				let tableData =
						`<div class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4 text-center">
							<div class="col">
								<small class="d-block d-sm-none">정산일</small>
								<h6 class="ms-1 mb-0 fw-normal">${data.calculate_date}</h6>
								<a role="button" class="payoutDetail mb-0 fw-normal ms-1"
									data-bs-toggle="modal" data-bs-target="#payoutDetailModal"
									data-calculate-date="${data.calculate_date}">상세보기</a>
							</div>

							<div class="col">
								<small class="d-block d-sm-none">총 판매 금액</small>
								<h6 class="ms-1 mb-0 fw-normal">${comm.numberWithComma(data.total_price)}원</h6>
							</div>
  
							<div class="col">    
								<small class="d-block d-sm-none">총 정산 금액</small>
								<h6 class="ms-1 mb-0 fw-normal">${comm.numberWithComma(data.total_calculate_price)}원</h6>
							</div>
							<div class="col">
								<small class="d-block d-sm-none">정산 대기</small>
								<h6 class="ms-1 mb-0 fw-normal">${comm.numberWithComma(data.pending_amount)}원</h6>
							</div>
							<div class="col">    
								<small class="d-block d-sm-none">정산 완료</small>
								<h6 class="mb-0 fw-normal d-inline-block">${comm.numberWithComma(data.completed_amount)}원</h6>
								<a href="#" class="h6 mb-0 d-inline-block" role="button" id="dropdownShare1"
									data-bs-toggle="dropdown" aria-expanded="false"><i class="bi bi-info-circle-fill"></i>
								</a>        
								<ul class="dropdown-menu dropdown-w-sm dropdown-menu-end min-w-auto shadow rounded"
									aria-labelledby="dropdownShare1">
									<li>    
										<div class="d-flex justify-content-between">
											<span class="small">판매가</span> <span    
												class="h6 mb-0 small ms-2">${comm.numberWithComma(data.total_price)}</span>
										</div>     
										<hr class="my-1"> 
									</li>
									<li>
										<div class="d-flex justify-content-between">
											<span class="me-4 small">수수료</span> <span
												class="text-danger small ms-2">-${comm.numberWithComma(data.total_price-data.total_calculate_price)}</span>
										</div>
										<hr class="my-1">
									</li>
									<li>
										<div class="d-flex justify-content-between">
											<span class="small">정산금액</span> <span
												class="h6 mb-0 small ms-2">${comm.numberWithComma(data.total_calculate_price)}</span>
										</div>
									</li>
								</ul>
							</div>
						</div>`;
					cardData.append(tableData);

			}
	
		/* 정산내역 리스트 card END */	

			// 정산 상세보기 버튼 클릭 시 이벤트
			$(".payoutDetail").click(function() {  
				let calculate_date = $(this).data("calculate-date");// jQuery의 .data() 메서드를 사용해 data-* 속성에 저장된 값을 가져옴.
				console.log("calculate_date값은 ??????????????", calculate_date);
				$.ajax({  // ajax로 정산 상세내역 리스트 API호출하고 param으로 정산일calculate_date 보냄
					type: "POST",
					type: "POST",
					url: "/mtl/api/partner/payout/detailList", 
					data: { "calculate_date": calculate_date },  // API호출 시 param값으로 넘겨줄 정보 => 정산일calculate_date
					success: function(resp){  // API호출 성공 시 결과 값 response
						console.log("ajax에서 resp값은 ??? >>>>");  
						console.log(resp);  // PayoutDetailList, calculate_date가 들어있어야 함

						_draw.drawPayoutDetailModal(resp);  // 받은 응답을 모달에 렌더링
						_eventInit();  // html이 전부 그려진 후 호출되어야 작동함.

					},
					error: function(xhr, status, error) {
						console.error("Error :", error);  // 오류 처리
					}
				});
			});

		},
		// 정산 상세보기 리스트 모달 그리기
		drawPayoutDetailModal: function(list) {
  
			/* 정산 상세정보 modal START */
			// 정산일
			$("#modalCalculateDate").html(`${list.calculate_date}`);

			// 정산 내역 데이터 
			let tbody = $("#modalTBody");
			tbody.empty();

			for(data of list.PayoutDetailList) {

				console.log("data값은 ??? >>>>");
				console.log(data);  // calculate_date가 들어있어야 함

				// 정산 내역
				let tdata =  
					`<tr>
						<td>${data.idx}</td>
						<td>${data.room_type}</td>
						<td>${comm.numberWithComma(data.price)}원</td>
						<td>${comm.numberWithComma(data.calculate_price)}원</td>
						<td>${data.calculate_status}</td>
					</tr>`;	
				tbody.append(tdata);
			}
			/* 정산 상세정보 modal END */

		}
    };

    return {
        init
    };

})(); 
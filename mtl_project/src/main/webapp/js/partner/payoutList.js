const payout = (function() { 
 
	// js 로딩 시 이벤트 초기화 실행 
	function init() {
		fetchPayoutList();  // 페이지 로드 시 정산내역 리스트를 가져옴

		_eventInit();    
	};      
      
	// 이벤트 초기화       
	function _eventInit() {
		let evo = $("[data-src='reservation'][data-act]").off();
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
			/* 
			if(action == "clickDeatilModal") {
				_event.clickDeatilModal(evo);  
			}
				*/
		};
	};
	
	// 이벤트
	/*
	let _event = {
		// 예약내역 상세 정보 모달 클릭 시
		clickDeatilModal : function(evo) {
			let reservation_idx evo.attr("data-reservation-idx");
			let src = evo.attr("data-src"); // 데이터 소스 ("reservation")

			console.log("예약 ID:", reservationIdx); // 예: 123
			console.log("데이터 소스:", src); // 예: "reservation"

		}
	
	};
	*/


	// fetchPayoutList();  페이지 로드 시 정산내역 리스트를 가져오는 함수
	function fetchPayoutList(curPage=1) {  //  _curPage=1 : 처음 화면 접속 시 1페이지부터 시작
		
		let param = { // ajax로 넘겨줄 data값 변수 선언
			"calculate_date_start" : '2024-12-20', 
			"calculate_date_end" : '2024-12-31',
			"calculate_stauts" : 'Y'
		};

		// 페이징
		let pageOption = {
			limit: 5  // 한페이지에 몇개의 data item을 띄울지 설정  => 얘는 쿼리로 넘겨줄 정보
		};
		
		// 사용자가 $("#pagination") 부분 요소(페이지 번호)를 클릭하면 customPaging 콜백함수 호출하는 부분
		let page = $("#pagination").customPaging(pageOption, function(_curPage){  // customPaging은 사용자 정의함수로 페이징 로직을 생성한다. 
												// ㄴ pageOption객체를 넘겨 한 페이지에 표시할 데이터 수(limit)를 전달.
												// _curPage: 현재 사용자가 보고 있는 페이지 번호.

			fetchReservationList(_curPage);  // 현재 페이지 번호를 전달받아 해당 페이지에 표시할 데이터를 가져오는 함수.
		});
		
		let pageParam = page.getParam(curPage);  // 현재 페이지 번호(curPage)를 기준으로 페이징에 필요한 정보(예: offset, limit)를 반환.
		
		if(pageParam) {  // 위 코드에서 받은 pageParam값을 ajax에 넘겨줄 데이터에 설정하는 부분
			param.offset = pageParam.offset;
			param.limit = pageParam.limit;
		};
		// 페이징 끝
		
		$.ajax({
			type: "POST", 
			url: "/mtl/api/partner/payout/list",   // API 호출
			data: param,   // 호출 시 param값으로 넘겨줄 것 => 필터(정산기간시작일, 정산기간종료일, 정산상태)

			success: function(response) {   //  API 호출 결과 값이 response 에 들어있음	(여기서 API 리턴값: PayoutListCount, PayoutList)
				
				_draw.drawPayoutList(response);
				// page.drawPage(response.ReservationListCount);  페이징 ??? 
				_eventInit();  // html이 전부 그려진 후 호출되어야 작동함.
			},
			error: function(xhr, status, error) {
				console.error("Error :", error); 
			}
		});  
	}


	let _draw = {  
		// 정산내역 리스트
		drawPayoutList: function(list) {  // 위에 API 호출 결과 값으로 받은 response(=PayoutListCount, PayoutList)값을 list라는 이름의 매개변수로 넘겨준다. 
			
			let listCount = list.PayoutListCount;
			let payoutList = list.PayoutList;
			let param = list.Param;

			
			/* 정산내역 리스트 상단 Tap START */
			let payoutListCountTap = $("#payoutListCountTap");
			payoutListCountTap.empty();
			let countTap = 
					`<div class="col-2">
						<h6 class="mb-1">총 ${listCount}개</h6>
					</div>
					<div class="col-1">
						<form>
							<select class="form-select js-choice"
								aria-label=".form-select-sm">
								<option>10개</option>
								<option>30개</option>
								<option>50개</option>
							</select>
						</form>
					</div>`;

			

			payoutListCountTap.append(countTap);



		/* 정산내역 리스트 card START */
			let payoutListCard = $("#payoutListCard");
			payoutListCard.empty();

			// 정산내역 리스트 card header
			let cardHead = 
				`<div class="card-header border-bottom d-sm-flex justify-content-sm-between align-items-sm-center">
					<div class="mb-1 mb-sm-0 text-center text-sm-start">
						<h5 class="card-title mb-1">정산 내역</h5>
						<span>정산일 기준 ${param.calculate_date_start} ~  ${param.calculate_date_end}</span>
					</div>
					<a href="#" class="btn btn-dark-soft mb-0 border-0"> <i
						class="fa-solid fa-download"></i></a>
				</div>`;
			payoutListCard.append(cardHead);


			// 정산내역 리스트 card body
			let cardBody = $("<div>").addClass("card-body");
			payoutListCard.append(cardBody);

			let tableHead = 
				`<div class="bg-light rounded p-3 d-none d-sm-block">
					<div class="row row-cols-7 g-4">
						<div class="col">
							<h6 class="mb-0">정산일</h6>
						</div>
						<div class="col">
							<h6 class="mb-0">총 판매 금액</h6>
						</div>
						<div class="col">
							<h6 class="mb-0">총 정산 금액</h6>
						</div>
						<div class="col">
							<h6 class="mb-0">정산 대기</h6>
						</div>
						<div class="col">
							<h6 class="mb-0">정산 완료</h6>
						</div>
					</div>
				</div>`;
			cardBody.append(tableHead);
				
			for(data of payoutList) {
				let tableData =
						`<div class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
							<div class="col">
								<small class="d-block d-sm-none">정산일</small>
								<h6 class="ms-1 mb-0 fw-normal">${data.calculate_date}</h6>
								<a role="button" class="payoutDetail mb-0 fw-normal ms-1"
									data-bs-toggle="modal" data-bs-target="#payoutDetailModal"
									data-src="payout" data-calculate-date="${data.calculate_date}">상세보기</a>
							</div>

							<div class="col">
								<small class="d-block d-sm-none">총 판매 금액</small>
								<h6 class="ms-1 mb-0 fw-normal">${data.total_price}원</h6>
							</div>

							<div class="col">
								<small class="d-block d-sm-none">총 정산 금액</small>
								<h6 class="ms-1 mb-0 fw-normal">${data.total_calculate_price}원</h6>
							</div>
							<div class="col">
								<small class="d-block d-sm-none">정산 대기</small>
								<h6 class="ms-1 mb-0 fw-normal">${data.pending_amount}원</h6>
							</div>
							<div class="col position-relative">
								<small class="d-block d-sm-none">정산 완료</small>
								<div class="d-flex">
									<h6 class="mb-0 me-2 fw-normal">${data.completed_amount}원</h6>
									<a href="#" class="h6 mb-0" role="button" id="dropdownShare1"
										data-bs-toggle="dropdown" aria-expanded="false"> <i
										class="bi bi-info-circle-fill"></i>
									</a>
									<ul
										class="dropdown-menu dropdown-w-sm dropdown-menu-end min-w-auto shadow rounded"
										aria-labelledby="dropdownShare1">
										<li>
											<div class="d-flex justify-content-between">
												<span class="small">판매가</span> <span
													class="h6 mb-0 small ms-2">${data.total_price}</span>
											</div>
											<hr class="my-1"> 
										</li>

										<li>
											<div class="d-flex justify-content-between">
												<span class="me-4 small">수수료</span> <span
													class="text-danger small ms-2">-${data.total_price-data.total_calculate_price}원</span>
											</div>
											<hr class="my-1">
										</li>
										<li>
											<div class="d-flex justify-content-between">
												<span class="small">정산금액</span> <span
													class="h6 mb-0 small ms-2">${data.total_calculate_price}</span>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>`;
				cardBody.append(tableData);

			}
			// Card footer START

			
		/* 정산내역 리스트 card END */	


			// 정산 상세보기 버튼 클릭 시 이벤트
			$(".payoutDetail").click(function() { 
				let calculate_date = $(this).data("calculate-date");// jQuery의 .data() 메서드를 사용해 data-* 속성에 저장된 값을 가져옴.
				console.log("calculate_date값은 ??????????????");
				console.log(calculate_date);
				$.ajax({  // ajax로 정산 상세내역 리스트 API호출하고 param으로 정산일calculate_date 보냄
					type: "POST",
					type: "POST",
					url: "/mtl/api/partner/payout/detailList", 
					data: { "calculate_date": calculate_date },  //" calculate_date" : calculate_date으로 써야함 / API호출 시 param값으로 넘겨줄 정보 => 정산일calculate_date
					success: function(response){  // API호출 성공 시 결과 값 response
						console.log("ajax에서 response값은 ??? >>>>");
						console.log(response);  // PayoutDetailList, calculate_date가 들어있어야 함

						_draw.drawPayoutDetailModal(response);  // 받은 응답을 모달에 렌더링
						_eventInit();  // html이 전부 그려진 후 호출되어야 작동함.

					},
					error: function(xhr, status, error) {
						console.error("Error :", error);  // 오류 처리
					}
				});
			});

		},
		// 정산 상세보기 리스트 모달
		drawPayoutDetailModal: function(list) {

				// console.log("list값은 ??? >>>>");
				// console.log(list);  // PayoutDetailList, calculate_date가 들어있어야 함
				// console.log("list.calculate_date값은 ??? >>>>");
				// console.log(list.calculate_date);  // calculate_date가 들어있어야 함
				// console.log("list.PayoutDetailList값은 ??? >>>>");
				// console.log(list.PayoutDetailList);  // PayoutDetailList가 들어있어야 함


			/* 정산 상세정보 modal START */
			let payoutmodalBody = $("#payoutmodalBody");
			payoutmodalBody.empty();

			// 정산일
			let modalBoby1 = 
				`<h6 class="fw-bold">정산일</h6>
				<div class="mb-3 border p-3">
					<p class="mb-0">${list.calculate_date}</p>
				</div>`;
				payoutmodalBody.append(modalBoby1);

			for(data of list.PayoutDetailList) {

				console.log("data값은 ??? >>>>");
						console.log(data);  // calculate_date가 들어있어야 함

				// 정산 내역
				let modalBody2 = 
					`<h6 class="fw-bold">정산 내역</h6>
					<div class="table-responsive">
						<table class="table border">
							<thead class="table-light">
								<tr>
									<th>예약번호</th>
									<th>객실 타입</th>
									<th>판매금액</th>
									<th>정산금액</th>
									<th>정산여부</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${data.idx}</td>
									<td>${data.room_type}</td>
									<td>${data.price}원</td>
									<td>${data.calculate_price}원</td>
									<td>${data.calculate_stauts}</td>
								</tr>
							</tbody>
						</table>
					</div>`;	
					payoutmodalBody.append(modalBody2);
			}
			/* 정산 상세정보 modal END */

		}
		
		
				
    };


 
    return {
        init
    };

})();
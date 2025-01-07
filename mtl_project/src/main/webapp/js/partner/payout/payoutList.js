const payout = (function() { 
	let isSearchClicked = false;  // 검색 버튼 클릭 여부 상태 관리

	// js 로딩 시 이벤트 초기화 실행 
	function init() {
		fetchPayoutList();  // 페이지 로드 시 정산내역 리스트를 가져옴
	};             
   
	// 검색버튼 클릭 시
	$("#searchButton").click(function() {
		isSearchClicked = true;
		fetchPayoutList();  // 조건에 맞는 리스트 조회
	});
  
	// fetchPayoutList();  페이지 로드 시 정산내역 리스트를 가져오는 함수
	function fetchPayoutList(curPage=1) {  //  _curPage=1 : 처음 화면 접속 시 1페이지부터 시작
		
		let param = { // ajax로 넘겨줄 data값 변수 선언
			"calculate_date_start" : '', 
			"calculate_date_end" : '',
			"calculate_stauts" : ''
		};  // Ajax 요청 파라미터

		// 검색 버튼이 클릭된 경우 조건 추가
		if (isSearchClicked) {
			// 검색필터에 입력된 데이터 가져오기
			let [startDate, endDate] = $("#dateRange").val().split(" ~ ").map(date => date.trim());
			let payoutStatus = $("input[name='payoutStatus']:checked").val();  // Y/N
			
			param = { // ajax로 넘겨줄 data값 변수 선언
				"calculate_date_start" : startDate, 
				"calculate_date_end" : endDate,
				"calculate_stauts" : payoutStatus
			};
			console.log("검색 조건:", param);
		} else {
			console.log("전체 리스트 조회");
		}

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
		
		$.ajax({
			type: "POST", 
			url: "/mtl/api/partner/payout/list",   // API 호출
			data: param,   // 호출 시 param값으로 넘겨줄 것 => 정산기간시작일, 정산기간종료일, 정산상태, 페이징offset, 페이징limit

			success: function(response) {   //  API 호출 결과 값이 response 에 들어있음	(여기서 API 리턴값: PayoutListCount, PayoutList)
				console.log(response);
				_draw.drawPayoutList(response);
				page.drawPage(response.PayoutListCount);  // 페이지번호 계산 및 렌더링 (=> 서버에서 반환한 전체 리스트 개수를 전달, 이를 기반으로 전체 페이지 수를 계산해서 사용자가 이동할 수 있는 페이지 번호를 화면에 표시해준다. )
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
					cardData.append(tableData);

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
						<td>${data.price}원</td>
						<td>${data.calculate_price}원</td>
						<td>${data.calculate_stauts}</td>
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
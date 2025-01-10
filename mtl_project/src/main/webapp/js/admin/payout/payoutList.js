const payout = (function() { 
	let isSearchClicked = false;  // 검색 버튼 클릭 여부 상태 관리  
	  
	// js 로딩 시 이벤트 초기화 실행      
	function init() {      
		fetchPayoutList();  // 전체정산내역 리스트를 조회 
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
			} else if(action == "payoutButton") {  // 정산하기 버튼 클릭 시 
				_event.clickPayoutButton(evo);
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

		// 정산하기 버튼 클릭 시 
		clickPayoutButton: function(evo) {    // 매개변수로 클릭된 요소를 전달받는다
			// 예약 idx 가져오기
			let reservation_idx = evo.data('reservation-idx'); // jQuery의 .data() 메서드를 사용해 data-* 속성에 저장된 값을 가져옴.

			console.log("예약idx 잘 ㄷㄹ어왓안?? ", reservation_idx);
			$.ajax({
				type: "POST",
				url: "/mtl/api/admin/payout/updateState",   // API 호출
				data: {"reservation_idx" : reservation_idx},   // 호출 시 param값으로 넘겨줄 것 => reservation_idx
				success: function(resp) {   //  API 호출 결과 값 : result(true/false)  
					if(resp) {  // 정산상태 업데이트 된 경우
						modal.alert({ 
							"content" : "정산이 완료되었습니다.",
						});
					} else {    
						modal.alert({       
							"content" : "정산에 실패하였습니다.",
						});
					}  
				},
				error: function(xhr, status, error) {
					console.error("Error :", error); 
				}  
			});   
		},  
    
	};  // let _event 끝


	// fetchPayoutList(): 리스트 조회 함수
	function fetchPayoutList(curPage=1) {  //  _curPage=1 : 처음 화면 접속 시 1페이지부터 시작
		// 그냥 조회했을 때 기본 param값 => 전체조회
		let param = { 
			// 검색필터
			"calculate_date_start" : '', 
			"calculate_date_end" : '',
			"calculate_status" : ''
		};  
  
		if (isSearchClicked) {  // 필터 검색했을 때
  
			// 검색필터에 입력된 데이터 가져오기
			let [startDate, endDate] = $("#dateRange").val().split(" ~ ").map(date => date.trim());
			let payoutStatus = $("input[name='payoutStatus']:checked").val();  // ""/Y/N

			/* 검색필터 날짜 -> 경우에 따라 분기 
				1. 날짜 하루만 조회 시 (시작일 데이터는 있고, 종료일 데이터: "" 안들어옴)
				2. 날짜 하루이상 조회 시 (모두 값이 있는 경우)
			*/  
			if (endDate == null || endDate == "" ) {  // 1. 날짜 하루만 조회 시 (종료일, 시작일 데이터 동일하게 만들어줌)
				endDate = startDate;  
			}  // 2. 날짜 하루이상 조회 시 -> 별도 처리 안해줘도댐

			param = { // ajax로 넘겨줄 data값 변수 선언
				"calculate_date_start" : startDate, 
				"calculate_date_end" : endDate,
				"calculate_status" : payoutStatus
			};

			console.log("검색 조건은??????????:", param);  // 여기도 잘나옴
 
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
		
		// Ajax 요청
		$.ajax({
			type: "POST", 
			url: "/mtl/api/admin/payout/list",   // API 호출
			data: param,   // 호출 시 param값으로 넘겨줄 것 => 필터(정산기간시작일, 정산기간종료일, 정산상태)

			success: function(resp) {   //  API 호출 결과 값이 response 에 들어있음	(여기서 API 리턴값: PayoutListCount, PayoutList, Param)
				_draw.drawPayoutList(resp);  // 리스트 그리기
				page.drawPage(resp.PayoutListCount);  
			},
			error: function(xhr, status, error) {
				console.error("Error :", error); 
			}
		});  
	}


	let _draw = {  
		// 정산내역 리스트
		drawPayoutList: function(list) {  // 위에 API 호출 결과 값으로 받은 response(=PayoutListCount, PayoutList, Param)값을 list라는 이름의 매개변수로 넘겨준다. 
			console.log("drawPayoutList >>>>>>>list", list);   
			// 정산 내역 List 상단 Tab : 목록 갯수 출력
			$("#payoutListCount").html("전체 " + list.PayoutListCount + "건");

		/* 정산내역 리스트 card START */		 
			// Card header : 기간 설정 조건
			$("#calculateDate").html("정산일 기준 " + list.Param.calculate_date_start + " ~ " + list.Param.calculate_date_end)
			

			// card body
			let cardBody = $("#cardBody").empty();
			
			for(data of list.PayoutList) {  // data에는 1개의 정산내역 정보가 들어있음  
				// 정산 상태에 따른 버튼 모양 구분
				let button = '';
				if(data.calculate_status == 'Y') {  // 정산완료이면
					button = `<div class="badge bg-success bg-opacity-10 text-success">정산완료</div>`
				} else {
					button = `<div class="badge bg-danger bg-opacity-10 text-danger">정산대기</div>`
				}

				// <!-- js에서 반복 돌릴 부분(id="cardBody" 아래에 append) -->
				let cardBodyData = 
					`<div class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
						<div class="col">
							<small class="d-block d-sm-none">정산일</small>
							<h6 class="ms-1 mb-0 fw-normal">${data.calculate_date}</h6>
							<a role="button" class="payoutDetail mb-0 fw-normal ms-1"
								data-bs-toggle="modal" data-bs-target="#payoutDetailModal"
								data-src="payout" data-reservation-idx="${data.reservation_idx}">상세보기</a>
						</div>     
						<div class="col">
							<small class="d-block d-sm-none">판매자명</small>
							<h6 class="ms-1 mb-0 fw-normal">${data.name}</h6>
						</div>

						<div class="col"> 
							<small class="d-block d-sm-none">판매금액</small>
							<h6 class="ms-1 mb-0 fw-normal">${data.price}원</h6>
						</div>
						<div class="col">
							<small class="d-block d-sm-none">정산금액</small>
							<h6 class="ms-1 mb-1 fw-light">${data.calculate_price}원</h6>
						</div>
						<div class="col">
							<small class="d-block d-sm-none">정산상태</small>`
							+ button +
					   `</div>
						<div class="col">
							<small class="d-block d-sm-none">정산</small>
							<div class="ms-1 col">
								<a role="button" class="btn btn-sm btn-light mb-0"
									data-src="payout" data-act="payoutButton" data-reservation-idx="${data.reservation_idx}">정산하기</a>
							</div>
						</div> 
					</div>`;		
				cardBody.append(cardBodyData);

				// card footer 페이징
			}


			// Card footer START (id="cardBody" 아래에 append)

			
		/* 정산내역 리스트 card END */	


			// 정산 상세보기 버튼 클릭 시 이벤트
			$(".payoutDetail").click(function() {
				let reservation_idx = $(this).data("reservation-idx");

				$.ajax({  // ajax로 정산 상세내역 정보를 조회하는 API를 호출하고 param값으로 reservation_idx를 보내준다.
					type: "POST",
					url: "/mtl/api/admin/payout/detail",
					data: { "reservation_idx" : reservation_idx } ,  // data => API 호출 시 param값으로 넘겨줄 정보
					success: function(response){  // API호출 성공 시 결과값이 rsaponse에 담긴다. 
	
						_draw.drawPayoutDetailModal(response.PayoutDetail);  // 받은 응답을 모달에 렌더링
						_eventInit();  // html이 전부 그려진 후 호출되어야 작동함.
					},
					error: function(xhr, status, error) {
						console.error("Error :", error);  // 오류 처리
					} 
				});
				
			});
			
			

		},
		// 정산 상세보기 리스트 모달
		drawPayoutDetailModal: function(data) {

			/* 정산 상세정보 modal START */
			let modalBoby = $("#modalBoby");
			modalBoby.empty();

			// 모달 내용 (판매자 정보, 예약자 정보, 정산 정보)
			let modalData = 			
				`<h6 class="fw-bold">판매자 정보</h6> 
				<div class="mb-3 border p-3">
					<p class="mb-0">판매자 관리번호:    ${data.partner_idx}</p>
					<p class="mb-0">숙소명: ${data.name}</p>
					<p class="mb-0">연락처: ${data.phone}</p>
					<p class="mb-0">이메일: ${data.email}</p>
					<p class="mb-0">사업자명: ${data.business_name}</p>
					<p class="mb-0">사업자 등록번호: ${data.business_name}</p>
					<p class="mb-0">정산 계좌 정보: ${data.account_name}  ${data.account_bank}  ${data.account_number}</p>
				</div>

				<h6 class="fw-bold">예약자 정보</h6>
				<div class="mb-3 border p-3">
					<p class="mb-0">사용자 관리번호: ${data.user_idx}</p>
					<p class="mb-0">예약일시: ${data.reservation_date}</p>
					<p class="mb-0">입실일시: ${data.check_in_date}</p>
					<p class="mb-0">퇴실일시: ${data.check_out_date}</p>
					<p class="mb-0">결제상태: ${data.payment_status}</p>
				</div>

				<h6 class="fw-bold">정산 정보</h6>
				<div class="mb-3 border p-3">
				<p class="mb-0">객실요금: ${data.price}원</p>
				<p class="mb-0">수수료율: ${data.charge}%</p>
				<p class="mb-0">정산금액: ${data.calculate_price}</p>
				<p class="mb-0">정산상태: ${data.calculate_status}</p>
				<p class="mb-0">정산일: ${data.calculate_date}</p>
				<p class="mb-0">판매자 관리번호: ${data.partner_idx}</p>
					<p class="mb-0">정산 계좌정보: ${data.account_name}  ${data.account_bank}  ${data.account_number}</p>
				</div>`; 
			modalBoby.append(modalData);              
			/* 정산 상세정보 modal END */

		}
    }; 
    return {
        init
    };

})();  
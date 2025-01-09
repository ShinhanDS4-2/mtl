const reservationList = (function() {  
	let isSearchClicked = false;  // 검색 버튼 클릭 여부 상태 관리      

	// js 로딩 시 이벤트 초기화 실행                 
	function init() {          
		fetchReservationList();  // 페이지 로드 시 예약내역 전체리스트 조회 
		_eventInit();  
	};        
                          
	// 이벤트 초기화        
	function _eventInit() {  
		let evo = $("[data-src='ReservationList'][data-act]").off();
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
			fetchReservationList();  // 조건에 맞는 리스트 조회
		}, 

	};  // let _event 끝

	
	/* 예약내역 리스트 조회 START */
	function fetchReservationList(curPage=1) {  //  _curPage=1 : 처음 화면 접속 시 1페이지부터 시작
		// 그냥 조회했을 때 기본 param값 => 전체조회
		let param = {  
			// partner_idx는 서버에서 세션에 저장된 데이터를 읽어서 사용하기 때문에 여기서 넘겨줄 필요가 없음
			"partner_idx" : 11,  // 이거는 데이터값 확인하기 위해 임시로 설정해둔거고 삭제해야함

			// 필터부분
			"date_start" : '',   // 달력 시작일
			"date_end" : '',   // 달력 종료일
			"reservation_stauts" : '',  // 예약 상태 (전체"" / 예약완료 P / 예약취소 R)
			"calculate_date_start" : '', 
			"calculate_date_start" : '', 
		};
		console.log("검색 안했을때: param값은 ????", param);

		// 검색 버튼이 클릭된 경우 조건 추가
		if (isSearchClicked) {
			// 검색필터에 입력된 데이터 가져오기 (아래 바꿔야함!!! 임시)
			let searchType = $("input[name='searchLocationType']:checked").val();  // ""(전체), A(관광지), R(맛집)
			let searchArea = $("#searchLocationArea").val();  // ""(전체), SEOUL, GANGNEUNG, YEOSU, BUSAN, JEJU
			let searchName = $("#searchLocationName").val();  // ""(입력값X), text로 입력한 값
			
			param = { // ajax로 넘겨줄 data값 변수 선언
				"searchType" : searchType, 
				"searchArea" : searchArea,
				"searchName" : searchName
			};

			console.log("검색 조건: param값은 ????", param);

		} else {
			console.log("전체 리스트 조회");
		}


		/* 페이징 START */
		let pageOption = {
			limit: 10  // 한페이지에 몇개의 data item을 띄울지 설정  => 얘는 쿼리로 넘겨줄 정보
		};
		// 사용자가 $("#pagination") 부분 요소(페이지 번호)를 클릭하면 customPaging 콜백함수 호출하는 부분
		let page = $("#pagination").customPaging(pageOption, function(_curPage){  
			fetchReservationList(_curPage);  // 현재 페이지 번호를 전달받아 해당 페이지에 표시할 데이터를 가져오는 함수.
		});
		
		let pageParam = page.getParam(curPage);  // 현재 페이지 번호(curPage)를 기준으로 페이징에 필요한 정보(예: offset, limit)를 반환.
		
		if(pageParam) {  // 위 코드에서 받은 pageParam값을 ajax에 넘겨줄 데이터에 설정하는 부분
			param.offset = pageParam.offset;
			param.limit = pageParam.limit;
		};
		/* 페이징 END */

		
		console.log("param은??????", param);

		// Ajax 요청 - 예약내역 리스트 조회 API호출
		$.ajax({   
			type: "POST", 
			url: "/mtl/api/partner/reservation/list",  
			data: param,   // param값 => partner_idx, 검색필터값(~~, offset, limit)

			success: function(response) {  // 성공 시 API 리턴값: Param, List, Count
				_draw.drawReservationList(response);  // 리스트 그리기
				page.drawPage(response.Count);  // 파람값으로 리스트 총 갯수 넣어주면 하단 페이징 넘버 동적으로 알아서 그려줌
				_eventInit();  // html이 전부 그려진 후 호출되어야 작동함. 
			},  
			error: function(xhr, status, error) {
				console.error("Error :", error); 
			}
		});  
	}
	
	
	// 그리기
	let _draw = {
	// 예약내역 리스트 조회 그리기 
		drawReservationList: function(list) {  // list에는 Param, List, Count 값이 들어있음
			// 예약내역 리스트 총 갯수
			let reservationCount = $("#reservationCount").html(`총 ${list.Count}개`);

			// 기간 설정 조건
			let searchDateRange = $("#searchDateRange").html(`검색필터 날짜기준 ~ 여기 검색필터 하면 동적으로 뿌려줘야함 `);

			// 예약내역 리스트 데이터들을 감싸고 있는 큰 div태그 부분
			let reservationListData = $("#reservationListData");
			reservationListData.empty();

			// 예약 내역 리스트 출력
			for(data of list.List) {

				// 결제 상태에 따른 버튼 모양 구분
				let button = '';
				if(data.payment_status == 'P') {   // 결제완료이면
					button = `<div class="badge bg-success bg-opacity-10 text-success">예약완료</div>`
				} else {  // 환불상태이면
					button = `<div class="badge bg-danger bg-opacity-10 text-danger">취소됨</div>`
				}

				 // 예약내역 리스트 반복할 부분
				let reservData =  
					`<div class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
						<div class="col">
							<small class="d-block d-sm-none">예약번호</small>
							<h6 class="ms-1 mb-0 fw-normal">${data.reservation_idx}</h6>
							<a role="button" class="mb-0 fw-normal ms-1" data-bs-toggle="modal"
								data-bs-target="#bookingDetailModal">상세보기</a>
						</div>  
						<div class="col">
							<small class="d-block d-sm-none">예약자명</small>
							<h6 class="ms-1 mb-0 fw-normal">${data.username}</h6>
						</div>
						<div class="col">
							<small class="d-block d-sm-none">객실타입</small>
							<h6 class="ms-1 mb-0 fw-normal">${data.room_type}</h6>
						</div> 

						<div class="col">
							<small class="d-block d-sm-none">입실/퇴실일시</small>
							<h6 class="ms-1 mb-1 fw-light">${data.check_in_date}</h6>
							<h6 class="ms-1 mb-0 fw-light">${data.check_out_date}</h6>
						</div>
						<div class="col">
							<small class="d-block d-sm-none">예약일시</small>
							<h6 class="ms-1 mb-1 fw-light">${data.reservation_date}</h6>
						</div>
						<div class="col">
							<small class="d-block d-sm-none">예약상태</small>`
							+ button +
						`</div>

						<div class="col">
							<small class="d-block d-sm-none">판매가</small>  
							<h6 class="mb-0 fw-light">${data.price} 원</h6>
						</div> 
					</div>`;		   
				reservationListData.append(reservData);   
			}    
		},

		// 검색필터에서 숙소가 가지고 있는 객실리스트 동적으로 표시
	 	drawRoomList: function(list) {  
		},



	};  // let _draw 끝

	
	return {
		init,
	};
})();
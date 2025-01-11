const reservationList = (function() {  
	let isSearchClicked = false;  // 검색 버튼 클릭 여부 상태 관리      
    
	// js 로딩 시 이벤트 초기화 실행                       
	function init() {               
		fetchRoomList();  // 검색필터에서 객실타입 리스트 가져와서 동적으로 그려줌 
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
			} else if(action == "clickDetailModal") {  // 상세보기 모달 클릭 시
				_event.clickDetailModal(evo);
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

		// 상세보기 버튼 클릭 시 모달창
		clickDetailModal: function(e) {       
			// Ajax 요청 - 예약내역 상세보기 조회 API호출
			let reservation_idx = $(e).data("reservation-idx");  // 예약내역 idx를 가져옴
			$.ajax({     
				type: "POST", 
				url: "/mtl/api/partner/reservation/detail",  
				data: {reservation_idx:reservation_idx},   

				success: function(resp) {  // 성공 시 API 리턴값: Detail, Param
					console.log("detail 성공 시 API 리턴값:????????", resp)    // Detail, Param
					_draw.drawDetailModal(resp.Detail);  // 상세조회 모달 그리기
					_eventInit(); // html이 전부 그려진 후 호출되어야 작동함. 
				},  
				error: function(xhr, status, error) {  
					console.error("Error :", error);  
				}
			});       

			// fetchReservationList();  // 조건에 맞는 리스트 조회
		}, 

	};  // let _event 끝

	
/* 예약내역 리스트 조회 START */
	function fetchReservationList(curPage=1) {  //  _curPage=1 : 처음 화면 접속 시 1페이지부터 시작
		// 그냥 조회했을 때 기본 param값 => 전체조회

		// 예약일, 입실일, 퇴실일 기준 (드롭다운 값 가져오기) (기본값: 예약일)
		let selectedValue = $('#selectedValue').val(); 
		     
		let param = {  
			// partner_idx는 서버에서 세션에 저장된 데이터를 읽어서 사용하기 때문에 여기서 넘겨줄 필요가 없음
			"partner_idx" : 211,  // 이거는 데이터값 확인하기 위해 임시로 설정해둔거고 삭제해야함
			// 필터부분 
			"date_value" : selectedValue,  // 예약 기간 조회 기준 (기본값: 예약일)   
			"date_start" : '',   // 달력 시작일
			"date_end" : '',   // 달력 종료일
			"reservation_status" : '',  // 예약 상태 (전체"" / 예약완료 P / 예약취소 R)
			"RoomType" : '', // 객실 타입
			"Name" : '', // 예약자명   
		};
		
		console.log("검색 안했을때: param값은 ????", param);
 

		// 검색 버튼이 클릭된 경우 조건 추가
		if (isSearchClicked) {
			// 검색필터에 입력된 데이터 가져오기

			let [startDate, endDate] = $("#searchDate").val().split(" ~ ").map(date => date.trim());// 달력 범위

			// 예약일, 입실일, 퇴실일 기준 (드롭다운 값 가져오기)
			let selectedValue = $('#selectedValue').val(); // 현재 선택된 option의 value  // val값은 reservation_date, check_in_date, check_out_date
		 
			 // 예약 상태 (라디오 버튼 값 가져오기)
			 let reservationStatus = $('input[name="flexRadioDefault"]:checked').next('label').attr('value'); // value 속성 값 (전체, P, R)
			
			 // 객실 타입 (드롭다운 값 가져오기)
			 let selectRoomType = $('#selectRoomType').val(); // 현재 선택된 option의 value => 여기는 동적으로 뿌려줌
		 
			 // 예약자명 (텍스트 입력 값 가져오기)
			 let searchReservName = $('#searchReservName').val(); // 입력된 텍스트 값

   
			// 날짜 하루만 조회 시 
			if (endDate == null || endDate == "" ) {  
				endDate = startDate;  
			}  
			 
			param = {  
				"date_value" : selectedValue,  // 예약 기간 조회 기준 (예약일, 입실일, 퇴실일)
				"date_start" : startDate,   // 달력 시작일
				"date_end" : endDate,   // 달력 종료일
				"reservation_status" : reservationStatus,  // 예약 상태 (전체"" / 예약완료 P / 예약취소 R)
				"RoomType" : selectRoomType, // 객실 타입
				"Name" : searchReservName, // 예약자명
			};

 // ★★★★★★★★★★ 기간 (choice.js 사용해서 동적으로 뿌려져있는 드롭다운 가져와야 함)
       
			// 데이터 잘 가져왔나 확인
			console.log("검색 클릭 후 : param값은 ????", param);

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


		// Ajax 요청 - 예약내역 리스트 조회 API호출
		$.ajax({   
			type: "POST", 
			url: "/mtl/api/partner/reservation/list",  
			data: param,   // param값 => partner_idx, 검색필터값(~~, offset, limit)

			success: function(resp) {  // 성공 시 API 리턴값: Param, List, Count
				console.log("예약내역 리스트 조회 API호출 resp????????", resp)
				_draw.drawReservationList(resp);  // 리스트 그리기
				page.drawPage(resp.Count);  // 파람값으로 리스트 총 갯수 넣어주면 하단 페이징 넘버 동적으로 알아서 그려줌
				_eventInit();  // html이 전부 그려진 후 호출되어야 작동함.    
			},  
			error: function(xhr, status, error) {
				console.error("Error :", error); 
			}
		});   
	}
/* 예약내역 리스트 조회 END */

/* 숙소가 가지고 있는 객실리스트 가져오기 START */
	function fetchRoomList() {
		$.ajax({      
			type: "POST", 
			url: "/mtl/api/partner/reservation/roomList",  
			data: {"partner_idx" : 11},  // 이거는 테스트위해 임시로 설정해둔거고 삭제해야함   
			// data: 서버로 넘겨줄 데이터 없어서 생략
			success: function(resp) {  // 성공 시 API 리턴값: roomTypeList
				console.log("서버 응답 데이터:", resp); // 서버 응답 데이터 출력
				_draw.drawRoomList(resp.roomTypeList);  // 검색필터 > 객실타입 리스트 그리기
				_eventInit();  
			},       
			error: function(xhr, status, error) {
				console.error("Error :", error); 
			}
		});  
	}  
/* 숙소가 가지고 있는 객실리스트 가져오기 END */	
	
	// 그리기
	let _draw = {
	// 예약내역 리스트 조회 그리기 
		drawReservationList: function(list) {  // list에는 Param, List, Count 값이 들어있음
			console.log("리스트 조회 그리기 부분 list값은?", list)

			let date_value = '';
			if(list.Param.date_value == 'reservation_date') {
				date_value = '예약일';
			} else if(list.Param.date_value == 'check_in_date') {
				date_value = '입실일';
			} else if(list.Param.date_value == 'check_out_date') {
				date_value = '퇴실일';
			}
  
			// 예약내역 리스트 총 갯수
			let reservationCount = $("#reservationCount").html(`총 ${list.Count}개`);
  
			// 기간 설정 조건    
			let searchDateRange = $("#searchDateRange").html(date_value + ` 기준 ${list.Param.date_start} ~ ${list.Param.date_end}`);
    
			// 예약내역 리스트 데이터들을 감싸고 있는 큰 div태그 부분ㄴ
			let reservationListData = $("#reservationListData");
			reservationListData.empty();

			// 예약 내역 리스트 출력
			for(data of list.List) {

				// 결제 상태에 따른 버튼 모양 구분
				let button = '';    
				if(data.payment_status == 'P') {   // 결제완료이면
					button = `<div class="badge bg-success bg-opacity-10 text-success">예약완료</div>`
				} else {  // 환불상태이면
					button = `<div class="badge bg-danger bg-opacity-10 text-danger">취소완료</div>`
				}
 
				 // 예약내역 리스트 반복할 부분          
				let reservData =      
					`<div class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">     
						<div class="col">
							<small class="d-block d-sm-none">예약자명</small>
							<h6 class="ms-1 mb-0 fw-normal">${data.username}</h6>
							<a role="button" class="mb-0 fw-normal ms-1 clickDetailModal" 
								data-bs-toggle="modal" data-bs-target="#detailModal"
								data-src="ReservationList" data-act="clickDetailModal"
								data-reservation-idx="${data.reservation_idx}">상세보기</a>
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
							<h6 class="mb-0 fw-light">${comm.numberWithComma(data.price)} 원</h6>
						</div> 
					</div>`;		   
				reservationListData.append(reservData);   
			}    
		},

		// 검색필터에서 숙소가 가지고 있는 객실리스트 > 서버에서 받아서 동적으로 표시 
	 	drawRoomList: function(list) {  // list에는 객실목록이 들어있음
			// 드롭다운  
			let roomType = document.getElementById("selectRoomType");
			let choices = new Choices(roomType, {
				shouldSort: false,
				searchEnabled: false   
			});

			// let selectRoomType = $("#selectRoomType").empty();
			// selectRoomType.append(`<option value="">전체</option>`);

			let roomArray = list.map(data => ({
				value : data.room_idx,
				label : data.room_type
			}));
			/*
			for(data of list) {
				let option = { value : data.room_idx, label: data.room_type };
				roomArray.push(option);
				console.log("vdata????????????/", data); 
				let roomType = `<option>${data.room_type}</option>`;
				selectRoomType.append(roomType);
			} 
			*/ 
			console.log("roomArray????", roomArray);
			choices.setChoices(roomArray, 'value', 'label', true); // true: 기존 선택 초기화
		},  

// 예약내역 상세보기 모달 그리기
		drawDetailModal: function(data) {   // data에는 API호출 시 응답받은 Detail 값이 들어있음
			let modalBody = $("#modalBody");
			modalBody.empty();

			let modalData = 
					`<h6 class="fw-bold">예약번호</h6>
					<div class="mb-3 border p-3">
						<p class="mb-0">${data.reservation_idx}</p>
					</div>

					<h6 class="fw-bold">예약자 정보</h6>
					<div class="mb-3 border p-3">
						<p class="mb-0">예약자명: ${data.username}</p>
						<p class="mb-0">연락처: ${data.userphone}</p>
					</div>

					<h6 class="fw-bold">예약 정보</h6>
					<div class="mb-3 border p-3">
						<p class="mb-0">객실타입: ${data.room_type}</p>
						<p class="mb-0">입실일시: ${data.check_in_date}</p>
						<p class="mb-0">퇴실일시: ${data.check_out_date}</p>
						<p class="mb-0">예약일시: ${data.reservation_date}</p>      
					</div>

					<h6 class="fw-bold">금액 정보</h6>
					<div class="mb-3 border p-3">     
						<p class="mb-0">객실 판매가: ${comm.numberWithComma(data.price)} 원</p>
					</div>`	
				
			modalBody.html(modalData);      
			// $("#detailModal").modal("show"); // 모달 표시 안해줘도 뜨는데??? 
			// 모달 show 안해도 data-bs-target="#detailModal" 이랑 모달에 id="detailModal" 가 동일하게 매핑되어 있으면 뜸
		},

	};  // let _draw 끝

	
	return {
		init,
	};
})();
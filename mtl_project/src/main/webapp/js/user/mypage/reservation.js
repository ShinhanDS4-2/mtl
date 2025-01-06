const reservation = (function() {

	// js 로딩 시 이벤트 초기화 실행 
	function init() {
		fetchReservationList();  // 페이지 로드 시 예약내역 리스트를 가져옴

		_menuActive(); 
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
			if(action == "clickCustomLocation") {
				_event.clickCustomLocation(evo); 
			}
		};
	};
	
	// 이벤트
	let _event = {
		// 추천 여행지 클릭
		clickCustomLocation : function(evo) {
			let reservationIdx = evo.attr("data-reservation-idx");
			location.href = "/mtl/custom/location?idx=" + reservationIdx;
		},
	};
	
	// 메뉴 active
	function _menuActive() {
		$("#menuReservation").addClass("active");
	};


	// fetchReservationList();  페이지 로드 시 예약내역 리스트를 가져오는 함수
	function fetchReservationList(curPage=1) {  //  _curPage=1 : 처음 화면 접속 시 1페이지부터 시작
		
		let param = { // ajax로 넘겨줄 data값 변수 선언
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
			url: "/mtl/api/user/mypage/reservationHistoryList",   // API 호출
			data: param,   // 호출 시 param값으로 넘겨줄 것 user_idx
			success: function(response) {   //  API 호출 결과 값이 response 에 들어있음	(여기서 API 리턴값: ReservationListCount, ReservationList)
				_draw.drawReservationList(response.ReservationList);
				page.drawPage(response.ReservationListCount);
				_eventInit();  // html이 전부 그려진 후 호출되어야 작동함.
			},
			error: function(xhr, status, error) {
				console.error("Error :", error);  // 오류 처리
			}
		});  
	}


	let _draw = {  
		// 예약 내역 리스트
		drawReservationList: function(list) {  // fetchReservationList() 함수에서 API 호출 결과 값으로 받은 response.ReservationList값을 list라는 이름의 매개변수로 넘겨준다. 
			
		/* 예약내역 리스트 card START */
			let reservCard = $("#reservCard");
			reservCard.empty(); // 기존 내용을 비워줌



			for(data of list) {  // 예약내역 list에서 1개의 예약내역 data만 뽑아냄
				
				let card = $("<div>").addClass("card shadow p-2");
				reservCard.append(card);
	
				let row = $("<row>").addClass("row g-0");
				card.append(row);
	
				// Card img 
				let cardImgStr =
						`<div class="col-md-3">
							<img src="${data.img.url}" class="card-img rounded-2" alt="Card image">
						</div>`;
				row.append(cardImgStr);

				// Card body
				let cardBody =
						`<div class="col-md-9">
							<div class="card-body py-md-2 d-flex flex-column h-100">
								<!-- Title -->
								<h5 class="card-title mb-1"><a href="partner/detail?idx=${data.partner_idx}">${data.name}</a></h5>
								<small><i class="bi bi-geo-alt me-2"></i>${data.address}</small>
								<small class="mt-2">
									<i class="fa-regular fa-calendar me-2"></i>${data.check_in_date} ~ ${data.check_out_date}
									<i class="fa-solid fa-users ms-3 me-2"></i>${data.guest_cnt}인
								</small>
								<div class="d-sm-flex justify-content-sm-between align-items-center mt-3 mt-md-auto">
									<div class="d-flex align-items-center">
										<h5 class="fw-bold mb-0 me-1"><i class="fa-solid fa-won-sign"></i> ${comm.numberWithComma(data.price)}</h5>
									</div>
									<div class="mt-3 mt-sm-0">
										<a href="javascript:;" class="btn btn-sm btn-primary-soft mb-0" data-src="reservation" data-act="clickCustomLocation" data-reservation-idx="${data.reservation_idx}">추천 여행지</a>    
										<a href="javascript:;" class="btn btn-sm btn-primary-soft mb-0"  data-bs-toggle="modal" data-bs-target="#reviewModal">후기 작성</a>    
										<a href="javascript:;" class="btn btn-sm btn-primary mb-0 reservDetail" data-bs-toggle="modal" data-bs-target="#reservationDetail" 
												data-src="reservation" data-reservation-idx="${data.reservation_idx}">상세 정보</a>    
									</div>                  
								</div>
							</div>
						</div>`;
				row.append(cardBody);
			}
		/* 예약내역 리스트 card END */
		
		
			// 예약 상세정보 버튼 클릭 시 이벤트
			$(".reservDetail").click(function() {
				let reservation_idx = $(this).data("reservation-idx");  // jQuery의 .data() 메서드를 사용해 data-* 속성에 저장된 값을 가져옴.

				$.ajax({  // ajax로 예약 상세정보API호출하고 param으로 예약idx 보냄
					type: "POST",
					url: "/mtl/api/user/mypage/reservationHistoryDetail",   // 예약내역 상세정보 조회 API 호출
					data: { reservation_idx: reservation_idx },  // 호출 시 param값으로 넘겨줄 것 reservation-idx(예약 idx)
					
					success: function(response){ //  API 호출 결과 값이 response에 들어있음
						console.log("ajax에서 response값은 ??? >>>>");
						console.log(response);
						_draw.drawReservationDetailModal(response);  // 받은 응답을 모달에 렌더링
						_eventInit();  // html이 전부 그려진 후 호출되어야 작동함.
					},
					error: function(xhr, status, error) {
						console.error("Error :", error);  // 오류 처리
					}
				});
			});
		},
		
		// 예약 상세정보 Modal
		drawReservationDetailModal: function(reservData) {  // 예약 상세정보 조회 API 호출 결과 값으로 받은 response값을 reservData라는 이름의 매개변수로 넘겨준다. 

		/* 예약 상세 정보 modal START */
			let reservDetailModal = $("#reservDetailModal");

		// 모달 내용을 추가하기 전에 기존 내용을 비워준다. => 필수!! 이거 없으면 모달창에 예약상세정보 카드가 중복으로 여러번 추가된다. 

			reservDetailModal.empty();

			let modalBody = 
					`<div class="card bg-transparent m-3 border">
							<div class="card-body">
								<div class="col-12">
									<div class="mb-2">
										<img src="${reservData.url}" class="rounded">
									</div>
									<ul class="list-group list-group-borderless">
										<li class="list-group-item">
											<span class="h6 mb-0 me-1">객실 : </span>
											<span class="h6 fw-light mb-0">${reservData.room_type}</span>
										</li>
										<li class="list-group-item">
											<span class="h6 mb-0 me-1">체크인 : </span>
											<span class="h6 fw-light mb-0">${reservData.check_in_date}</span>
										</li>
										<li class="list-group-item">
											<span class="h6 mb-0 me-1">체크아웃 : </span>
											<span class="h6 fw-light mb-0">${reservData.check_out_date}</span>
										</li>
										<li class="list-group-item">
											<span class="h6 mb-0 me-1">인원 : </span>
											<span class="h6 fw-light mb-0">${reservData.guest_cnt}인</span>
										</li>
										<li class="list-group-item">
											<span class="h6 mb-0 me-1">총 금액 : </span>
											<span class="h6 fw-light mb-0">${comm.numberWithComma(reservData.price)}</span>
										</li>
									</ul>
								</div>
								<div class="mt-2">
									<button class="btn btn-primary" type="button">예약 취소</button>
								</div>
							</div>
						</div>`

			reservDetailModal.append(modalBody);
		/* 예약 상세 정보 modal END */
	},
};

	return {
		init,
	};
})();
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
		evo.on("click mouseenter mouseleave change", function(e) {
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
			} else if (action == "clickResevationCancel") {
				_event.clickResevationCancel(evo);
			} else if (action == "hover") {
				_event.clickRating(evo);
			} else if (action == "clickReviewRegist") {
				_event.clickReviewRegist(evo);
			} else if (action == "clickReview") {
				$("input[type='radio']").prop("checked", false);
				$("input[type='radio']").siblings("span").removeClass("star-icon-select").addClass("star-icon");
				$("#reviewContent").val("");
				$("#preview").empty();
				$("#reviewBtn").attr("data-reservation-idx", evo.attr("data-reservation-idx"));
			}
		} else if (type == "mouseenter") {
			if (action == "hover") {
				_event.mouseEnterRating(evo);
			}
		} else if (type == "mouseleave") {
			if (action == "hover") {
				_event.mouseLeaveRating(evo);
			}
		} else if (type == "change") {
			if (action == "changeFile") {
				comm.setPreview(evo);
			};
		}
	};
	
	// 이벤트
	let _event = {
		// 추천 여행지 클릭
		clickCustomLocation : function(evo) {
			let reservationIdx = evo.attr("data-reservation-idx");
			location.href = "/mtl/custom/location?idx=" + reservationIdx;
		},
		
		// 예약 취소
		clickResevationCancel: function(evo) {
			let reservationIdx = evo.attr("data-reservation-idx");
			
			let url = "/payment/refund";
			
			let data = {
				"reservation_idx" : reservationIdx
			};
			
			modal.confirm({
				"content" : "예약을 취소하시겠습니까?",
				"confirmCallback" : function() {
					comm.sendJson(url, data, "POST", function(resp) {
						if (resp.result == 1) {
							modal.alert({
								"content" : "예약취소가 완료되었습니다.",
								"confirmCallback" : function() {
									fetchReservationList();
									$("#reservationDetail").modal("hide");
								}
							});
						};
					});
				}
			});
		},
		
		// 별점 mouseenter
		mouseEnterRating: function(evo) {
			evo.children("span").removeClass("star-icon").addClass("star-icon-fill");
			let prevStar = evo.prevAll().children("span");
			prevStar.each(function() {
			    $(this).removeClass("star-icon").addClass("star-icon-fill");
			});
		},
		
		// 별점 mouseleave
		mouseLeaveRating: function(evo) {
			evo.children("span").removeClass("star-icon-fill").addClass("star-icon");
			let nextStar = evo.nextAll().children("span");
			nextStar.each(function() {
			    $(this).removeClass("star-icon-fill").addClass("star-icon");
			});
			
			// 별점 전체 지우기
			evo.siblings("label").children("span").removeClass("star-icon-fill").addClass("star-icon");
		},
		
		// 별점 클릭
		clickRating: function(evo) {
			let target = evo.children("input");
			$(target).prop("checked", true);
			
			// 부모 요소에서 몇 번째 별인지 가져오기 (input의 value 사용)
		    let ratingValue = parseInt(target.val(), 10);
		
		    // 모든 별 초기화
		    let parent = evo.parent(); 
		    parent.children().each(function() {
		        $(this).children("span").removeClass("star-icon-select").addClass("star-icon"); 
		    });
		
		    // 클릭한 별까지 채워진 별로 변경
		    for (let i = 0; i <= ratingValue; i++) {
		        let star = parent.children().eq(i); // i번째 별
		        star.children("span").removeClass("star-icon").addClass("star-icon-select");
		    }
		},
		
		// 리뷰 등록
		clickReviewRegist: function(evo) {
			let url = "/user/review/regist";
			
			let reservationIdx = evo.attr("data-reservation-idx");
			
			let rating1 = $("input[name=rating_1]:checked").val();
			let rating2 = $("input[name=rating_2]:checked").val();
			let rating3 = $("input[name=rating_3]:checked").val();
			let rating4 = $("input[name=rating_4]:checked").val();
			
			let data = {
				"reservation_idx" : reservationIdx,
				"rating1" : rating1,
				"rating2" : rating2,
				"rating3" : rating3,
				"rating4" : rating4,
				"content" : $("#reviewContent").val()
			};
			
			// 데이터 null 체크
			for (let key in data) {
				if (data[key] == null || data[key] == "") {
					modal.alert({
						"content" : "입력되지 않은 값이 있습니다."
					});
					return;
				};
			};
			
			data.mfile = $("#reviewImage").get(0).files;
			
			// 파일 전송을 위한 폼데이터 변경			
			let formData = comm.changeFormData(data);

			modal.confirm({
				"content" : "리뷰를 작성하시겠습니까?",
				"confirmCallback" : function() {
					comm.sendFile(url, formData, "POST", function(resp) {
						if (resp.result == true) {
							modal.alert({
								"content" : "정상적으로 작성되었습니다.",
								"confirmCallback" : function() {
									location.reload();
									$("#reviewModal").modal("hide");
								}
							});
						} else {
							modal.alert({
								"content" : "오류가 발생하였습니다.<br>다시 시도해 주세요."
							});
						}
					});
				}
			});
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
							<img src="${data.img.url}" class="card-img rounded-2 h-100" alt="Card image">
						</div>`;
				row.append(cardImgStr);
				
				// 후기 버튼
				let reviewBtn = ``;
				if (data.check_date == "N") {
					if (data.review == null) {
						reviewBtn = `<a href="javascript:;" class="btn btn-sm btn-primary-soft mb-0 me-2" data-bs-toggle="modal" data-bs-target="#reviewModal" data-src="reservation" data-act="clickReview" data-reservation-idx="${data.reservation_idx}">후기 작성</a>`; 
					};
				};
				
				// 추천 여행지 버튼 
				let locationBtn = ``;
				// 예약 취소 표시
				let cancelNotice = ``;
				if (data.payment_status == "P") {
					locationBtn = `<a href="javascript:;" class="btn btn-sm btn-primary-soft mb-0 me-2" data-src="reservation" data-act="clickCustomLocation" data-reservation-idx="${data.reservation_idx}">추천 여행지</a>`;
				} else {
					cancelNotice = `<small class="text-danger ms-2">예약 취소</small>`;
				};
				
				// Card body
				let cardBody =
						`<div class="col-md-9">
							<div class="card-body py-md-2 d-flex flex-column h-100">
								<!-- Title -->
								<div class="d-flex">
									<h5 class="card-title mb-1"><a href="partner/detail?idx=${data.partner_idx}">${data.name}</a></h5>
									` + cancelNotice + `
								</div>
								<small><i class="bi bi-geo-alt me-2"></i>${data.address}</small>
								<small class="mt-2">
									<i class="fa-regular fa-calendar me-2"></i>${data.check_in_date} ~ ${data.check_out_date}
									<i class="fa-solid fa-users ms-3 me-2"></i>${data.guest_cnt}인
								</small>
								<div class="d-sm-flex justify-content-sm-between align-items-center mt-4 mt-md-auto">
									<div class="d-flex align-items-center">
										<h5 class="fw-bold mb-0 me-1"><i class="fa-solid fa-won-sign"></i> ${comm.numberWithComma(data.price)}</h5>
									</div>
									<div class="mt-3 mt-sm-0">`
										+ reviewBtn + locationBtn +
										`<a href="javascript:;" class="btn btn-sm btn-primary mb-0 reservDetail" data-bs-toggle="modal" data-bs-target="#reservationDetail" data-src="reservation" data-reservation-idx="${data.reservation_idx}">상세 정보</a>
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
						_draw.drawReservationDetailModal(response);  // 받은 응답을 모달에 렌더링
						_eventInit();  // html이 전부 그려진 후 호출되어야 작동함.
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
			
			// 체크인 일자가 오늘보다 크면 예약 취소 버튼 O
			let cancelBtn = ``;
			if (reservData.payment_status == 'P') {
				if (reservData.check_date == 'Y') {
					cancelBtn = `<div class="mt-2 text-center">
									<button class="btn btn-primary" type="button" data-src="reservation" data-act="clickResevationCancel" data-reservation-idx="${reservData.reservation_idx}">예약 취소</button>
								</div>`
				};
			};

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
											<span class="h6 fw-light mb-0">${comm.numberWithComma(reservData.price)}원</span>
										</li>
									</ul>
								</div>`
							+
								cancelBtn
							+
							`</div>
						</div>`

			reservDetailModal.append(modalBody);
		/* 예약 상세 정보 modal END */
	},
};

	return {
		init,
	};
})();
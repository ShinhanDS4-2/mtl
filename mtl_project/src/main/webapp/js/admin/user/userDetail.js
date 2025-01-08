const userDetail = (function () {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_eventInit();
		_loadUserDetail();
		_loadUserReservationList();
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='userDetail'][data-act]").off();
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
		};
	};
    
    // userDetail.jsp
	function _loadUserDetail() {
		let userIdx = comm.getUrlParam().idx; // common.js에서 함수 지정
		
        comm.send("/admin/detail", { userIdx: userIdx }, "POST", function(response) {
            if (response.userDetail) {
                const user = response.userDetail;

                // 데이터 동적으로 삽입
                $('#email').val(user.email);
                $('#name').val(user.name);
                $('#birth').val(user.birth);
                $('#phone').val(user.phone);
                $('#create_date').val(user.create_date);
                $('#user_status').val(user.user_status == "A" ? "정상" : "탈퇴");
            }
        }, function(error) {
        });
    }
    
    // 예약 정보
    function _loadUserReservationList(curPage = 1) {
    	let userIdx = comm.getUrlParam().idx;
    
    	let url = "/user/reservation/list";
    	
    	let data = {
    		"user_idx" : userIdx
    	};
    	
    	// 페이징
		let pageOption = {
			limit: 5
		};
		
		let page = $("#pagination").customPaging(pageOption, function(_curPage){
			_loadUserReservationList(_curPage);
		});
		
		let pageParam = page.getParam(curPage);
		
		if(pageParam) {
			data.offset = pageParam.offset;
			data.limit = pageParam.limit;
		};
		// 페이징 끝
    	
    	comm.sendJson(url, data, "POST", function(resp) {
    		_draw.drawReservationList(resp.list);
    		page.drawPage(resp.totalCnt);
    	});
    };
    
    _draw = {
    	drawReservationList: function(list) {
    		let reservationList = $("#reservationList").empty();
    		
    		for (let data of list) {
    			let status = data.payment_status;
    			let color = status == "P" ? "success" : "danger";
    			let text = status == "P" ? "예약완료" : "예약취소";
    			
	    		let row = 
	    			`<div class="row align-items-md-center justify-content-between border-bottom px-2 py-4">
						<div class="col">
							<div class="d-flex align-items-center">
								<div class="w-80px h-60px flex-shrink-0 ms-3">
									<img src="${data.image}" class="rounded w-100 h-100" alt="">
								</div>
							</div>
						</div>
						<div class="col">
							<h6 class="mb-0">${data.partner_name}</h6>
						</div>
						<div class="col">
							<h6 class="mb-0 fw-normal">${data.room_type}</h6>
						</div>
						<div class="col">
							<h6 class="mb-0 fw-normal">${data.check_in_date}</h6>
						</div>
						<div class="col">
							<h6 class="mb-0 fw-normal">${data.check_out_date}</h6>
						</div>
						<div class="col">
							<h6 class="mb-0 fw-normal">${data.reservation_date_format}</h6>
						</div>
						<div class="col">
							<h6 class="mb-0 fw-bold">${comm.numberWithComma(data.price)}원</h6>
						</div>
						<div class="col">
							<div class="badge bg-${color} bg-opacity-10 text-${color}">${text}</div>
						</div>
					</div>`
					
				reservationList.append(row);
			}
    	}
    }
	
	return {
		init,
	};
})();
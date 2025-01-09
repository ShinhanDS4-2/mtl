const partnerList = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_eventInit();
		_loadPartnerList(); // 사용자 목록 초기화
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='partnerList'][data-act]").off();
		evo.on("click", function(e) {
			_eventAction(e);
		});
		
		// 검색 버튼
		$("#searchButton").on("click", function() {
            _loadPartnerList();
        });
	};
	
	// 판매자 목록
	function _loadPartnerList() {
		const status = $("input[name='flexRadioDefault']:checked").val(); // 선택된 상태 값
        const searchType = $("#searchType").val(); // 검색 타입
        const searchKeyword = $("#searchKeyword").val(); // 검색어
		
        // 검색 조건
        const filter = {
            status: status,
            searchType: searchType,
            searchKeyword: searchKeyword
        };
	
        comm.send("/admin/partnerList", filter, "POST", function(response) {
            if (response.partnerList) {
                _renderPartnerList(response.partnerList);
                $(".totalCount").text(response.totalCount); // 사용자 수 업데이트
            } else {
                alert("사용자 목록을 불러오지 못했습니다.");
            }
        }, function(error) {
            console.error("사용자 목록 로드 오류:", error);
        });
    };
	
	
	// 판매자 목록 렌더링
    function _renderPartnerList(partnerList) {
        const tableBody = $("#partnerList"); // 테이블 tbody의 ID
        tableBody.empty(); // 기존 데이터 초기화

        partnerList.forEach(partner => {
        	let statusClass = partner.approval_status == 'Y' ? 'bg-success text-success' : 'bg-danger text-danger';
        	let statusText = partner.approval_status == 'Y' ? '승인' : '미승인';
        	
            let row = 
	            `<div class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
					<!-- Data item -->
					<div class="col">
						<h6 class="ms-1 mb-0 fw-normal">${partner.name}</h6>
					</div>
					<!-- Data item -->
					<div class="col">
						<h6 class="ms-1 mb-0 fw-normal">${partner.email}</h6>
					</div>
					<!-- Data item -->
					<div class="col">
						<h6 class="ms-1 mb-1 fw-light">${partner.phone}</h6>
					</div>
					<!-- Data item -->
					<div class="col">
						<h6 class="ms-1 mb-1 fw-light">${partner.create_date}</h6>
					</div>
					<!-- Data item -->
					<div class="col">
						<div class="badge bg-success bg-opacity-10 ${statusClass}">${statusText}</div>
					</div>
					<!-- Data item -->
					<div class="col">
						<div class="ms-1 col">
							<a href="admin/partner/detail?idx=${partner.partner_idx}" class="btn btn-sm btn-light mb-0">상세보기</a>
						</div>
					</div>
				</div>`
				
            tableBody.append(row);
        });
    }
	
	
	// 이벤트 분기
	function _eventAction(e) {
		let evo = $(e.currentTarget);
		
		let action = evo.attr("data-act");
		
		let type = e.type;
		
		if(type == "click") {
			if(action == "clickEmailAuth") {
				_event.checkEmail();
			} 
		};
	};
	
	// 이벤트
	let _event = {
		// 이메일 형식 체크
		checkEmail: function() {
			let email = $("#joinEmail").val();
			if (!comm.validateEmail(email)) {
			    alert('올바른 이메일 주소를 입력하세요.');
			    return;
		    }
	    },
	    
	    
            

        
    };
	
	return {
		init,
	};
})();
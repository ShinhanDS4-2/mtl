const partnerDetail = (function () {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_eventInit();
		_loadPartnerDetail();
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='partnerDetail'][data-act]").off();
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
			if(action == "clickApproval") {
				_event.clickApproval();
			}
		};
	};
	
    
    
    // partnerDetail.jsp
	function _loadPartnerDetail() {
		let partnerIdx = comm.getUrlParam().idx; // common.js에서 함수 지정
		
        comm.send("/admin/partnerDetail", { partnerIdx: partnerIdx }, "POST", function(response) {
            if (response.partnerDetail) {
                const partner = response.partnerDetail;
                
                const approval_status = partner.approval_status == "Y" ? "승인" : "미승인";

                // 데이터 동적으로 삽입
                $('#email').val(partner.email);
                $('#name').val(partner.name);
                $('#business_number').val(partner.business_number);
                $('#business_phone').val(partner.business_phone);
                $('#create_date').val(partner.create_date);
                $('#approval_status').val(approval_status);
                
                // 상테에 따라 승인 버튼 표시/숨김 처리
                if (approval_status != "승인") {
	                $("#approveButton").removeClass("d-none"); // 미승인 상태면 버튼 표시
	            }
            } else {
                alert("사용자 상세 정보를 불러오지 못했습니다.");
            }
        }, function(error) {
            console.error("사용자 상세 정보 로드 오류:", error);
        });
    }
    
    
    // 판매자 상태 승인
    function _updateApprovalStatus() {
    const partnerIdx = comm.getUrlParam().idx; // URL에서 partner_idx 가져오기

    const param = {
        partner_idx: partnerIdx,
    };

    // 서버로 상태 변경 요청
    comm.send("/admin/updateApprovalStatus", param, "POST", function(response) {
        if (response.success) {
            modal.alert({ "content" : response.message} );
            $("#approval_status").val("승인"); // 상태를 승인으로 갱신
            $("#approveButton").hide(); // 승인 버튼 숨김
        } else {
            alert(response.message); // 서버에서 반환된 실패 메시지 표시
        }
    }, function(error) {
        console.error("상태 변경 오류:", error);
    });
}

    


	// 이벤트
	let _event = {
	    clickApproval: function() {
	    	_updateApprovalStatus();
	    }
        
    };
	
	return {
		init,
	};
})();
const userList = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_eventInit();
		_loadUserList(); // 사용자 목록 초기화
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='userList'][data-act]").off();
		evo.on("click", function(e) {
			_eventAction(e);
		});
		
		// 검색 버튼
		$("#searchButton").on("click", function() {
            _loadUserList();
        });
	};
	
	// 사용자 목록
	function _loadUserList(curPage = 1) {
		const status = $("input[name='flexRadioDefault']:checked").val(); // 선택된 상태 값
        const searchType = $("#searchType").val(); // 검색 타입
        const searchKeyword = $("#searchKeyword").val(); // 검색어
		
        // 검색 조건
        const filter = {
            status: status,
            searchType: searchType,
            searchKeyword: searchKeyword
        };
        
        // 페이징
		let pageOption = {
			limit: 5
		};
		
		let page = $("#pagination").customPaging(pageOption, function(_curPage){
			_loadUserList(_curPage);
		});
		
		let pageParam = page.getParam(curPage);
		
		if(pageParam) {
			filter.offset = pageParam.offset;
			filter.limit = pageParam.limit;
		};
		// 페이징 끝
	
        comm.send("/admin/list", filter, "POST", function(response) {
            if (response.list) {
                _renderUserList(response.list);
                $(".totalCount").text(response.totalCnt); // 사용자 수 업데이트
                page.drawPage(response.totalCnt);
            }
        }, function(error) {
            console.error("사용자 목록 로드 오류:", error);
        });
    };
	
	
	// 사용자 목록 렌더링
    function _renderUserList(userList) {
        const tableBody = $("#userList"); // 테이블 tbody의 ID
        tableBody.empty(); // 기존 데이터 초기화

        userList.forEach(user => {
        	let statusClass = user.user_status == 'A' ? 'bg-success text-success' : 'bg-danger text-danger';
        	let statusText = user.user_status == 'A' ? '정상' : '탈퇴';
        	
            let row = 
	            `<div class="row row-cols-xl-6 g-4 align-items-sm-center border-bottom px-2 py-4">
					<div class="col">
						<small class="d-block d-sm-none">이메일</small>
						<h6 class="ms-1 mb-0 fw-normal">${user.email}</h6>
					</div>
					<div class="col">
						<small class="d-block d-sm-none">이름</small>
						<h6 class="ms-1 mb-0 fw-normal">${user.name}</h6>
					</div>
					<div class="col">
						<small class="d-block d-sm-none">연락처</small>
						<h6 class="ms-1 mb-1 fw-light">${user.phone}</h6>
					</div>
					<div class="col">
						<small class="d-block d-sm-none">가입일</small>
						<h6 class="ms-1 mb-1 fw-light">${user.create_date}</h6>
					</div>
					<div class="col">
						<small class="d-block d-sm-none">상태</small>
						<div class="badge bg-success bg-opacity-10 ${statusClass}">${statusText}</div>
					</div>
					<div class="col">
						<small class="d-block d-sm-none">상세보기</small>
						<div class="ms-1 col">
							<a href="admin/user/detail?idx=${user.user_idx}" class="btn btn-sm btn-light mb-0">상세보기</a>
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
			} else if (action == "clickAuthCheck") {	// 이메일 인증
				
			} else if (action == "clickJoin") {		//회원가입
				_event.handleJoin();
			} else if (action == "clickEmailCheck") {	// 이메일 중복 확인
				_event.checkEmailDuplication();
			}
		};
	};
	
	// 이벤트
	let _event = {
		// 이메일 형식 체크
		checkEmail: function() {
			let email = $("#joinEmail").val();
			if (!comm.validateEmail(email)) {
			    modal.alert({ "content" : "올바른 이메일 주소를 입력하세요." });
			    return;
		    }
	    },
	    
	    
	    // 이메일 중복 확인
	    checkEmailDuplication: function() {
	    	let formData = {
            	admin_email: $("#joinEmail").val(),
            };
	    	if (!formData.admin_email) {
		        modal.alert({
            		"content" : "이메일을 입력해 주세요." 
            	});
		        return;
		    }
		    // 이메일 형식 체크
		    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(formData.admin_email)) {
				modal.alert({
            		"content" : "올바른 이메일 주소를 입력해 주세요<br>예: example@gmail.com" 
            	});
		        return;
		    }
		    
		    
		    // 서버로 이메일 중복 확인 요청
        	comm.send("/admin/clickEmailCheck", formData, "POST", function(response) {
	            if (response.duplicated == false) {
	                modal.alert({ "content" : "사용 가능한 이메일입니다." });
	            } else {
	                modal.alert({ "content" : "이미 사용 중인 이메일입니다. 다른 이메일을 입력하세요." });
	            }
        	}, function(error) {
                modal.alert({ "content" : "오류가 발생하였습니다.<br>다시 시도해주세요." });
        	});
		},
	    
	    // 회원가입
        handleJoin: function() {
            // 사용자 입력값
            let formData = {
            	admin_email: $("#joinEmail").val(),
            	admin_name: $("#joinName").val(),
                admin_password: $("#joinPw").val(),
            };
            
            // 유효성 검사
		    if (!formData.admin_email) {
		        modal.alert({
            		"content" : "이메일을 입력해 주세요." 
            	});
		        return;
		    }
            // 이메일 형식 확인
		    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(formData.admin_email)) {
				modal.alert({
            		"content" : "올바른 이메일 주소를 입력해 주세요<br>예: example@gmail.com" 
            	});
		        return;
		    }
		    if (!formData.admin_name) {
                modal.alert({
            		"content" : "이름을 입력해 주세요." 
            	});
                return;
            }
            if (!formData.admin_password) {
                modal.alert({
            		"content" : "비밀번호를 입력해 주세요." 
            	});
                return;
            }
            // 비밀번호 길이 확인
            if (formData.admin_password.length < 8) {
		        modal.alert({
            		"content" : "비밀번호는 최소 8자리 이상이어야 합니다." 
            	});
		        return;
		    }

            // 서버로 데이터 전송
            comm.send("/admin/join", formData, "POST", function(response) {
                if (response.code == 200) {
                    modal.alert({ "content" : "관리자 등록이 완료되었습니다." });
                    location.reload();
                } else {
                    modal.alert({ "content" : "관리자 등록에 실패했습니다. 다시 시도해주세요." });
                }
            }, function(error) {
                modal.alert({ "content" : "오류가 발생하였습니다.<br>다시 시도해주세요." });
            });
        },
        
    };
	
	return {
		init,
	};
})();
const notice = (function () {
    function init() {
        console.log("1");
        menuActive(); // 현재 메뉴 활성화
        eventInit(); // 이벤트 초기화
        loadNotices(); // 첫 번째 페이지 공지사항 데이터 로드
    }

    /**
     * 이벤트 초기화
     * 버튼 클릭 및 페이징 관련 이벤트 설정
     */
    function eventInit() {
        // 버튼 클릭 이벤트 바인딩
        let evo = $("[data-src='notice'][data-act]").off();
        evo.on("click", function (e) {
            eventAction(e); // 버튼 클릭 시 이벤트 처리
        });

        // 등록 버튼 클릭 이벤트
        $('#noticeRegistModal .btn-primary').off().on("click", function () {
            registerNotice();
        });

        // 상세내용 수정 버튼 클릭 이벤트
        $('#noticeDetailModal .btn-primary').off().on("click", function () {
            loadNoticeDetailByIdx();
        });
        
        
        // 검색 버튼 클릭 이벤트
        $('#searchButton').click(function () {
            const keyword = $('#searchKeyword').val();
            const status = $('#searchStatus').val();
            const target = $('#searchTarget').val();

            // 검색 요청
            searchNotices(keyword, status, target);
        });

        // 초기화 버튼 클릭 이벤트
        $('#resetButton').click(function () {
            $('#searchKeyword').val('');
            $('#searchStatus').val('');
            $('#searchTarget').val('');
            loadNotices(); // 초기 목록 다시 로드
        });

    }

	 /**
     * 공지사항 등록
     */
	function registerNotice() {
	    const title = $('#noticeRegistModal #questionTitle').val().trim();
	    const content = $('#noticeRegistModal #questionContent').val().trim();
	    const target = $('#noticeRegistModal select').val() === '사용자' ? 'U' : 'P';
	
	    if (!title || !content || !target) {
	        alert("모든 필드를 입력하세요.");
	        return;
	    }
	
	    const data = { title, content, target, status: 'Y' };
	    console.log("등록 데이터:", data);
	
	    // AJAX 요청
	    $.ajax({
	        url: '/mtl/api/notice/regist',
	        type: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify(data),
	        success: function (response) {
	            if (response.result) {
	                alert('공지사항이 등록되었습니다.');
	                location.reload();
	            } else {
	                alert('공지사항 등록에 실패했습니다.');
	            }
	        },
	        error: function (err) {
	            console.error("공지사항 등록 중 오류:", err);
	            alert("공지사항 등록 중 오류가 발생했습니다.");
	        }
	    });
	}
let currentNoticeId = null; // 현재 공지사항의 ID를 추적하는 변수

// 공지사항 상세 불러오기
function loadNoticeDetailByIdx(notice_idx) {
    $.ajax({
        url: '/mtl/api/notice/detail',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({ notice_idx: notice_idx }),
        success: function (response) {
            if (response.result) {
                // 성공 시 상세 데이터 표시
                const notice = response.data;

                // 제목을 입력 필드에 넣기
                $('#editTitle').val(notice.title);  // 제목을 입력 필드에 넣음
                $('#editContent').val(notice.content);  // 내용도 입력 필드에 넣음
                $('#detailStatus').text(notice.status === 'Y' ? '게시중' : '게시중단');
                
                // 현재 공지사항 ID 저장 (수정 모드)
                currentNoticeId = notice.notice_idx;

                // 버튼 텍스트를 "수정하기"로 변경
                $('#saveButton').text('수정하기');

                // 모달을 띄우기
                $('#noticeDetailModal').modal('show');
            } else {
                alert(response.message || "공지사항을 불러오는 데 실패했습니다.");
            }
        },
        error: function (err) {
            console.error("공지사항 상세조회 중 오류:", err);
            alert("공지사항 상세조회 중 오류가 발생했습니다.");
        }
    });
}

// 공지사항 수정
function updateNotice() {
    const title = $('#editTitle').val().trim();
    const content = $('#editContent').val().trim();
    const status = 'Y'; // 예시로 게시중으로 설정

    if (!title || !content) {
        alert("제목과 내용을 모두 입력해 주세요.");
        return;
    }

    const data = {
        title: title,
        content: content,
        status: status,
        notice_idx: currentNoticeId // 수정하려는 공지사항의 ID
    };

    // AJAX 요청 (수정)
    $.ajax({
        url: '/mtl/api/notice/update',  // 수정 API URL
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function (response) {
            if (response.result) {
                alert('공지사항이 수정되었습니다.');
                location.reload(); // 페이지 새로고침
            } else {
                alert('공지사항 수정에 실패했습니다.');
            }
        },
        error: function (err) {
            console.error("공지사항 수정 중 오류:", err);
            alert("공지사항 수정 중 오류가 발생했습니다.");
        }
    });
}

// 모달 초기화 (새 공지사항 등록을 위한 초기화)
function clearModal() {
    $('#editTitle').val('');  // 제목 초기화
    $('#editContent').val('');  // 내용 초기화
    $('#detailStatus').text('');  // 상태 초기화
    currentNoticeId = null;  // 현재 공지사항 ID 초기화
    $('#saveButton').text('수정하기');  // 버튼 텍스트를 수정하기로 변경
}

// 수정 버튼 클릭 이벤트
$('#saveButton').click(function() {
    updateNotice();
});

// 공지사항 상세 조회 모달 열기
$('#openModalButton').click(function() {
    clearModal();
    $('#noticeDetailModal').modal('show');
});


    /**
     * 공지사항 검색
     */
	function searchNotices(keyword, status, target) {
	    const param = { keyword, status, target, offset: 0, limit: 10 };
	
	    console.log("검색 요청 데이터:", param);
	
	    $.ajax({
	        url: "/mtl/api/notice/search",
	        method: "POST",
	        contentType: "application/json",
	        data: JSON.stringify(param),
	        success: function (response) {
	            console.log("검색 결과:", response);
	            const notices = response.list;
	            if (notices.length === 0) {
	                $('#noticeList').html("<p class='text-center text-muted'>검색 결과가 없습니다.</p>");
	            } else {
	                renderNotices(notices);
	            }
	        },
	        error: function (err) {
	            console.error("검색 중 오류 발생:", err);
	            alert("검색 중 오류가 발생했습니다.");
	        }
	    });
	}
  /**
     * 공지사항 데이터 로드
     */
    function loadNotices(curPage = 1) {
		const data = { }; // 페이지당 5개

		// 페이징
		let pageOption = {
			limit: 5
		};
		
		let page = $("#pagination").customPaging(pageOption, function(_curPage){
			loadNotices(_curPage);
		});
		
		let pageParam = page.getParam(curPage);
		
		if(pageParam) {
			data.offset = pageParam.offset;
			data.limit = pageParam.limit;
		};
		// 페이징 끝

		$.ajax({
            url: "/mtl/api/notice/list",
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify(data),
            success: function (response) {
            console.log(response);
                if (response) {
                    renderNotices(response.list);
                    page.drawPage(response.totalCnt);
                }
            },
            error: function (err) {
                console.error("공지사항 조회 오류:", err);
                alert("공지사항 조회 중 오류가 발생했습니다.");
            }
        });
    }

    /**
     * 공지사항 목록 렌더링
     */
    function renderNotices(notices) {
        let listContainer = $("#noticeList");
        listContainer.empty();

        if (!notices || notices.length === 0) {
            listContainer.append("<li>등록된 공지사항이 없습니다.</li>");
            return;
        }

        notices.forEach(function (notice) {
            const targetText = notice.target === 'U' ? '사용자' : notice.target === 'P' ? '파트너' : '알 수 없음';
            const statusText = notice.status === 'Y' ? '게시중' : notice.status === 'N' ? '게시중단' : '알 수 없음';

            let listItem = $(`
                <div class="row row-cols-xl-7 align-items-lg-center border-bottom g-4 px-2 py-4">
                    <div class="col text-center"><h6 class="ms-1 mb-0 fw-normal">${targetText}</h6></div>
                    <div class="col text-center">
                        <a role="button" class="text-primary fw-bold ms-1 mb-0 noticeDetailModal" data-bs-toggle="modal" data-bs-target="noticeDetailModal text-center" data-data-id="${notice.notice_idx}">${notice.title}</a>
                    </div>
                    <div class="col text-center"><h6 class="ms-1 mb-0 fw-normal">${notice.content}</h6></div>
                    <div class="col text-center"><h6 class="ms-1 mb-0 fw-normal">${statusText}</h6></div>
                    <div class="col text-center"><h6 class="ms-1 mb-0 fw-normal">${notice.create_date_format}</h6></div>
                </div>
            `);
            listContainer.append(listItem);
        });
        
        // 상세 버튼 클릭 이벤트
        $('.noticeDetailModal').off().on("click", function (e) {
        	let notice_idx = $(this).data('data-id');
            loadNoticeDetailByIdx(notice_idx);
        });
    }
 
    /**
     * 현재 메뉴 활성화
     */
    function menuActive() {
        $("#serviceNotice").addClass("active");
    }

    return { init };
})();
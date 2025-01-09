const notice = (function () {
    /**
     * 초기화 함수
     * 페이지 로드 시 실행되는 초기화 작업
     */
    function init() {
        console.log("1");
        _menuActive(); // 현재 메뉴 활성화
        _eventInit(); // 이벤트 초기화
        _loadNotices(1); // 첫 번째 페이지 공지사항 데이터 로드
    }
    

    /**
     * 이벤트 초기화
     * 버튼 클릭 및 페이징 관련 이벤트 설정
     */
    function _eventInit() {
        // 버튼 클릭 이벤트 바인딩
        let evo = $("[data-src='notice'][data-act]").off();
        evo.on("click", function (e) {
            _eventAction(e); // 버튼 클릭 시 이벤트 처리
        });

        // 등록 버튼 클릭 이벤트
        $('#noticeRegistModal .btn-primary').off().on("click", function () {
            _registerNotice();
        });

        // 수정 버튼 클릭 이벤트
        $('#noticeEditModal .btn-primary').off().on("click", function () {
            _editNotice();
        });

        // 검색 버튼 클릭 이벤트
        $('#searchButton').click(function () {
            const keyword = $('#searchKeyword').val();
            const status = $('#searchStatus').val();
            const target = $('#searchTarget').val();

            // 검색 요청
            _searchNotices(keyword, status, target);
        });

        // 초기화 버튼 클릭 이벤트
        $('#resetButton').click(function () {
            $('#searchKeyword').val('');
            $('#searchStatus').val('');
            $('#searchTarget').val('');
            _loadNotices(1); // 초기 목록 다시 로드
        });

        // 페이징 초기화
        _initPaging(); // 새로 추가된 페이징 초기화
    }

	 /**
     * 공지사항 등록
     */
	function _registerNotice() {
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
	function loadNoticeDetailByTitle(title) {
	    $.ajax({
	        url: '/mtl/api/notice/detail',
	        type: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify({ title: title }),
	        success: function (response) {
	            if (response.result) {
	                // 성공 시 상세 데이터 표시
	                const notice = response.data;
	                $('#detailTitle').text(notice.title);
	                $('#detailContent').text(notice.content);
	                $('#detailStatus').text(notice.status === 'Y' ? '게시중' : '게시중단');
	                $('#noticeDetailModal').modal('show');
	            } else {
	                alert(response.message || "공지사항을 불러오는 데 실패했습니다.");
	            }
	        },
	        error: function (err) {
	            console.error("공지사항 조회 중 오류:", err);
	            alert("공지사항 조회 중 오류가 발생했습니다.");
	        }
	    });
	}
		
		
	function _editNotice() {
    // 수정할 데이터 가져오기
    const title = $('#editTitle').val();
    const content = $('#editContent').val();
    const status = $('#editStatus').val();

    if (!title || !content || !status) {
        alert("모든 필드를 입력하세요.");
        return;
    }

    const data = {
        title: title,
        content: content,
        status: status
    };

    console.log("수정 요청 데이터:", data);

    // 서버로 수정 요청
    $.ajax({
        url: `/mtl/api/notice/update`, // API 엔드포인트
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function (response) {
            if (response.success) {
                alert('공지사항이 수정되었습니다.');
                location.reload(); // 페이지 새로고침
            } else {
                alert(response.message || '공지사항 수정에 실패했습니다.');
            }
        },
        error: function (err) {
            console.error("공지사항 수정 중 오류:", err);
            alert("공지사항 수정 중 오류가 발생했습니다.");
	        }
	    });
	}
	
    /**
     * 공지사항 검색
     */
	function _searchNotices(keyword, status, target) {
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
	                _renderNotices(notices);
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
    function _loadNotices(page) {
        let data = { offset: (page - 1) * 5, limit: 5 };

        console.log("공지사항 데이터를 로드합니다.");

        $.ajax({
            url: "/mtl/api/notice/list",
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify(data),
            success: function (response) {
                _renderNotices(response.list);
                _updatePaging(response.totalCnt, page); // 페이징 업데이트
            },
            error: function (err) {
                console.error("Failed to load notices:", err);
                alert("공지사항 데이터를 불러오는 중 오류가 발생했습니다.");
            }
        });
    }

    /**
     * 공지사항 목록 렌더링
     */
    function _renderNotices(notices) {
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
                    <div class="col-2"><h6 class="ms-1 mb-0 fw-normal">${targetText}</h6></div>
                    <div class="col-5">
                        <a role="button" class="text-primary fw-bold ms-1 mb-0" data-bs-toggle="modal" data-bs-target="#noticeEditModal" data-data-id="${notice.notice_idx}">${notice.title}</a>
                    </div>
                    <div class="col-2"><h6 class="ms-1 mb-0 fw-normal">${statusText}</h6></div>
                    <div class="col-3"><h6 class="ms-1 mb-0 fw-normal">${notice.create_date_format}</h6></div>
                </div>
            `);
            listContainer.append(listItem);
        });
    }
    /**
     * 페이징 초기화
     */
   function _initPaging(totalCnt, curPage) {
	    let pageOption = { limit: 5 };
	
	    let page = $("#noticePaging").data("pagingInstance");
	    if (!page) {
	        page = $("#noticePaging").customPaging(pageOption, function (_curPage) {
	            _loadNotices(_curPage);
	        });
	    }
	
	    if (totalCnt) {
	        page.drawPage(totalCnt); // 전체 페이지 수 갱신
	    }
	
	    if (curPage) {
	        page.getParam(curPage); // 현재 페이지 갱신
	    }
	}

    /**
     * 페이징 업데이트
     */
    function _updatePaging(totalCnt, curPage) {
        let pageOption = { limit: 5 };
        let page = $("#noticePaging").data("pagingInstance");

        if (!page) {
            page = $("#noticePaging").customPaging(pageOption, function (_curPage) {
                _loadNotices(_curPage);
            });
        }

        let pageParam = page.getParam(curPage);

        if (pageParam) {
            page.drawPage(totalCnt); // 페이지 갱신
        }
    }

    /**
     * 현재 메뉴 활성화
     */
    function _menuActive() {
        $("#serviceNotice").addClass("active");
    }

    return { init };
})();
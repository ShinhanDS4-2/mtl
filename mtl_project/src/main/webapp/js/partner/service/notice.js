const userNotice = (function () {
    // 페이지 로딩 시 이벤트 초기화 실행
    function init() {
        loadNotices(); // 첫 페이지 로드
        _eventInit(); // 이벤트 초기화
    }

    // 이벤트 초기화
    function _eventInit() {
        // 검색 버튼 클릭 시 공지사항을 다시 로드
        $(document).on("click", "#searchButton", function() {
            loadNotices();
        });

        // 초기화 버튼 클릭 시 페이지를 새로 고침
        $(document).on("click", "#resetButton", function() {
            window.location.reload();
        });
    }

	  function loadNotices(curPage = 1) {
	    const data = {}; // 페이지당 10개
	
	    // 페이징 설정
	    let pageOption = {
	        limit: 10
	    };
	
	    let page = $("#pagination").customPaging(pageOption, function (_curPage) {
	        loadNotices(_curPage); // 현재 페이지 번호를 전달받아 해당 페이지에 표시할 데이터를 가져오는 함수.
	    });
	
	    let pageParam = page.getParam(curPage);  // 페이징에 필요한 정보(예: offset, limit)를 반환.
	
	    if (pageParam) {  // 받은 pageParam 값을 ajax에 넘겨줄 데이터에 설정하는 부분
	        data.offset = pageParam.offset;
	        data.limit = pageParam.limit;
	    }
	
	    data.target = "P"; // target이 "P"인 공지사항만 가져옴
		data.status = "Y";  // status가 "Y"인 공지사항만 가져옴
		
	    $.ajax({
	        url: "/mtl/api/notice/list",  // 공지사항 조회 API
	        method: "POST",
	        contentType: "application/json",
	        data: JSON.stringify(data),
	        success: function (response) {
	            console.log(response);
	            if (response) {
	                renderNotices(response.list);  // 공지사항 목록 렌더링
	                page.drawPage(response.totalCnt);  // 페이징 처리
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
        const noticeList = $("#noticeList");
        noticeList.empty();

        notices.forEach(notice => {
            const row = $(` 
                <tr>
                   <tr>
					    <td class="col-3 text-center">
					        <a role="button" class="fw-bold ms-1 mb-0 getNoticeDetailByIdx" data-bs-toggle="modal" data-bs-target="#openNoticeModal" data-data-id="${notice.notice_idx}">
					            ${notice.title}
					        </a>
					    </td>
					    <td class="col-3 text-center">
					        <h6 class="ms-1 mb-0 fw-bold">${notice.create_date_format}</h6>
					    </td>
					</tr>

            `);
            noticeList.append(row);
        });

        // 제목 클릭 시 모달을 여는 이벤트 리스너 추가
        $(".getNoticeDetailByIdx").on("click", function () {
            const idx = $(this).data("data-id");
            getNoticeDetailByIdx(idx);  // 모달에 데이터를 로드하는 함수 호출
        });
    }

    /**
     * 공지사항 상세보기
     */
    function getNoticeDetailByIdx(notice_idx) {
        $.ajax({
            url: '/mtl/api/notice/detail',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ notice_idx: notice_idx }),
            success: function (response) {
                const notice = response.data;
                $('#modalTitle').text(notice.title);
                $("#modalContent").text(notice.content);
                $("#getNoticeDetailByIdx").modal("show");
            },
            error: function (err) {
                console.error("공지사항 상세조회 중 오류:", err);
                alert("공지사항 상세조회 중 오류가 발생했습니다.");
            }
        });
    }

    return {
        init,
    };
})();

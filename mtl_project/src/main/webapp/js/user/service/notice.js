const notice = (function() {
    /**
     * 초기화 함수
     * 페이지 로드 시 실행되는 초기화 작업
     */
    function init() {
        _menuActive(); // 현재 메뉴 활성화
        _eventInit();  // 이벤트 초기화
    }

    /**
     * 이벤트 초기화
     * 버튼 클릭 및 페이징 관련 이벤트 설정
     */
    function _eventInit() {
        // 버튼 클릭 이벤트 바인딩
        let evo = $("[data-src='notice'][data-act]").off();
        evo.on("click", function(e) {
            _eventAction(e); // 버튼 클릭 시 이벤트 처리
        });

        // 페이징 초기화
        let pagingElement = $("#noticePaging");
        if (pagingElement.length) {
            _initPaging(pagingElement);
        }
    }

    /**
     * 버튼 클릭 이벤트 처리
     * @param {Event} e - 클릭 이벤트 객체
     */
    function _eventAction(e) {
        let evo = $(e.currentTarget);
        let action = evo.attr("data-act");

        if (action === "reload") {
            // 공지사항 목록 다시 로드
            let pagingElement = $("#noticePaging");
            if (pagingElement.length) {
                let paging = pagingElement.data("pagingInstance");
                let param = paging.getParam(paging.getCurPage());
                _loadNotices(param.offset / param.limit + 1);
            }
        }
    }

    /**
     * 페이징 초기화
     * 페이징 설정 및 초기 데이터 로드
     * @param {jQuery} pagingElement - 페이징 컨테이너 요소
     */
    function _initPaging(pagingElement) {
        let paging = $(pagingElement).customPaging(
            {
                limit: 10,      // 페이지 당 항목 수
                showPageNum: 5, // 보여질 페이지 번호 개수
            },
            function(page) {
                _loadNotices(page); // 페이지 변경 시 호출
            }
        );

        // 첫 번째 페이지 데이터 로드
        let param = paging.getParam(1);
        _loadNotices(param.offset / param.limit + 1);
    }

    /**
     * 공지사항 데이터 로드
     * @param {number} page - 현재 페이지 번호
     */
    function _loadNotices(page) {
        let pagingElement = $("#noticePaging");
        if (!pagingElement.length) return;

        let paging = pagingElement.data("pagingInstance");
        if (!paging) return;

        let param = paging.getParam(page);

        $.ajax({
            url: "/api/notice/list", // 공지사항 데이터를 가져올 API
            method: "GET",
            data: param,
            success: function(response) {
                _renderNotices(response.data);       // 공지사항 목록 렌더링
                paging.drawPage(response.totalCount); // 페이징 업데이트
            },
            error: function(err) {
                console.error("Failed to load notices:", err);
                alert("공지사항 데이터를 불러오는 중 오류가 발생했습니다.");
            },
        });
    }

    /**
     * 공지사항 목록 렌더링
     * @param {Array} notices - 공지사항 데이터 배열
     */
    function _renderNotices(notices) {
        let listContainer = $("#noticeList");
        listContainer.empty(); // 기존 목록 비우기

        if (!notices || notices.length === 0) {
            // 데이터가 없는 경우
            listContainer.append("<li>등록된 공지사항이 없습니다.</li>");
            return;
        }

        // 공지사항 데이터 렌더링
        notices.forEach(function(notice) {
            let listItem = $("<li>")
                .addClass("notice-item")
                .text(notice.title);
            listContainer.append(listItem);
        });
    }

    /**
     * 현재 메뉴 활성화
     */
    function _menuActive() {
        $("#serviceNotice").addClass("active");
    }

    // 외부에서 접근 가능한 메서드 반환
    return {
        init,
    };
})();

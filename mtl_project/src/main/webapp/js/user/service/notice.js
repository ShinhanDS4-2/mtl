const notice = (function() {

    function init() {
        _menuActive();
        _eventInit();
    };

    function _eventInit() {
        let evo = $("[data-src='notice'][data-act]").off();
        evo.on("click", function(e) {
            _eventAction(e);
        });

        let pagingElement = $("#noticePaging");
        if (pagingElement.length) {
            _initPaging(pagingElement);
        }
    };

    function _eventAction(e) {
        let evo = $(e.currentTarget);

        let action = evo.attr("data-act");

        if (action === "reload") {
            let pagingElement = $("#noticePaging");
            if (pagingElement.length) {
                let paging = pagingElement.data("pagingInstance");
                let param = paging.getParam(paging.getCurPage());
                _loadNotices(param.offset / param.limit + 1);
            }
        }
    };

    function _initPaging(pagingElement) {
        let paging = $(pagingElement).customPaging(
            {
                limit: 10,
                showPageNum: 5,
            },
            function(page) {
                _loadNotices(page);
            }
        );

        let param = paging.getParam(1);
        _loadNotices(param.offset / param.limit + 1);
    };

    function _loadNotices(page) {
        let pagingElement = $("#noticePaging");
        let paging = pagingElement.data("pagingInstance");

        let param = paging.getParam(page);

        $.ajax({
            url: "/api/notice/list",
            method: "GET",
            data: param,
            success: function(response) {
                _renderNotices(response.data);
                paging.drawPage(response.totalCount);
            },
            error: function(err) {
                console.error("Failed to load notices:", err);
            },
        });
    };

    function _renderNotices(notices) {
        let listContainer = $("#noticeList");
        listContainer.empty();

        if (notices.length === 0) {
            listContainer.append("<li>등록된 공지사항이 없습니다.</li>");
            return;
        }

        notices.forEach(function(notice) {
            let listItem = $("<li>").addClass("notice-item").text(notice.title);
            listContainer.append(listItem);
        });
    };

    function _menuActive() {
        $("#serviceNotice").addClass("active");
    };

    return {
        init,
    };
})();

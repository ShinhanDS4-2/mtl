const userNotice = (function () {
    function init() {
        loadNotices(); // 첫 페이지 로드
    }

    // 공지사항 데이터 로드
    function loadNotices(curPage = 1) {
        const data = { }; // 페이지당 10개

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
            url: "/mtl/api/notice/user/list",
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

    // 공지사항 목록 렌더링
    function renderNotices(notices) {
        const noticeList = $("#noticeList");
        noticeList.empty();

        notices.forEach(notice => {
            const row = $(`
                <tr>
					<td> <h6 class="mb-0"><a href="#" data-bs-toggle="modal" data-bs-target="#noticeModal">${notice.title}</a></h6> </td>
					<td class="text-end"> <small class="mb-0 fw-light text-secondary">${notice.create_date_format}</small> </td>
				</tr>
            `);
            noticeList.append(row);
        });
    }

    // 공지사항 상세 모달 열기
    function openNoticeModal(title, content) {
        $("#modalTitle").text(title);
        $("#modalContent").text(content);
        $("#noticeModal").modal("show");
    }

    return { init, };
})();

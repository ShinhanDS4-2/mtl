const questionManagement = (function () {
    function init() {
        console.log("Question Management Initialized");
        eventInit(); // 이벤트 초기화
        loadQuestions(); // 첫 번째 페이지 문의 데이터 로드
    }

    /**
     * 이벤트 초기화
     */
    function eventInit() {
        // 검색 버튼 클릭 이벤트
        $('#searchButton').click(function () {
            const searchStatus = $("input[name='searchStatus']:checked").val();
            const searchType = $('#searchType').val();
            const searchKeyword = $('input[type="text"]').val();

            // 검색 요청
            searchQuestions(searchStatus, searchType, searchKeyword);
        });

        // 초기화 버튼 클릭 이벤트
        $('#resetButton').click(function () {
            $('input[type="text"]').val('');
            $('input[name="searchStatus"]').prop('checked', false);
            $('#searchType').val('');
            loadQuestions(); // 초기 목록 다시 로드
        });
    }

    /**
     * 문의 데이터 로드
     */
    function loadQuestions(curPage = 1) {
        const data = {};

        // 페이징
        let pageOption = {
            limit: 5
        };
        
        let page = $("#pagination").customPaging(pageOption, function (_curPage) {
            loadQuestions(_curPage);
        });
        
        let pageParam = page.getParam(curPage);
        
        if (pageParam) {
            data.offset = pageParam.offset;
            data.limit = pageParam.limit;
        }

        $.ajax({
            url: "/mtl/api/question/list",
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify(data),
            success: function (response) {
                console.log(response);
                if (response) {
                    $("#totalCnt").text(response.totalCnt);
                    renderQuestions(response.list);
                    page.drawPage(response.totalCnt);
                }
            },
            error: function (err) {
                console.error("문의 데이터 조회 오류:", err);
                alert("문의 데이터 조회 중 오류가 발생했습니다.");
            }
        });
    }

    /**
     * 문의 검색
     */
    function searchQuestions(status, type, keyword) {
        const param = { status, type, keyword, offset: 0, limit: 10 };

        console.log("검색 요청 데이터:", param);

        $.ajax({
            url: "/mtl/api/question/search",
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify(param),
            success: function (response) {
                console.log("검색 결과:", response);
                const questions = response.list;
                if (questions.length === 0) {
                    $('#questionList').html("<p class='text-center text-muted'>검색 결과가 없습니다.</p>");
                } else {
                    renderQuestions(questions);
                }
            },
            error: function (err) {
                console.error("검색 중 오류 발생:", err);
                alert("검색 중 오류가 발생했습니다.");
            }
        });
    }

    /**
     * 문의 데이터 렌더링
     */
    function renderQuestions(questions) {
        let listContainer = $("#questionList");
        listContainer.empty();

        if (!questions || questions.length === 0) {
            listContainer.append("<li>등록된 문의가 없습니다.</li>");
            return;
        }

        questions.forEach(function (question) {
            const statusText = question.answerYN === 'Y' ? '답변완료' : '답변대기';
            const statusClass = question.answerYN === 'Y' ? 'bg-success text-success' : 'bg-danger text-danger';

            let listItem = $(`
                <div class="row border-bottom g-4 px-2 py-4">
                    <div class="col"><h6 class="mb-0 fw-normal">${question.title}</h6></div>
                    <div class="col"><h6 class="mb-0 fw-normal">${question.email}</h6></div>
                    <div class="col"><h6 class="mb-0 fw-normal">${question.create_date}</h6></div>
                    <div class="col"><div class="badge bg-opacity-10 ${statusClass}">${statusText}</div></div>
                </div>
            `);
            listContainer.append(listItem);
        });
    }

    return { init };
})();

// 초기화
$(document).ready(function () {
    questionManagement.init();
});

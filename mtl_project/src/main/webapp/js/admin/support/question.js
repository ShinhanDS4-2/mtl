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
            const searchStatus = $("input[name='flexRadioDefault']:checked").val();
            const searchField = $('.js-choice').val();
            const searchText = $('#searchText').val();

            // 검색 요청
            searchQuestions(searchStatus, searchField, searchText);
        });

        // 초기화 버튼 클릭 이벤트
        $('#resetButton').click(function () {
            $('input[type="text"]').val('');
            $('input[name="flexRadioDefault"]').prop('checked', false);
            $('.js-choice').val('');
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
            url: "/mtl/api/question/search",
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
    function searchQuestions(status, field, text) {
        const param = { answerStatus: status, searchField: field, searchText: text, offset: 0, limit: 10 };

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
                    $('#answerList').html("<p class='text-center text-muted'>검색 결과가 없습니다.</p>");
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
        let listContainer = $("#answerList");
        listContainer.empty();

        if (!questions || questions.length === 0) {
            listContainer.append("<div>등록된 문의가 없습니다.</div>");
            return;
        }

        questions.forEach(function (question) {
            const statusText = question.answerYN === 'Y' ? '답변완료' : '답변대기';
            const statusClass = question.answerYN === 'Y' ? 'bg-success text-success' : 'bg-danger text-danger';

            let listItem = $(` 
                <div class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
                    <div class="col"><h6 class="mb-0 fw-normal">${question.title}</h6></div>
                    <div class="col"><h6 class="mb-0 fw-normal">${question.userName}</h6></div>
                    <div class="col"><h6 class="mb-0 fw-normal">${new Date(question.create_date).toLocaleDateString()}</h6></div>
                    <div class="col"><div class="badge ${statusClass}">${statusText}</div></div>
                    <div class="col"><button class="btn btn-primary btn-sm" onclick="viewQuestion(${question.idx})">상세보기</button></div>
                </div>
            `);
            listContainer.append(listItem);
        });
    }

    /**
     * 상세보기 기능
     */
    function viewQuestion(idx) {
        $.ajax({
            url: `/mtl/api/question/detail`,
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify({ idx }),
            success: function (response) {
                const question = response.question;
                if (!question) {
                    alert("문의 데이터를 불러오지 못했습니다.");
                    return;
                }
                $('#questionContent').text(question.content || '내용 없음');
                $('#replyContent').val(question.answer || '');
                $('#questionModal').modal('show');
            },
            error: function (err) {
                console.error("상세보기 오류:", err);
                alert("상세보기 중 오류가 발생했습니다.");
            }
        });
    }

    return { init };
})();

// 초기화
$(document).ready(function () {
    questionManagement.init();
});

const question = (function() {

    // 문의 등록 처리
    function registQuestion() {
        const title = $('#qnaModal #qnaTitle').val().trim();
        const content = $('#qnaModal #qnaContent').val().trim();
        const type = $('#qnaModal #qnaType').val();
    
        if (!title || !content || !type) {
            alert("모든 필드를 입력하세요.");
            return;
        }
    
        // type 유효성 검사
        if (!['예약', '결제', '이용문의'].includes(type)) {
            alert("유효하지 않은 문의 유형입니다.");
            return;
        }
    
        const data = { title, content, type, status: 'Y' };
        console.log("등록 데이터:", data);
    
        // AJAX 요청 (서버로 데이터 전송)
        $.ajax({
            url: '/mtl/api/user/question/regist',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function(response) {
                console.log("서버 응답:", response);
                if (response.result) {
                    alert('문의가 등록되었습니다.');
                    $('#qnaModal').modal('hide');  // 모달 닫기
                    loadQuestionList();  // 리스트 갱신
                } else {
                    alert('문의 등록에 실패했습니다.');
                }
            },
            error: function(err) {
                console.error("문의 등록 중 오류:", err);
                alert("문의 등록 중 오류가 발생했습니다.");
            }
        });
    }

    // 문의 리스트 불러오기
    function loadQuestionList() {
        $.ajax({
            url: '/mtl/api/user/question/list',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({}),
            success: function(response) {
                const questions = response.list;
                let html = '';
                questions.forEach(function(q) {
                    html += `<tr>
                                <td>${q.type}</td>
                                <td>${q.title}</td>
                                <td>${q.create_date}</td>
                                <td><div class="badge bg-${q.answer_yn == 'Y' ? 'success' : 'warning'}">${q.answer_yn == 'Y' ? '답변완료' : '답변대기'}</div></td>
                                <td><a href="#" class="btn btn-sm btn-light" onclick="viewQuestion(${q.id})">보기</a></td>
                              </tr>`;
                });
                $("#questionList tbody").html(html);
            },
            error: function(err) {
                console.error("문의 목록 불러오기 오류:", err);
                alert("문의 목록을 불러오는 중 오류가 발생했습니다.");
            }
        });
    }

    // 문의 상세보기
    function viewQuestion(id) {
        // 상세보기 Modal을 띄우고, 해당 ID로 상세 정보를 서버에서 받아옵니다.
        $.ajax({
            url: '/mtl/api/user/question/detail',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ id: id }),
            success: function(response) {
                const q = response.question;
                $('#qnaDetailModal #questionTitle').text(q.title);
                $('#qnaDetailModal #questionContent').text(q.content);
                $('#qnaDetailModal').modal('show');
            },
            error: function(err) {
                console.error("문의 상세보기 오류:", err);
                alert("문의 상세보기 중 오류가 발생했습니다.");
            }
        });
    }

    // 초기화
    function init() {
        loadQuestionList();  // 페이지 로드 시 문의 리스트 불러오기
        $('#registQuestionBtn').on('click', registQuestion);
    }

    return {
        init: init,
        loadQuestionList: loadQuestionList,
        viewQuestion: viewQuestion
    };
})();

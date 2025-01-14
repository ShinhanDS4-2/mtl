const question = (function() {

    // 문의 등록 처리
    function registQuestion1() {
        const title = $('#qnaModal #qnaTitle').val().trim();
        const content = $('#qnaModal #qnaContent').val().trim();
    
        if (!title || !content) {
            alert("모든 필드를 입력하세요.");
            return;
        }
    
        const data = { title, content};
        console.log("AJAX 요청 데이터:", JSON.stringify(data));
    
        // AJAX 요청 (서버로 데이터 전송)
        $.ajax({
            url: '/mtl/api/user/question/regist1',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function(response) {
                console.log("서버 응답:", response);
                if (response.result) {
                   	modal.alert({
                   		"content" : '문의가 등록되었습니다.',
                   		"confirmCallback" : function () {
		                    $('#qnaModal').modal('hide');  // 모달 닫기
		                    loadQuestionList();  // 리스트 갱신
                   		}
                   	});
                }
            },
            error: function(err) {
                console.error("문의 등록 중 오류:", err);
                alert("문의 등록 중 오류가 발생했습니다.");
            }
        });
    }
	/**
	 * 문의 리스트 데이터 로드
	 */
	function loadQuestionList(curPage = 1) {
	    const data = {};
	
	    // 페이징 설정
	    let pageOption = {
	        limit: 5 // 페이지당 5개
	    };
	
	    let page = $("#pagination").customPaging(pageOption, function (_curPage) {
	        loadQuestionList(_curPage); // 페이지 변경 시 다시 로드
	    });
	
	    let pageParam = page.getParam(curPage);
	
	    if (pageParam) {
	        data.offset = pageParam.offset;
	        data.limit = pageParam.limit;
	    }
	
	    // AJAX 요청
	    $.ajax({
	        url: '/mtl/api/user/question/list',
	        type: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify(data),
	        success: function (response) {
	            console.log("서버 응답:", response);
	
	            if (!response || !response.list) {
	                console.error("response.list가 비어있습니다.");
	                alert("문의 데이터를 불러오는 데 실패했습니다.");
	                renderQuestions([]); // 빈 배열을 렌더링
	                return;
	            }
	
	            const questions = response.list && response.list.list ? response.list.list : [];
	            renderQuestions(questions); // 데이터를 렌더링 함수에 전달
	
	            // 페이지네이션 갱신
	            page.drawPage(response.total || 0);
	        },
	        error: function (err) {
	            console.error("문의 목록 불러오기 오류:", err);
	            alert("문의 목록을 불러오는 중 오류가 발생했습니다.");
	        }
	    });
	}
	
	/**
	 * 문의 리스트 렌더링
	 */
	function renderQuestions(questions) {
	    const listContainer = $("#questionList"); // tbody를 정확히 지정
	    listContainer.empty(); // 기존 데이터를 초기화
	
	    if (!questions || questions.length === 0) {
	        listContainer.append("<tr><td colspan='4' class='text-center'>등록된 문의가 없습니다.</td></tr>");
	        return;
	    }
	
questions.forEach(function(question) {
    const html = `
        <tr>
            <td>${question.title || "제목 없음"}</td>
            <td>${new Date(question.create_date).toLocaleDateString()}</td>
            <td>
                <div class="badge bg-${question.answer_yn === "Y" ? "success" : "danger"} bg-opacity-10 text-${question.answer_yn === "Y" ? "success" : "danger"}">
                    ${question.answer_yn === "Y" ? "답변완료" : "답변대기"}
                </div>
            </td>
            <td>
                <a href="javascript:;" class="btn btn-sm btn-light mb-0" onclick="viewQuestion(${question.idx})">보기</a>
            </td>
        </tr>
    `;
    $("#questionList").append(html);
});

	}
	
	function viewQuestion(idx) {
	    $.ajax({
	        url: '/mtl/api/user/question/detail',
	        type: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify({idx : idx}),
	        success: function (response) {
	            console.log("서버 응답:", response);
	
	            // 서버에서 question 객체가 response 안에 포함된 경우
	            const question = response.question;
	            if (!question) {
	                alert("문의 데이터를 불러오지 못했습니다.");
	                return;
	            }
	
	            // 모달 데이터 설정
	            $('#qnaDetailModal #questionTitle').text(response.title || '제목 없음'); // 제목
	            $('#qnaDetailModal #questionContent').text(response.content || '내용 없음'); // 문의 내용
	            $('#qnaDetailModal #answerContent').text(response.answer || '답변 대기 중입니다.'); // 답변 내용
	
	            // 모달 표시
	            $('#qnaDetailModal').modal('show');
	        },
	        error: function (err) {
	            console.error("문의 상세보기 오류:", err);
	            alert("문의 상세보기 중 오류가 발생했습니다.");
	        }
	    });
	}
	window.viewQuestion = viewQuestion;


    // 초기화
    function init() {
        loadQuestionList();  // 페이지 로드 시 문의 리스트 불러오기
        $('#registQuestionBtn').on('click', registQuestion1);
    }

    return {
        init: init,
        loadQuestionList: loadQuestionList,
        viewQuestion: viewQuestion
    };
})();

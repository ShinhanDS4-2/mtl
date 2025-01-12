const question = (function () {
    function init() {
        console.log("1");
        menuActive(); // 현재 메뉴 활성화
        eventInit(); // 이벤트 초기화
        loadQuestion(); // 첫 번째 페이지 공지사항 데이터 로드
    }

    /**
     * 이벤트 초기화
     * 버튼 클릭 및 페이징 관련 이벤트 설정
     */
    function eventInit() {
        // 버튼 클릭 이벤트 바인딩
        let evo = $("[data-src='question'][data-act]").off();
        evo.on("click", function (e) {
            eventAction(e); // 버튼 클릭 시 이벤트 처리
        });

        // 등록 버튼 클릭 이벤트
        $('#registQuestion .btn-primary').off().on("click", function () {
            registQuestion();
        });

        // 
        $('#qnaModal .btn-primary').off().on("click", function () {
            loadQuestiondetail();
            
        });
                

        // 초기화 버튼 클릭 이벤트
        $('#resetButton').click(function () {
          
            loadQuestion(); // 초기 목록 다시 로드
        });

    }

	 /**
     * 공지사항 등록
     */
	function registQuestion() {
	    const title = $('#qnaModal #qnaTitle').val().trim();
	    const content = $('#qnaModal #qnaContent').val().trim();
	
	    if (!title || !content) {
	        alert("모든 필드를 입력하세요.");
	        return;
	    }
	
	    const data = { title, content };
	    console.log("등록 데이터:", data);
	
	    // AJAX 요청
	    $.ajax({
	        url: '/mtl/api/user/question/regist',
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
	function loadQuestiondetail(question_idx) {
	    $.ajax({
	        url: '/mtl/api/user/question/detial',
	        type: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify({ question_idx: question_idx }),
	        success: function (response) {
	            if (response.result) {
	                const question = response.data;
	
	                // 제목과 내용 입력 필드에 넣기
	                $('#qnaTitle').val(question.title);
	                $('#qnaContent').val(question.content);
	
	                // 수정 버튼 관련 코드 제거 (보기만 할 수 있도록)
	                $('#saveButton').hide(); // 수정 버튼을 숨김
	
	                // 모달을 띄우기
	                $('#qnaModal').modal('show');
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

  /**
     * 공지사항 데이터 로드
     */
    function loadQuestion(curPage = 1) {
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
            url: "/mtl/api/user/question/list",
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify(data),
            success: function (response) {
            console.log(response);
                if (response) {
                
                	$("#totalCnt").text(response.totalCnt);
                    renderQuestion(response.list);
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
	 * 문의 목록 렌더링
	 */
	function renderQuestion(questions) {
	    let listContainer = $("#questionList");
	    listContainer.empty();
	
	    if (!questions || questions.length === 0) {
	        listContainer.append("<li>등록된 문의사항이 없습니다.</li>");
	        return;
	    }
	
	    questions.forEach(function (question) {
	        // 제목, 문의일, 답변상태만 출력
	        let listItem = $(`
	            <div class="row border-bottom g-4 px-2 py-4">
	                <div class="col text-center"><h6 class="mb-0 fw-normal">${question.title}</h6></div>
	                <div class="col text-center"><h6 class="mb-0 fw-normal">${question.create_date}</h6></div>
	                <div class="col text-center">
	                    <div class="badge bg-opacity-10 ${question.answer_yn === 'Y' ? 'bg-success text-success' : 'bg-warning text-warning'}">
	                        ${question.answer_yn === 'Y' ? '답변완료' : '답변대기'}
	                    </div>
	                </div>
	                <div class="col text-center">
	                    <a href="#" class="btn btn-sm btn-light qnaModal" data-bs-toggle="modal" data-bs-target="#qnaModal" data-data-id="${question.id}">보기</a>
	                </div>
	            </div>
	        `);
	        listContainer.append(listItem);
	    });
	
	    // 상세 버튼 클릭 이벤트
	    $('.qnaModal').off().on("click", function (e) {
	        let question_idx = $(this).data('data-id');
	        loadQuestionDetail(question_idx); // 상세보기 함수 호출
	    });
	}

    /**
     * 현재 메뉴 활성화
     */
    function menuActive() {
        $("#serviceQuestion").addClass("active");
    }

    return { init };
})();
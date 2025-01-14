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
                    	"confirmCallback" : function() {
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
	        url: '/mtl/api/user/question/list1',
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
	    const listContainer = $("#questionList1"); // tbody를 정확히 지정
	    listContainer.empty(); // 기존 데이터를 초기화
	
	    if (!questions || questions.length === 0) {
	        listContainer.append("<tr><td colspan='4' class='text-center'>등록된 문의가 없습니다.</td></tr>");
	        return;
	    }
			
		questions.forEach(function(question) {
		    const html = `
		        <tr>
		            <td>${question.title || "제목 없음"}</td>
		            <td>${question.format_date}</td>
		            <td>
		                <div class="badge bg-${question.answer_yn == "Y" ? "success" : "danger"} bg-opacity-10 text-${question.answer_yn === "Y" ? "success" : "danger"}">
		                    ${question.answer_yn == "Y" ? "답변완료" : "답변대기"}
		                </div>
		            </td>
		            <td>
		                <a href="javascript:;" class="btn btn-sm btn-light mb-0" onclick="viewQuestion(${question.idx})">보기</a>
		            </td>
		        </tr>
		    `;
		    $("#questionList1").append(html);
		});
	}
	
	function viewQuestion(idx) {
	    $.ajax({
	        url: '/mtl/api/user/question/detail1',
	        type: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify({idx : idx}),
	        success: function (response) {
	            console.log("서버 응답:", response);
				
	           
	            const question = response.question || response;

	            if (!question) {
	                alert("문의 데이터를 불러오지 못했습니다.");
	                return;
	            }
	
	            // 모달 데이터 설정
	            $('#qnaDetailModal #questionTitle').text(question.title || '제목 없음'); // 제목
	            $('#qnaDetailModal #questionContent').text(question.content || '내용 없음'); // 문의 내용
	            $('#qnaDetailModal #answerContent').text(question.answer || '답변 대기 중입니다.'); // 답변 내용
	            $('#qnaDetailModal #createDate').text(new Date(question.create_date).toLocaleDateString() || '-'); // 등록일
            	$('#qnaDetailModal #answerDate').text(question.answer_date ? new Date(question.answer_date).toLocaleDateString() : '-'); // 답변일
	
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
	/**
	 * 문의 리스트 데이터 로드
	 */
	function loadQuestionList0(curPage = 1) {
	    const data = {};
	
	    // 페이징 설정
	    let pageOption = {
	        limit: 5 // 페이지당 5개
	    };
	
	    let page = $("#pagination").customPaging(pageOption, function (_curPage) {
	        loadQuestionList0(_curPage); // 페이지 변경 시 다시 로드
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
	function renderQuestions0(questions) {
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
		            <td>${question.format_date}</td>
		            <td>
		                <div class="badge bg-${question.answer_yn === "Y" ? "success" : "danger"} bg-opacity-10 text-${question.answer_yn === "Y" ? "success" : "danger"}">
		                    ${question.answer_yn === "Y" ? "답변완료" : "답변대기"}
		                </div>
		            </td>
		            <td>
		                <a href="javascript:;" class="btn btn-sm btn-light mb-0" onclick="viewQuestion0(${question.idx})">보기</a>
		            </td>
		        </tr>
		    `;
		    $("#questionList").append(html);
		});
	}
	
	function viewQuestion0(idx) {
	    $.ajax({
	        url: '/mtl/api/user/question/detail',
	        type: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify({idx : idx}),
	        success: function (response) {
	            console.log("서버 응답:", response);
				
	           
	            const question = response.question || response;

	            if (!question) {
	                alert("문의 데이터를 불러오지 못했습니다.");
	                return;
	            }
	
	            // 모달 데이터 설정
	            $('#qnaDetailModal #questionTitle').text(question.title || '제목 없음'); // 제목
	            $('#qnaDetailModal #questionContent').text(question.content || '내용 없음'); // 문의 내용
	            $('#qnaDetailModal #answerContent').text(question.answer || '답변 대기 중입니다.'); // 답변 내용
	            $('#qnaDetailModal #createDate').text(new Date(question.create_date).toLocaleDateString() || '-'); // 등록일
            	$('#qnaDetailModal #answerDate').text(question.answer_date ? new Date(question.answer_date).toLocaleDateString() : '-'); // 답변일
	
	            // 모달 표시
	            $('#qnaDetailModal').modal('show');
	        },
	        error: function (err) {
	            console.error("문의 상세보기 오류:", err);
	            alert("문의 상세보기 중 오류가 발생했습니다.");
	        }
	    });
	}
	window.viewQuestion0 = viewQuestion0;

	function loadPartnerQuestionList(curPage = 1) {
		console.log('loadPartner');
	    const data = {};
	
	    // Pagination setup
	    let pageOption = {
	        limit: 5 // Items per page
	    };
	
	    let page = $("#pagination").customPaging(pageOption, function (_curPage) {
	        loadPartnerQuestionList(_curPage);
	    });
	
	    let pageParam = page.getParam(curPage);
	
	    if (pageParam) {
	        data.offset = pageParam.offset;
	        data.limit = pageParam.limit;
	    }
	
	    // AJAX 요청
	    $.ajax({
	        url: '/mtl/api/user/question/list2',
	        type: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify(data),
	        success: function (response) {
	            console.log("숙소 문의 서버 응답:", response);
	
	            if (!response || !response.list) {
	                console.error("숙소 문의 데이터를 불러오는 데 실패했습니다.");
	                renderPartnerQuestions([]);
	                return;
	            }
	
	            const questions = response.list.list;
	            renderPartnerQuestions(questions);
	
	            page.drawPage(response.total || 0);
	        },
	        error: function (err) {
	            console.error("숙소 문의 목록 불러오기 오류:", err);
	        }
	    });
	}
	function renderPartnerQuestions(questions) {
	    const listContainer = $("#questionList");
	    listContainer.empty();
	
	    if (!questions || questions.length === 0) {
	        listContainer.append("<tr><td colspan='4' class='text-center'>등록된 숙소 문의가 없습니다.</td></tr>");
	        return;
	    }
	
	    questions.forEach(function (question) {
	        const html = `
	            <tr>
	                <td>${question.title || "제목 없음"}</td>
	                <td>${question.format_date}</td>
	                 <td>
		                <div class="badge bg-${question.answer != null ? "success" : "danger"} bg-opacity-10 text-${question.answer != null  ? "success" : "danger"}">
		                    ${question.answer != null  ? "답변완료" : "답변대기"}
		                </div>
		            </td>
	                <td>	                  
   						 <a href="javascript:void(0);" class="btn btn-sm btn-light mb-0" onclick="viewPartnerQuestion(${question.idx})">보기</a>
	                </td>
	            </tr>
	        `;
	        listContainer.append(html);
	    });
	}
	function viewPartnerQuestion(idx) {
	    $.ajax({
	        url: '/mtl/api/user/question/detail2',
	        type: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify({idx : idx}),
	        success: function (response) {
	            console.log("서버 응답:", response);
				
	           
	            const question = response.question || response;

	            if (!question) {
	                alert("문의 데이터를 불러오지 못했습니다.");
	                return;
	            }
	
	            // 모달 데이터 설정
	            $('#qnaDetailModal #questionTitle').text(question.title || '제목 없음'); // 제목
	            $('#qnaDetailModal #questionContent').text(question.content || '내용 없음'); // 문의 내용
	            $('#qnaDetailModal #answerContent').text(question.answer || '답변 대기 중입니다.'); // 답변 내용
	            $('#qnaDetailModal #createDate').text(new Date(question.create_date).toLocaleDateString() || '-'); // 등록일
            	$('#qnaDetailModal #answerDate').text(question.answer_date ? new Date(question.answer_date).toLocaleDateString() : '-'); // 답변일
	
	            // 모달 표시
	            $('#qnaDetailModal').modal('show');
	        },
	        error: function (err) {
	            console.error("문의 상세보기 오류:", err);
	            alert("문의 상세보기 중 오류가 발생했습니다.");
	        }
	    });
	}
	window.viewPartnerQuestion = viewPartnerQuestion;


    // 초기화
    function init() {
        loadQuestionList();  // 페이지 로드 시 문의 리스트 불러오기
        $('#registQuestionBtn').on('click', registQuestion1);
        
        // Initialize 숙소 문의
		$("#tab2Area").on("click", function () {
	    loadPartnerQuestionList();
	});
	        
    }

    return {
        init: init,
        loadQuestionList: loadQuestionList,
        viewQuestion: viewQuestion

    };
})();

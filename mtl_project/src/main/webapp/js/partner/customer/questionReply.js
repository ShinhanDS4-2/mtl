const questionReply = (function() {

	 // 초기화
    function init() {
    	_setDetail();
    	_eventInit();
    }

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='questionReply'][data-act]").off();
		evo.on("click keyup", function(e) {
			_eventAction(e);
		});
	};
	
	// 이벤트 분기
	function _eventAction(e) {
		let evo = $(e.currentTarget);
		
		let action = evo.attr("data-act");
		
		let type = e.type;
		
		if(type == "click") {
			if(action == "clickAnswer") {
				_event.clickAnswer();
			}	
		};
	};
	
	let _event = {
		clickAnswer: function() {
			let idx = comm.getUrlParam().idx;
			
			let url = "/partner/question/answer";
		
			let data = {
				"question_idx" : idx,
				"answer" : $("#answerArea").val()
			};
			
			comm.sendJson(url, data, "POST", function(resp) {
				modal.alert({
					"content" : "답변이 등록되었습니다.",
					"confirmCallback" : function() {
						location.href = "/mtl/partner/question";	
					}
				});
			});
		}		
	};
	
	function _setDetail() {
		let idx = comm.getUrlParam().idx;
	
		let url = "/partner/question/detail";
		
		let data = {
			"question_idx" : idx
		};
		
		comm.sendJson(url, data, "POST", function(resp) {
			$("#questionContent").html(resp.data.content);
			
			if (resp.data.answer_yn == "Y") {
				$("#replyFeild").removeClass("d-none");
				$("#answerFeild").addClass("d-none");
				$("#answerContent").html(resp.data.answer);
			} else {
				$("#replyFeild").addClass("d-none");
				$("#answerFeild").removeClass("d-none");
			}
			_eventInit();
		});
	};

    return {
        init: init,
    };
})();

const locationList = (function() {

	let keywordType = "PARTNER";

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_eventInit();
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='locationList'][data-act]").off();
		evo.on("click", function(e) {
			_eventAction(e);
		});
	};
	
	// 이벤트 분기
	function _eventAction(e) {
		let evo = $(e.currentTarget);
		
		let action = evo.attr("data-act");
		
		let type = e.type;
		
		if(type == "click") {
			if(action == "clickKeywordList") {
				_event.clickKeywordList(evo);
			} else if (action == "clickDuplication") {
				_event.clickDuplication();
			} else if (action == "clickKeywordRegist") {
				_event.clickKeywordRegist();
			} else if (action == "clickKeywordTab") {
				_event.clickKeywordTab(evo);
			} else if (action == "clickKeywordDelete") {
				_event.clickKeywordDelete(evo);
			}
		};
	};
	
	// 이벤트
	let _event = {
		// 키워드 리스트
		clickKeywordList: function(evo) {
			$.ajax({
				url: "/mtl/api/admin/location/keyword/list", 
		        method: "POST",  // POST 방식
		        data: { "type" : keywordType },
		        success: function(resp) {
		        	_draw.drawKeywordList(resp.list);
		        },
			});
		},
	
		// 중복 확인 클릭
		clickDuplication: function() {
			$.ajax({
		        url: "/mtl/api/admin/location/keyword/duplication",  // 중복 확인을 위한 URL (Controller에서 매핑 필요)
		        method: "POST",  // POST 방식
		        data: {
		        	"type" : $("#keywordType option:selected").val(),
		            "keyword": $("#keyword").val() // 입력한 키워드
		        },
		        success: function(resp) {
		            if (resp >= 1) {  // 중복 키워드가 있을 경우
		            	modal.alert({
		            		"content" : "이미 사용 중인 키워드입니다."
		            	});
		            	$("#keywordRegistBtn").attr("data-check", "0");
		            } else {  // 중복이 없으면
		            	modal.alert({
		            		"content" : "사용 가능한 키워드입니다."
		            	});
		            	$("#keywordRegistBtn").attr("data-check", "1");
		            };
		        },
		        error: function() {
		        	modal.alert({
	            		"content" : "중복 확인에 실패하였습니다.<br>다시 시도해주세요."
	            	});
		        }
		    });	
		},
		
		// 키워드 등록
		clickKeywordRegist: function() {
			let keywordType = $("#keywordType option:selected").val();
			if (keywordType == '' || keywordType == null) {
				modal.alert({
					"content" : "입력되지 않은 값이 있습니다."
				});
				return;
			}
			
			let keyword = $("#keyword").val();
			if (keyword == '' || keyword == null) {
				modal.alert({
					"content" : "입력되지 않은 값이 있습니다."
				});
				return;
			}
		
			if ($("#keywordRegistBtn").attr("data-check") == "0") {
				modal.alert({
					"content" : "중복확인을 해주세요."
				});
				return;
			};
			
			modal.confirm({
				"content" : "키워드를 등록하시겠습니까?",
				"confirmCallback" : function() {
					$.ajax({
				        url: "/mtl/api/admin/location/keyword/regist",
				        method: "POST",  // POST 방식
				        data: {
				        	"type" : keywordType,
				            "keyword": keyword 
				        },
				        success: function(resp) {
				        	modal.alert({
			            		"content" : "정상적으로 등록되었습니다.",
			            		"confirmCallback" : function() {
			            			_event.clickKeywordList();
			            			$("#keywordRegisterModal").modal("hide");
			            		}
			            	});
				        },
				        error: function() {
				        	modal.alert({
			            		"content" : "등록에 실패하였습니다.<br>다시 시도해주세요."
			            	});
				        }
				    });	
				}	
			});
		},
		
		// 키워드 탭 클릭
		clickKeywordTab: function(evo) {
			keywordType = evo.attr("data-type");

			_event.clickKeywordList(evo);
		},
		
		// 키워드 삭제
		clickKeywordDelete: function(evo) {
			let keywordIdx = evo.attr("data-keyword-idx");
			let keywordType = evo.attr("data-keyword-type");
			
			modal.confirm({
				"content" : "키워드를 삭제하시겠습니까?",
				"confirmCallback" : function() {
					$.ajax({
				        url: "/mtl/api/admin/location/keyword/delete",
				        method: "POST",  
				        data: {
				            "keyword_idx": keywordIdx,
				            "type": keywordType,
				        },
				        success: function(resp) {
				        	modal.alert({
			            		"content" : "정상적으로 삭제되었습니다.",
			            		"confirmCallback" : function() {
			            			_event.clickKeywordList();
			            		}
			            	});
				        },
				        error: function() {
				        	modal.alert({
			            		"content" : "삭제에 실패하였습니다.<br>다시 시도해주세요."
			            	});
				        }
				    });	
				}	
			});
		},
	};
	
	// 그리기
	let _draw = {
		// 키워드 리스트 그리기
		drawKeywordList: function(list) {
			let keywordList = "";
			if (keywordType == "PARTNER") {
				keywordList = $("#keywordList1");
			} else {
				keywordList = $("#keywordList2");
			};
			keywordList.empty();
			
			for (let data of list) {
				let div = $("<div>").addClass("border-bottom text-center p-2");
				keywordList.append(div);
				
				let keyword = $("<strong>");
				keyword.append("<i class='fa-solid fa-hashtag'></i>");
				keyword.append(data.keyword);
				div.append(keyword);
				
				let deleteBtn = $("<a>").addClass("text-danger ms-2").append("<i class='fa-solid fa-xmark'></i>");
				deleteBtn.attr({
					"href" : "javascript:;",
					"data-src" : "locationList",
					"data-act" : "clickKeywordDelete",
					"data-keyword-idx" : data.keyword_idx,
					"data-keyword-type" : data.type
				});
				div.append(deleteBtn);
				
				_eventInit();
			};
		},
	};
	
	return {
		init,
	};
})();
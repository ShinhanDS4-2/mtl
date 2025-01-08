const review = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_event.getReviewList();
		_eventInit();
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='review'][data-act]").off();
		evo.on("click", function(e) {
			_eventAction(e);
		});
	};
	
	// 이벤트 분기
	function _eventAction(e) {
		let evo = $(e.currentTarget);
		
		let action = evo.attr("data-act");
		
		let type = e.type;
		
		if (type == "click") {
			if (action == "clickReplyRegist") {
				_event.clickReplyRegist(evo);
			} else if (action == "clickSearch") {
				_event.getReviewList();
			} else if (action == "clickHide") {
				_event.clickHide(evo);
			}
		};
	};
	
	// 이벤트
	let _event = {
		// 리뷰 리스트
		getReviewList: function(curPage = 1) {
			let url = "/partner/review/list";

			let data = {
				"reply_status" : $("input[name='replyStatus']:checked").val(),
				"score1" : Number($("#score1 option:selected").val()),
				"score2" : Number($("#score2 option:selected").val()),
				"score3" : Number($("#score3 option:selected").val()),
				"score4" : Number($("#score4 option:selected").val()),
			};

			// 페이징
			let pageOption = {
				limit: 5
			};
			
			let page = $("#pagination").customPaging(pageOption, function(_curPage){
				_list.getReviewList(_curPage);
			});
			
			let pageParam = page.getParam(curPage);
			
			if(pageParam) {
				data.offset = pageParam.offset;
				data.limit = pageParam.limit;
			};
			// 페이징 끝

			comm.sendJson(url, data, "POST", function(resp) {
				_draw.drawReviewList(resp.list);
				page.drawPage(resp.total);
				$("#total").html(resp.total);
			});
		},
		
		// 답변 등록
		clickReplyRegist: function(evo) {
			let reviewIdx = evo.attr("data-review-idx");
			
			let url = "/partner/review/reply/regist";
			
			let data = {
				"review_idx" : reviewIdx,
				"reply" : evo.siblings("textarea").val()
			};
			
			if (data.reply == null || data.reply == '') {
				modal.alert({ "content" : "답변을 작성해 주세요" });
				return;
			}
			
			modal.confirm({
				"content" : "답변을 등록하시겠습니까?",
				"confirmCallback" : function() {
					comm.sendJson(url, data, "POST", function(resp) {
						if (resp.result == true) {
							modal.alert({ 
								"content" : "정상적으로 등록되었습니다.",
								"confirmCallback" : function() {
									_event.getReviewList();
								}
							});
						} else {
							modal.alert({ "content" : "등록에 실패하였습니다.<br>다시 시도해 주세요." });
						}
					});
				}
			});
		},
		
		// 리뷰 숨기기
		clickHide: function(evo) {
			let reviewIdx = evo.attr("data-review-idx");
			
			let url = "/partner/review/reply/hide";
			
			let data = {
				"review_idx" : reviewIdx,
			};
			
			modal.confirm({
				"content" : "해당 후기를 숨기시겠습니까?<br>숨겨진 후기는 사용자 페이지에 노출되지 않습니다.",
				"confirmCallback" : function() {
					comm.sendJson(url, data, "POST", function(resp) {
						if (resp.result == true) {
							modal.alert({ 
								"content" : "숨김 처리가 완료되었습니다.",
								"confirmCallback" : function() {
									_event.getReviewList();
								}
							});
						} else {
							modal.alert({ "content" : "오류가 발생하였습니다.<br>다시 시도해 주세요." });
						}
					});
				}
			});
		}
  	};
	
	let _draw = {
		drawReviewList: function(list) {
			let reviewList = $("#reviewList").empty();

			for (let data of list) {
				let row = $("<div>").addClass("row g-3 g-lg-4");
				reviewList.append(row);
				
				// 사용자 정보
				{
					let userDiv = $("<div>").addClass("col-md-4 col-xxl-3");
					row.append(userDiv);
					
					let flex = $("<div>").addClass("d-flex align-items-center");
					userDiv.append(flex);
					
					let div = $("<div>").addClass("ms-2");
					flex.append(div);
					
					let userName = $("<h5>").addClass("mb-1").html(data.name);
					div.append(userName);

					let reviewDate = $("<p>").addClass("mb-0").html(data.review_date);
					div.append(reviewDate);
				}

				// 리뷰 정보
				{
					let reviewDiv = $("<div>").addClass("col-md-8 col-xxl-9");
					row.append(reviewDiv);

					let flex = $("<div>").addClass("d-flex");
					reviewDiv.append(flex);

					// 친절도
					{
						let span = $("<span>").addClass("small me-1").html("친절도");
						flex.append(span);

						let ul = $("<ul>").addClass("list-inline mb-2 me-3");
						flex.append(ul);

						let score = data.score_1;
						for (let i = 0; i < score; i++) {
							let li = $("<li>").addClass("list-inline-item me-1").append("<i class='fas fa-star text-warning'></i>");
							ul.append(li);
						};
						for (let i = 0; i < 5 - score; i++) {
							let li = $("<li>").addClass("list-inline-item me-1").append("<i class='far fa-star text-warning'></i>");
							ul.append(li);
						};
					}

					// 청결도
					{
						let span = $("<span>").addClass("small me-1").html("청결도");
						flex.append(span);

						let ul = $("<ul>").addClass("list-inline mb-2 me-3");
						flex.append(ul);

						let score = data.score_2;
						for (let i = 0; i < score; i++) {
							let li = $("<li>").addClass("list-inline-item me-1").append("<i class='fas fa-star text-warning'></i>");
							ul.append(li);
						};
						for (let i = 0; i < 5 - score; i++) {
							let li = $("<li>").addClass("list-inline-item me-1").append("<i class='far fa-star text-warning'></i>");
							ul.append(li);
						};
					}

					// 서비스
					{
						let span = $("<span>").addClass("small me-1").html("서비스");
						flex.append(span);

						let ul = $("<ul>").addClass("list-inline mb-2 me-3");
						flex.append(ul);

						let score = data.score_3;
						for (let i = 0; i < score; i++) {
							let li = $("<li>").addClass("list-inline-item me-1").append("<i class='fas fa-star text-warning'></i>");
							ul.append(li);
						};
						for (let i = 0; i < 5 - score; i++) {
							let li = $("<li>").addClass("list-inline-item me-1").append("<i class='far fa-star text-warning'></i>");
							ul.append(li);
						};
					}

					// 위치
					{
						let span = $("<span>").addClass("small me-1").html("위치");
						flex.append(span);

						let ul = $("<ul>").addClass("list-inline mb-2 me-3");
						flex.append(ul);

						let score = data.score_4;
						for (let i = 0; i < score; i++) {
							let li = $("<li>").addClass("list-inline-item me-1").append("<i class='fas fa-star text-warning'></i>");
							ul.append(li);
						};
						for (let i = 0; i < 5 - score; i++) {
							let li = $("<li>").addClass("list-inline-item me-1").append("<i class='far fa-star text-warning'></i>");
							ul.append(li);
						};
					}

					let flex2 = $("<div>").addClass("d-flex");
					reviewDiv.append(flex2);

					let room = $("<h6>").addClass("me-3").html(data.room_type);
					flex2.append(room);

					let checkDate = $("<small>").html(data.check_in_date + " ~ " + data.check_out_date);
					flex2.append(checkDate);
					
					// 후기 이미지
					if (data.imageList.length > 0) {
						let imageDiv = $("<div>").addClass("d-flex align-items-center");
						reviewDiv.append(imageDiv);

						for (let image of data.imageList) {
							let div = $("<div>").addClass("w-80px h-60px me-2");
							imageDiv.append(div);

							let img = $("<img>").addClass("rounded w-100 h-100").attr("src", image.url);
							div.append(img);
						};
					};
					
					// 리뷰 내용
					let reviewContent = $("<p>").addClass("space mt-3 mb-4").html(data.content);
					reviewDiv.append(reviewContent);
					

					// 버튼
					let btnFlex = $("<div>").addClass("d-flex justify-content-between align-items-center");
					reviewDiv.append(btnFlex);

					let btnDiv = $("<div>");
					btnFlex.append(btnDiv);

					let replyBtn = $("<a>").addClass("btn btn-sm btn-light mb-0").attr({
						"data-bs-toggle" : "collapse",
						"href" : "#reviewReply" + data.review_idx,
						"role" : "button",
						"aria-expanded" : "false",
						"aria-controls" : "collapseComment"
					}).html("답변");
					btnDiv.append(replyBtn);

					let hideBtn = $("<a>").addClass("text-primary-hover me-3").attr({
						"href" : "javascript:;",
						"data-review-idx" : data.review_idx
					});
					if (data.status == 'Y') {
						hideBtn.append("<i class='bi bi-trash3 me-1'></i>숨기기");
						hideBtn.attr({
							"data-src" : "review",
							"data-act" : "clickHide",
						});
					} else {
						hideBtn.append("<i class='bi bi-trash3 me-1'></i>숨겨진 후기입니다.");
					};
					btnFlex.append(hideBtn);

					// 답변창
					let collapseDiv = $("<div>").addClass("collapse").attr("id", "reviewReply" + data.review_idx);
					reviewDiv.append(collapseDiv);

					let replyFlex = $("<div>").addClass("d-flex mt-3");
					collapseDiv.append(replyFlex);

					let replyContent = $("<textarea>").addClass("form-control mb-0").attr({
						"placeholder" : "답변을 달아주세요.",
						"rows" : "2",
						"spellcheck" : "false"
					});
					replyFlex.append(replyContent);

					if (data.reply != null) {
						replyContent.val(data.reply).attr("readonly", true);
					} else {
						// 등록 버튼
						let registBtn = $("<button>").addClass("btn btn-sm btn-primary-soft ms-2 px-4 mb-0 flex-shrink-0").html("등록");
						registBtn.attr({
							"data-src" : "review",
							"data-act" : "clickReplyRegist",
							"data-review-idx" : data.review_idx
						});
						replyFlex.append(registBtn);
					};
				}

				let hr = $("<hr>").addClass("m-0");
				reviewList.append(hr);
			};
			
			_eventInit();
		},
	};
	
	return {
		init,
	};
})();
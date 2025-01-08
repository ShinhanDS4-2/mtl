const review = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_event.setReview();
		_menuActive();
	};

	// 이벤트
	let _event = {
		// 리뷰 리스트
		setReview: function(curPage = 1) {
			let url = "/user/review/my/list";
			
			let data = {};
			
			// 페이징
			let pageOption = {
				limit: 5
			};
			
			let page = $("#pagination").customPaging(pageOption, function(_curPage){
				_event.setReview(_curPage);
			});
			
			let pageParam = page.getParam(curPage);
			
			if(pageParam) {
				data.offset = pageParam.offset;
				data.limit = pageParam.limit;
			};
			// 페이징 끝

			comm.sendJson(url, data, "POST", function(resp) {
				_draw.drawReview(resp.list);
				page.drawPage(resp.total);
			});
		},
	};

	let _draw = {
		drawReview: function(list) {
			let reviewList = $("#reviewList").empty();

			for (let data of list) {
				let row = $("<div>").addClass("row");
				reviewList.append(row);

				{
					let partnerCol = $("<div>").addClass("col-md-4 col-xxl-3");
					row.append(partnerCol);
					
					let divFlex = $("<div>").addClass("d-flex align-items-center");
					partnerCol.append(divFlex);
					
					let ms = $("<div>").addClass("ms-2");
					divFlex.append(ms);
					
					let name = $("<h5>").addClass("mb-1").html(data.name);
					ms.append(name);

					let date = $("<p>").addClass("mb-0 small").html(data.check_in_date + " ~ " + data.check_out_date);
					ms.append(date);
				} 
				{
					let contentCol = $("<div>").addClass("col-md-8 col-xxl-9");
					row.append(contentCol);

					{
						let flexDiv = $("<div>").addClass("d-flex justify-content-between align-items-center");
						contentCol.append(flexDiv);

						// 친절도
						{
							let div = $("<div>").addClass("me-4");
							flexDiv.append(div);

							let span = $("<span>").html("친절도");
							div.append(span);

							let ul = $("<ul>").addClass("list-inline mb-2");
							div.append(ul);

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
							let div = $("<div>").addClass("me-4");
							flexDiv.append(div);

							let span = $("<span>").html("청결도");
							div.append(span);

							let ul = $("<ul>").addClass("list-inline mb-2");
							div.append(ul);

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
							let div = $("<div>").addClass("me-4");
							flexDiv.append(div);

							let span = $("<span>").html("서비스");
							div.append(span);

							let ul = $("<ul>").addClass("list-inline mb-2");
							div.append(ul);

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
							let div = $("<div>").addClass("me-4");
							flexDiv.append(div);

							let span = $("<span>").html("위치");
							div.append(span);

							let ul = $("<ul>").addClass("list-inline mb-2");
							div.append(ul);

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
					}

					// 후기 내용
					{
						let content = $("<p>").addClass("space mt-2").html(data.content);
						contentCol.append(content);
					}

					// 후기 이미지
					if (data.imageList.length > 0) {
						let imageDiv = $("<div>").addClass("d-flex align-items-center");
						contentCol.append(imageDiv);

						for (let image of data.imageList) {
							let div = $("<div>").addClass("w-80px h-60px me-2");
							imageDiv.append(div);

							let img = $("<img>").addClass("rounded w-100 h-100").attr("src", image.url);
							div.append(img);
						};
					};

					// 답변
					if (data.reply != null) {
						let replyDiv = $("<div>").addClass("d-flex mt-4 speech-balloon");
						contentCol.append(replyDiv);

						let reply = $("<p>").addClass("space").html(data.reply);
						replyDiv.append(reply);
					}
				}

				let hr = $("<hr>").addClass("m-0 mt-4 mb-4");
				reviewList.append(hr);
			}
		},
	}
	
	// 메뉴 active
	function _menuActive() {
		$("#menuReview").addClass("active");
	};
	
	return {
		init,
	};
})();
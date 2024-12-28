const partnerList = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_eventInit();
		_randomBanner();
		_list.getPartnerList();
		_list.getOptionList();
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='partnerList'][data-act]").off();
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
			if (action == "clickPartner") {
				_event.clickPartner(evo);
			} else if (action == " clickSearchBtn") {
				_list.getPartnerList();
			}
		};
	};
	
	// 이벤트
	let _event = {
		clickPartner: function(evo) {
			let partnerIdx = evo.attr("data-partner-idx");
			location.href = "/mtl/partner/detail?idx=" + partnerIdx;
		},
	};
	
	// 리스트
	let _list = {
		// 숙소 리스트
		getPartnerList: function(curPage = 1) {
			let url = "/user/partner/search/list";

			let data = {};

			// 검색 파라미터
			_setSearchParam(data);
			
			// 페이징
			let pageOption = {
				limit: 5
			};
			
			let page = $("#pagination").customPaging(pageOption, function(_curPage){
				_list.getPartnerList(_curPage);
			});
			
			let pageParam = page.getParam(curPage);
			
			if(pageParam) {
				data.offset = pageParam.offset;
				data.limit = pageParam.limit;
			};
			// 페이징 끝
			
			comm.send(url, data, "POST", function(resp) {
				console.log(resp);
				
				_draw.drawPartner(resp.list);
				page.drawPage(resp.totalCnt);
				_eventInit();
				e.tinySlider();
			});
		},
		
		// 옵션
		getOptionList: function() {
			let url = "/common/keyword/list";
			
			let data = { "type" : "PARTNER" };
			
			comm.send(url, data, "POST", function(resp) {
				_draw.drawKeyword(resp.list);
				_eventInit();
			});
		},
	};

	// 리스트 요소 그리기
	let _draw = {
		// 숙소 리스트
		drawPartner: function(list) {
			let partnerList = $("#partnerList").empty();

			for (let data of list) {
				let card = $("<div>").addClass("card shadow p-2");
				partnerList.append(card);

				let row = $("<div>").addClass("row g-0");
				card.append(row);

				let imgCard = $("<div>").addClass("col-md-5 position-relative");
				row.append(imgCard);
				
				// 이미지 단일 / 다중
				let imageList = data.imageList;
				if (imageList.length <= 1) {
					let img = $("<img>").addClass("card-img rounded-2 h-250px").attr({
						"src" : imageList[0].url 
					});
					imgCard.append(img);
				} else {
					let slider = $("<div>").addClass("tiny-slider arrow-round arrow-xs arrow-dark overflow-hidden rounded-2 card-z-top");
					imgCard.append(slider);

					let tiny = $("<div>").addClass("tiny-slider-inner").attr({
						 "data-autoplay" : "false",
						 "data-arrow" : "true",
						 "data-dots" : "false",
						 "data-items" : "1"
					});
					slider.append(tiny);

					for (image of imageList) {
						let imgDiv = $("<div>");
						tiny.append(imgDiv);

						let img = $("<img>").addClass("card-img rounded-2 h-250px").attr("src", image.url);
						imgDiv.append(img);
					};
				};

				let contentCard = $("<div>").addClass("col-md-7 partner-card").attr({
					"data-src" : "partnerList",
					"data-act" : "clickPartner",
					"data-partner-idx" : data.partner_idx
				});
				row.append(contentCard);

				let cardBody = $("<div>").addClass("card-body py-md-2 d-flex flex-column h-100 position-relative");
				contentCard.append(cardBody);

				let ratingDiv = $("<div>").addClass("d-flex justify-content-between align-items-center");
				cardBody.append(ratingDiv);

				let ratingUl = $("<ul>").addClass("list-inline mb-0");
				ratingDiv.append(ratingUl);

				// 별점 개수 계산
				const full = 5;
				let score = Math.round(data.score);
				let scoreRemain = full - score;
				for (let i = 0; i < score; i++) {
					let ratingLi = $("<li>").addClass("list-inline-item me-1 small");
					ratingLi.html("<i class='fa-solid fa-star text-warning'></i>");
					ratingUl.append(ratingLi);
				};
				if (scoreRemain != 0) {
					for (let i = 0; i < scoreRemain; i++) {
						let ratingLi = $("<li>").addClass("list-inline-item me-1 small");
						ratingLi.html("<i class='fa-regular fa-star text-warning'></i>");
						ratingUl.append(ratingLi);
					};
				};

				// 숙소 타입
				let type = data.type;
				let typeText = type == "HOTEL" ? "호텔" :
				               type == "MOTEL" ? "모텔" :
				               type == "GUESTHOUSE" ? "게스트하우스" :
				               type == "PENSION" ? "펜션" :
				               type == "GLAMPING" ? "글램핑" : "";
				let badge = $("<span>").addClass("badge bg-primary bg-opacity-10 text-primary");
				badge.html(typeText);
				ratingDiv.append(badge);

				let title = $("<h5>").addClass("card-title mt-2 mb-1").html(data.name);
				cardBody.append(title);

				let address = $("<small>").append("<i class='bi bi-geo-alt me-2'></i>");
				address.append(data.address);
				cardBody.append(address);
				
				// 시설
				let facilities = data.facilitiesList;
				let facilitiesUl = $("<ul>").addClass("nav nav-divider mt-3");
				cardBody.append(facilitiesUl);
				for (let i = 0; i < 4; i++) {
					if (facilities[i] != null) {
						let li = $("<li>").addClass("nav-item").html(facilities.name);
						facilitiesUl.append(li);
					};
				};
				
				// 가격
				let priceDiv = $("<div>").addClass("d-sm-flex justify-content-sm-end align-items-center mt-3 mt-md-auto");
				cardBody.append(priceDiv);

				let price = $("<div>").addClass("d-flex align-items-center");
				priceDiv.append(price);

				let priceNum = $("<h5>").addClass("fw-bold mb-0 me-1");
				priceNum.append("<i class='fa-solid fa-won-sign'></i> ");
				priceNum.append(data.price);
				price.append(priceNum);
				price.append("<span class='mb-0 me-2'> / 일</span>");
			};
		},
		
		// 키워드 그리기
		drawKeyword: function(list) {
			let keywordList = $("#keywordList").empty();

			for (let i = 0; i < list.length; i++) {
				let data = list[i];

				let li = $("<li>").addClass("list-inline-item mb-0 me-1");
				keywordList.append(li);

				let input = $("<input>").addClass("btn-check").attr({
					"type" : "checkbox",
					"id" : "keyword" + i
				});
				li.append(input);

				let label = $("<label>").addClass("btn btn-xm btn-light btn-success-soft-check").attr({
					"for" : "keyword" + i
				});
				label.append("<i class='fa-solid fa-hashtag'></i> ");
				label.append(data.keyword);
				li.append(label);
			};
		},
	};
	
	// 검색 파라미터 설정
	function _setSearchParam(data) {
		// 날짜 문자열 분리
		let [startDate, endDate] = $("#searchDate").val().split(" ~ ").map(date => date.trim());
			
		// 인원 문자열 분리
		let guest = $("#searchGuest").val().match(/\d+/)[0];
		
		// data 객체 안에 값 설정
		data.startData = startDate;
		data.endData = endDate;
		data.guest = guest;
		data.area = $("#searchArea option:selected").val();
	};
	
	// 배너 랜덤으로 변경
	function _randomBanner() {
		let num = Math.floor(Math.random() * 7) + 1;
		$("#banner").css("background-image","url(assets/images/banner/" + num +".jpg)");
	};

	return {
		init,
	};
})();
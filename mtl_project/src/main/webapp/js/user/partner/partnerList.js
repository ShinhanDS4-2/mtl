const partnerList = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_eventInit();
		_sliderInit();
		_randomBanner();
		_list.getPartnerList();
		_list.getOptionList();
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='partnerList'][data-act]").off();
		evo.on("click change update", function(e) {
			_eventAction(e);
		});
	};
	
	// noUiSlider 설정
	function _sliderInit() {
		const slider = document.getElementById("noSlider");

		noUiSlider.create(slider, {
		    start: [50000, 500000],
		    connect: true,
		    step: 50000,
		    range: {
				min: 0,
                max: 2000000
            },
            format: wNumb({
			    decimals: 0,
			    thousand: ",",
			    suffix: "원"
			})
		});
	
		let rangeText = slider.previousElementSibling;
        let imin = rangeText.firstElementChild;
        let imax = rangeText.lastElementChild;
        let inputs = [imin, imax];
	
		slider.noUiSlider.on("update", function(values, handle) {
            inputs[handle].value = values[handle];
        });
        
        slider.noUiSlider.on("change", function () {
	        _list.getPartnerList();
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
			} else if (action == "clickSearchBtn") {
				_list.getPartnerList();
			}
		} else if (type == "change") {
			if (action == "changeAllCheck") {
				_event.changeAllCheck(evo);
				_list.getPartnerList();
			} else if (action == "changeType") {
				_event.changeType(evo);
				_list.getPartnerList();
			} else if (action == "changeOption") {
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
		
		// 전체 체크
		changeAllCheck: function(evo) {
			let isCheck = $(evo).is(":checked");
			if (isCheck) {
		        $("#partnerTypeOption .form-check-input").prop("checked", true);
			} else {
		        $("#partnerTypeOption .form-check-input").prop("checked", false);
			};
		},
		
		// 숙소 타입 개별 체크 해제 시 ALL 체크 해제
		changeType: function(evo) {
			let isCheck = $(evo).is(":checked");
			if (!isCheck) {
				$("#hotelType1").prop("checked", false);
			};
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
			
			comm.sendJson(url, data, "POST", function(resp) {
				_draw.drawPartner(resp.list);
				page.drawPage(resp.totalCnt);
				_eventInit();
				e.tinySlider();
			});
		},
		
		// 옵션
		getOptionList: function() {
			_list.getKeywordList();
			_list.getFacilitiesList("COMMON");
			_list.getFacilitiesList("ROOM");
			_eventInit();
		},
		
		// 키워드
		getKeywordList: function() {
			let url = "/common/keyword/list";
			
			let data = { "type" : "PARTNER" };
			
			comm.sendJson(url, data, "POST", function(resp) {
				_draw.drawKeyword(resp.list);
			});
		},
		
		// 시설
		getFacilitiesList: function(type) {
			let url = "/common/facilities/list";
			
			let data = { "type" : type };
			
			comm.sendJson(url, data, "POST", function(resp) {
				_draw.drawFacilities(resp.list, type);
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

				// 별점
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

				// 숙소명
				let title = $("<h5>").addClass("card-title mt-2 mb-1").html(data.name);
				cardBody.append(title);

				// 주소
				let address = $("<small>").append("<i class='bi bi-geo-alt me-2'></i>");
				address.append(data.address);
				cardBody.append(address);
				
				// 시설
				let facilities = data.facilitiesList;
				let facilitiesUl = $("<ul>").addClass("nav nav-divider mt-3");
				cardBody.append(facilitiesUl);
				for (let i = 0; i < 4; i++) {
					if (facilities[i] != null) {
						let item = facilities[i];
						let li = $("<li>").addClass("nav-item").html(item.name);
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

			for (let data of list) {
				let li = $("<li>").addClass("list-inline-item mb-0 me-1");
				keywordList.append(li);

				let input = $("<input>").addClass("btn-check").attr({
					"type" : "checkbox",
					"id" : "keyword" + data.keyword_idx,
					"value" : data.keyword_idx,
					"data-src" : "partnerList",
					"data-act" : "changeOption"
				});
				li.append(input);

				let label = $("<label>").addClass("btn btn-xm btn-light btn-success-soft-check").attr({
					"for" : "keyword" + data.keyword_idx
				});
				label.append("<i class='fa-solid fa-hashtag'></i> ");
				label.append(data.keyword);
				li.append(label);
			};
		},
		
		// 시설 그리기
		drawFacilities: function (list, type) {
			let listUl = "";
			let listPlusUl = "";
			
			if (type == "COMMON") {
				listUl = $("#commonList1");
				listPlusUl = $("#commonList2");
			} else if (type == "ROOM") {
				listUl = $("#roomList1");
				listPlusUl = $("#roomList2");
			};
			
			// 기본 5개
			for (let i = 0; i < 5; i++) {
				let data = list[i];
				
				let li = $("<li>").addClass("list-inline-item mb-0 me-1");
				listUl.append(li);

				let input = $("<input>").addClass("btn-check").attr({
					"type" : "checkbox",
					"id" : "facilities" + data.facilities_idx,
					"value" : data.facilities_idx,
					"data-src" : "partnerList",
					"data-act" : "changeOption"
				});
				li.append(input);

				let label = $("<label>").addClass("btn btn-xm btn-light btn-success-soft-check").attr({
					"for" : "facilities" + data.facilities_idx
				});
				label.append(data.name);
				li.append(label);
			};
			
			// 더보기
			for (let i = 5; i < list.length; i++) {
				let data = list[i];
				
				let li = $("<li>").addClass("list-inline-item mb-0 me-1");
				listPlusUl.append(li);

				let input = $("<input>").addClass("btn-check").attr({
					"type" : "checkbox",
					"id" : "facilities" + data.facilities_idx,
					"value" : data.facilities_idx,
					"data-src" : "partnerList",
					"data-act" : "changeOption"
				});
				li.append(input);

				let label = $("<label>").addClass("btn btn-xm btn-light btn-success-soft-check").attr({
					"for" : "facilities" + data.facilities_idx
				});
				label.append(data.name);
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
		
		// 숙소 유형
		let partnerTypeList = $("#partnerTypeOption .form-check-input:checked").map(function () {
	        return $(this).val();
	    }).get();
		
		// 키워드
		let keywordList = $("#keywordList .btn-check:checked").map(function () {
	        return $(this).val();
	    }).get();
		
		// 공용 시설
		let facilitiesList = $(".commonList .btn-check:checked").map(function () {
	        return $(this).val();
	    }).get();
	    
		/* TODO */
	    // 객실 시설
	    
	    //  가격
		let minPrice = $("#minPrice").val();
		let maxPrice = $("#maxPrice").val();
		
		// data 객체 안에 값 설정
		data.start_data = startDate;
		data.end_data = endDate;
		data.guest = guest;
		data.area = $("#searchArea option:selected").val();
		data.partner_type_list = partnerTypeList;
		data.keyword_list = keywordList;
		data.facilities_list = facilitiesList;
		data.min_price = minPrice.replace("원", "").replaceAll(",", "");
		data.max_price = maxPrice.replace("원", "").replaceAll(",", "");
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
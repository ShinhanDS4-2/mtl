const home = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_eventInit();
		_randomBanner();
		_event.getAccomodationList();
		_sessionReset();
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='home'][data-act]").off();
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
			if (action == "clickSearch") {
				_event.clickSearch();
			} else if (action == "clickPartnerDetail") {
				_event.clickPartnerDetail(evo);
			};
		};
	};
	
	// 이벤트
	let _event = {
		// 인기 숙소 리스트
		getAccomodationList: function() {
			let url = "/user/partner/best/list";
			
			let data = {
				limit: 4,
				offset: 0
			};
			
			comm.sendJson(url, data, "POST", function(resp) {
				let list = resp.list;
				
				let listObject = $("#accomodationList").empty();
				for (let data of list) {
					let div = $("<div>").addClass("col-sm-6 col-xl-3");
					listObject.append(div);

					let cardLink = $("<a>").attr({
						"href" : "javascript:;",					
						"data-src" : "home",
						"data-act" : "clickPartnerDetail",
						"data-partner-idx" : data.partner_idx,
					});
					div.append(cardLink);

					let card = $("<div>").addClass("card card-img-scale overflow-hidden bg-transparent");
					cardLink.append(card);
					
					{
						let cardImg = $("<div>").addClass("card-img-scale-wrapper rounded-3");
						card.append(cardImg);

						let img = $("<img>").addClass("card-img h-180px").attr("src", data.image.url);
						cardImg.append(img);

						let cardOberlay = $("<div>").addClass("card-img-overlay d-flex flex-column z-index-1 p-4");
						card.append(cardOberlay);

						let divFlex = $("<div>").addClass("d-flex justify-content-end");
						cardOberlay.append(divFlex);

						let span = $("<span>").addClass("badge text-bg-white");
						span.append("<i class='fa-solid fa-star text-warning me-2'></i>");
						span.append(data.score);
						divFlex.append(span);
					}
					{
						let cardBody = $("<div>").addClass("card-body px-2");
						card.append(cardBody);

						let span = $("<span>").addClass("badge text-bg-light mb-2");
						let accomodationType = data.type;
						let typeText = "";
						if (accomodationType == "HOTEL") {
							typeText = "호텔";
						} else if (accomodationType == "MOTEL") {
							typeText = "모텔";
						} else if (accomodationType == "GUESTHOUSE") {
							typeText = "게스트하우스";
						} else if (accomodationType == "PENSION") {
							typeText = "펜션";
						} else if (accomodationType == "GLAMPING") {
							typeText = "글램핑";
						};
						span.html(typeText);

						let title = $("<h5>").addClass("card-title");
						cardBody.append(title);

						let titleLink = $("<a>").addClass("stretched-link text-truncate");
						titleLink.attr("src", "javascript:;").html(data.name);
						title.append(titleLink);

						let area = $("<div>").addClass("hstack gap-2");
						cardBody.append(area);

						let areaSpan = $("<span>").addClass("h5 mb-0 text-primary");
						areaSpan.append("<i class='fa-solid fa-location-dot'></i> ");
						areaSpan.append(data.area);
						cardBody.append(areaSpan);
					}

					_eventInit();
				}
			});
		},
		
		// 검색
		clickSearch: function() {
			// 지역
			let area = $("#searchArea option:selected").val();

			// 날짜 문자열 분리
			let [startDate, endDate] = $("#searchDate").val().split(" ~ ").map(date => date.trim());
				
			// 인원 문자열 분리
			let guest = $("#searchGuest").val().match(/\d+/)[0];

			// 검색 조건을 넘기기 위해 클라이언트 세션에 저장			
			sessionStorage.setItem("search_area", area);
			sessionStorage.setItem("search_start_date", startDate);
			sessionStorage.setItem("search_end_date", endDate);
			sessionStorage.setItem("search_guest", guest);
			
			location.href = "/mtl/partner/list";
		},
		
		// 인기 숙소 클릭
		clickPartnerDetail: function(evo) {
			location.href = "/mtl/partner/detail?idx=" + evo.attr("data-partner-idx");
		},
	};
	
	// 배너 랜덤으로 변경
	function _randomBanner() {
		let num = Math.floor(Math.random() * 7) + 1;
		$("#banner").css("background-image","url(assets/images/banner/" + num +".jpg)");
	};
	
	// 세션 초기화
	function _sessionReset() {
		sessionStorage.clear();
	};

	return {
		init,
	};
})();
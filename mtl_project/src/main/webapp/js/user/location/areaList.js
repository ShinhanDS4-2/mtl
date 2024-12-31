const areaList = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		fetchLocationList();  // 페이지 로드 시 Location 여행지 리스트를 가져옴
		_eventInit(); 
		// _event.fetchLocationList();
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='areaList'][data-act]").off();
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
			} else if (action == "clickLocation") {
				_event.clickLocation(evo);
			} 
		};
	};
	 
	// 이벤트 
	let _event = {
		// 숙소 상세 페이지로 이동
		clickPartner: function(evo) {
			let partnerIdx = evo.attr("data-partner-idx");
			location.href = "/mtl/partner/detail?idx=" + partnerIdx;
		},
		
		// 여행지 상세 페이지로 이동
		clickLocation: function(evo) {
			let locationIdx = evo.attr("data-location-idx");
			location.href = "/mtl/location/detail?location_idx=" + locationIdx;
		},
	};


	// fetchLocationList();  페이지 로드 시 Location 여행지 리스트를 가져오는 함수 작성
	// 리스트
	function fetchLocationList() { 
		$.ajax({
			type: "POST", 
			url: "/mtl/api/user/location/list",   // API 호출
			data:{ area: "SEOUL", type: "R" },   // 호출 시 param값으로 넘겨줄 것 type: "R" or "A"
			success: function(response) {   //  API 호출 결과 값이 response 에 들어있음	
				console.log(response);  //  성공적으로 응답받은 데이터 로그
				_draw.drawLocationList(response);
				_eventInit();  // html이 전부 그려진 후 호출되어야 작동함.
			},
			error: function(xhr, status, error) {
				console.error("Error fetching Location Detail:", error);  // 오류 처리
			}
		});  
	}
		
	  
	let _draw = {  
		drawLocationList: function(list) {  // fetchLocationList() 함수에서 API 호출 결과 값으로 받은 response값을 list라는 이름의 매개변수로 넘겨준다. 
			
			let tap2 = $("#tab-3-2");   // 관광지 탭
			tap.empty(); // 기존 내용을 비워줌
 
			for(data of list.LocationList) { 
				// 관광지 탭
				let tap2 = $("<div>").addClass("tab-pane show active").attr("id", "tab-3-2");
				 
				let row = $("<div>").addClass("row g-4");
				tap2.append(row);

				// Card item START
				let col = $("<div>").addClass("col-md-3");
				row.append(col);
  
				let card = $("<div>").addClass("card shadow p-2 pb-0 h-350px area-icon");
				card.attr({
                    "data-src" : "areaList",
                    "data-act" : "clickLocation"
                });
				col.append(card);

                let img = $("<img>").addClass("rounded-2 area-image");
                img.attr({
                    "src" : data.image.url,
					"alt" : "Card image"
                });
                card.append(img);

				// Card body
				let cardBody = $("<div>").addClass("card-body px-3 pb-0");
				card.append(cardBody);
 
				let str = "<h5 class='card-title mb-0'><a href='javascript:;'>" + data.name + "</a></h5><small><i class='fa-solid fa-location-dot'></i>" + data.address_si + data.address_dong + "</small>"
				cardBody.append(str);

				// Card footer
				let cardFooter = $("<div>").addClass("card-footer pt-1");
				card.append(cardFooter);
 
				
				let keyword = "<span class='badge bg-primary bg-opacity-10 text-primary mb-1'><i class='fa-solid fa-hashtag'></i>" + data.keyword +"</span>"; 
				cardFooter.append(keyword);
 

				// 맛집 탭
			}
		}		
	};


	
	return {
		init,
	};
})();
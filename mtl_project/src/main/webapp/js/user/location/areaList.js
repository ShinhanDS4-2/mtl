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
	function fetchLocationList(curPage=1) {  //  _curPage=1 : 처음 화면 접속 시 1페이지부터 시작
		
		let param = { // ajax로 넘겨줄 data값 변수 선언
			"area" : "SEOUL", 
			"type" : "R"
		};

		// 페이징
		let pageOption = {
			limit: 8  // 한페이지에 몇개의 data item을 띄울지 설정  => 얘는 쿼리로 넘겨줄 정보
		};
		
		// 사용자가 $("#pagination") 부분 요소(페이지 번호)를 클릭하면 customPaging 콜백함수 호출하는 부분
		let page = $("#pagination").customPaging(pageOption, function(_curPage){  // customPaging은 사용자 정의함수로 페이징 로직을 생성한다. 
												// ㄴ pageOption객체를 넘겨 한 페이지에 표시할 데이터 수(limit)를 전달.
												// _curPage: 현재 사용자가 보고 있는 페이지 번호.

			fetchLocationList(_curPage);  // 현재 페이지 번호를 전달받아 해당 페이지에 표시할 데이터를 가져오는 함수.
		});
		
		let pageParam = page.getParam(curPage);  // 현재 페이지 번호(curPage)를 기준으로 페이징에 필요한 정보(예: offset, limit)를 반환.
		
		if(pageParam) {  // 위 코드에서 받은 pageParam값을 ajax에 넘겨줄 데이터에 설정하는 부분
			param.offset = pageParam.offset;
			param.limit = pageParam.limit;
		};
		// 페이징 끝
		
		$.ajax({
			type: "POST", 
			url: "/mtl/api/user/location/list",   // API 호출
			data: param,   // 호출 시 param값으로 넘겨줄 것 type: "R" or "A"
			success: function(response) {   //  API 호출 결과 값이 response 에 들어있음	
				_draw.drawLocationList(response.LocationList);
				page.drawPage(response.LocationListCount);
				_eventInit();  // html이 전부 그려진 후 호출되어야 작동함.
			},
			error: function(xhr, status, error) {
				console.error("Error fetching Location Detail:", error);  // 오류 처리
			}
		});  
	}
		
	  
	let _draw = {  
		drawLocationList: function(list) {  // fetchLocationList() 함수에서 API 호출 결과 값으로 받은 response값을 list라는 이름의 매개변수로 넘겨준다. 
		// 관광지 탭	
			let tab1 = $("#tab1");  
			tab1.empty(); // 기존 내용을 비워줌
 			 
			let row = $("<div>").addClass("row g-4");
			tab1.append(row);
			for(data of list) { 

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
                    "src" : data.image.url, // 여기서 data.image가 null 또는 undefined일 경우, 에러 발생시켜서 반복문이 중간에 중단되어버림
					"alt" : "Card image"
                });
                card.append(img);

				// Card body
				let cardBodyStr =
					`<div class="card-body px-3 pb-0">
						<h5 class="card-title mb-0"><a href="javascript:;">${data.name}</a></h5>
						<small><i class="fa-solid fa-location-dot"></i> ${data.address_si} ${data.address_dong}</small>
					</div>`;
				card.append(cardBodyStr);

				// Card footer
				let cardFooter = $("<div>").addClass("card-footer pt-1");
				card.append(cardFooter);

				// 키워드
				if(data.keyword && data.keyword.length > 0){  // 키워드가 있는지 확인하고, 키워드 문자열 길이가 1이상인지 확인된 경우에만 실행되도록 함
					for(keywordData of data.keyword){  // data.keyword 값이 없는 경우 에러로 코드가 중간에 중단되어버림. 뒤에 반복 실행 불가 => 키워드가 널인지 확인하는 로직을 추가해줘야함 
						console.log("keywordData값은? "); 
						console.log(keywordData);   // 키워드 리스트에서 1행만 뽑아줌
	
						console.log("keywordData.keyword값은? "); 
						console.log(keywordData.keyword);   // 가족여행
	
						let keywordStr = `<span class="badge bg-primary bg-opacity-10 text-primary mb-1 me-1">
												<i class="fa-solid fa-hashtag"></i>${keywordData.keyword}</span>`;
	
						cardFooter.append(keywordStr);
					}
				} else {
					console.warn("키워드가 없습니다:", data);
				}
			}

		// 맛집 탭		
			let tab2 = $("#tab2");  
			tab2.empty(); // 기존 내용을 비워줌
 			 
			let row2 = $("<div>").addClass("row g-4");
			tab2.append(row2);
			for(data of list) { 

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
                    "src" : data.image.url, // 여기서 data.image가 null 또는 undefined일 경우, 에러 발생시켜서 반복문이 중간에 중단되어버림
					"alt" : "Card image"
                });
                card.append(img);

				// Card body
				let cardBodyStr =
					`<div class="card-body px-3 pb-0">
						<h5 class="card-title mb-0"><a href="javascript:;">${data.name}</a></h5>
						<small><i class="fa-solid fa-location-dot"></i> ${data.address_si} ${data.address_dong}</small>
					</div>`;
				card.append(cardBodyStr);

				// Card footer
				let cardFooter = $("<div>").addClass("card-footer pt-1");
				card.append(cardFooter);

				// 키워드
				if(data.keyword && data.keyword.length > 0){  // 키워드가 있는지 확인하고, 키워드 문자열 길이가 1이상인지 확인된 경우에만 실행되도록 함
					for(keywordData of data.keyword){  // data.keyword 값이 없는 경우 에러로 코드가 중간에 중단되어버림. 뒤에 반복 실행 불가 => 키워드가 널인지 확인하는 로직을 추가해줘야함 
						console.log("keywordData값은? "); 
						console.log(keywordData);   // 키워드 리스트에서 1행만 뽑아줌
	
						console.log("keywordData.keyword값은? "); 
						console.log(keywordData.keyword);   // 가족여행
	
						let keywordStr = `<span class="badge bg-primary bg-opacity-10 text-primary mb-1 me-1">
												<i class="fa-solid fa-hashtag"></i>${keywordData.keyword}</span>`;
	
						cardFooter.append(keywordStr);
					}
				} else {
					console.warn("키워드가 없습니다:", data);
				}
			}
		}		
	};

	return {
		init,
	};
})();
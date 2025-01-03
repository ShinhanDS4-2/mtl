const locationDetail = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init(idx) {
		fetchLocationDetail(idx);  // 페이지 로드 시 Location 여행지 상세정보를 가져옴
		_eventInit();
	};   

	// 이벤트 초기화  -  (전부 동일 수정할 필요X)
	function _eventInit() { 
		let evo = $("[data-src='locationDetail'][data-act]").off();
		evo.on("click", function(e) {
			_eventAction(e);
		});     
	}; 
	 
	// 이벤트 분기  --  버튼 클릭이 있으면 수정 필요
	function _eventAction(e) {
		let evo = $(e.currentTarget); 
		  
		let action = evo.attr("data-act");
		   
		let type = e.type; 
		
		if(type == "click") {
			if(action == "") {
			
			};
		};
	}; 
	
	// 이벤트
	let _event = {
	  // 버튼 클릭이 있으면 수정 필요
	};
	
	
	// fetchLocationDetail();  // 페이지 로드 시 Location 여행지 상세정보를 가져오는 함수 작성
	function fetchLocationDetail(idx){
		$.ajax({
			type: "POST", 
			url: "/mtl/api/user/location/detail",   // API 호출
			data: {location_idx : idx},   // 호출 시 param값으로 넘겨줄 것
			success: function(response) {   //  API 호출 결과 값이 response 에 들어있음
				console.log(response);  //  성공적으로 응답받은 데이터 로그
				_draw.drawLocationDetail(response);
				
				_eventInit();  // html이 전부 그려진 후 호출되어야 작동함.
			},
			error: function(xhr, status, error) {
	            console.error("Error fetching Location Detail:", error);  // 오류 처리
	        }
		});   
   
	}
  
	let _draw = {
		drawLocationDetail: function(list) {  // fetchLocationDetail() 함수에서 API 호출 결과 값으로 받은 response값을 list라는 이름의 매개변수로 넘겨준다. 
		/* 여행지 이름 */
			$("#locationName").html(list.Description.name);  
			
		/* 여행지 주소(시/동) */
			$("#locationAddressSiDong").html(list.Description.address_si + " " + list.Description.address_dong); 

		/* 여행지 설명 */
		  	$("#locationDescription").html(list.Description.description);  

		/* 여행지 주소(상세) */
		  	$("#locationAddress").html(list.Description.address);  

 
		/* 여행지 이미지 START */
			let ImageList = $("#locationImageList"); 
			ImageList.empty(); // 기존 내용을 비워줌

			// 메인 이미지 1개 출력
			let mainImgStr = 
				`<div class="col-12"> 
					<div class="main-image mb-4 img-container">
						<img src="${list.Image[0].url}" alt="대체텍스트" class="img-fluid rounded w-100">
					</div>
				</div>`;
			ImageList.append(mainImgStr);

			let row =  $("<div>").addClass("row justify-content-between");
			ImageList.append(row);

			// 작은 이미지들 반복 출력
			for(data of list.Image) {  // url 값에는 큰따옴표 포함되어 있지 않기 때문에 큰따옴표 붙여야 함 => https://mtl-s3-bom/location/12/서울_명동교자 본점_3.jpg
				// 작은 이미지
				let smallImgStr = 
					`<div class="col-3 img-container-small">
						<img src="${data.url}" alt="대체텍스트" class="img-fluid rounded"> 
					</div>`;
					row.append(smallImgStr);  
					// .html은 선택한 요소의 기존 콘텐츠를 덮어쓰고 새 콘텐츠로 교체하기 때문에 반복문에서는 사용X
			}
  		/* 여행지 이미지 END */

		/* 여행지 키워드 */
			let keywordList = $("#locationKeywordList");
			keywordList.empty(); // 기존 내용을 비워줌

			for(data of list.Keyword) {
				let keywordStr =
				`<li class="list-inline-item">
					<h5><span class="badge bg-primary bg-opacity-10 text-primary"><i class="fa-solid fa-hashtag"></i>${data.keyword}</span></h5>
				</li>`
				keywordList.append(keywordStr);
			}

		/* 지도 */
			_mapInit(list.Description);  // 여기서 지도 매개변수를 넘겨준다. 

		}		
	};

	// 네이버 지도
	function _mapInit(data) {  // data 파라미터는 _draw.drawLocationDetail 함수에서 마지막에 호출되는 _mapInit(data); 부분에서 넘겨준다.
		let option = {
			zoom: 16,
			latitude: data.latitude,
			hardness: data.hardness,
		};
		
		comm.setMapWithGeo(option);
	};

	return {
		init,
	};
})();
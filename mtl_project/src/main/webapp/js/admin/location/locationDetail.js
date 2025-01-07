const locationDetail = (function() {
	let location_idx;  // 여행지 idx를 전역변수로 선언 
    
	// js 로딩 시 이벤트 초기화 실행     
	function init() {         
		// 현재 페이지의 URL에서 쿼리 스트링 파라미터를 가져옴
		const urlParams = new URLSearchParams(window.location.search);  // window.location.search: 현재 URL에서 쿼리 스트링 부분을 반환
		location_idx = urlParams.get('location_idx');  // location_idx 이름의 특정 파라미터 값을 가져옴
    
		fetchLocationDetail();  // 페이지 로드 시 Location 여행지 상세정보를 가져옴
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
			if(action == "clickLocationUpdate") {  // 수정하기 버튼 클릭 시 
				_event.clickLocationUpdate(evo);
			} else if(action == "clickLocationDelete") {  // 삭제하기 버튼 클릭 시 
				_event.clickLocationDelete(evo);
			};
		};
	}; 
	
	// 이벤트
	let _event = {
		// 수정하기 버튼 클릭 시  해야함!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		clickLocationUpdate: function(evo) {  
			$.ajax({
				// url: "/mtl/api/admin/location/keyword/list", 
		        // method: "POST",  // POST 방식
		        // data: { "type" : keywordType },
		        // success: function(resp) {
		        // 	_draw.drawKeywordList(resp.list);
		        // },
			});
		},
		// 삭제하기 버튼 클릭 시
		clickLocationDelete: function(evo) {  
			console.log('전역변수 location_idx 값은??? :', location_idx);

			modal.confirm({  // 삭제 버튼 클릭 시 확인 모달 띄우기
				"content" : "여행지를 삭제하시겠습니까?",
				"confirmCallback" : function() {
					$.ajax({
						url: "/mtl/api/admin/location/delete",   // 여행지 삭제 API 호출 
						method: "POST",  
						data: {"location_idx" : location_idx}, 
						success: function(response) {  // response에는 result가 들어있음. 삭제된경우 true/ 삭제안된경우false
							if(response.result){  // response.result 가 true일 때
								modal.alert({
									"content" : "정상적으로 삭제되었습니다.",
								});
							} else {
								modal.alert({  // response.result 가 false일 때
									"content" : "삭제에 실패하였습니다.<br>다시 시도해주세요."
								});
							}
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

	};  // let _event 끝
	
	
	// fetchLocationDetail();  // 여행지 상세정보를 가져오는 메서드
	function fetchLocationDetail(){


		// 결과를 콘솔에 출력
		console.log('전역변수 location_idx 값은??? :', location_idx);

		$.ajax({
			type: "POST", 
			url: "/mtl/api/admin/location/getDetail",   // API 호출
			data: {"location_idx" : location_idx},   // 호출 시 param값으로 넘겨줄 것
			success: function(response) {   //  response에는 info, img, keyword들어있음
				console.log("API호출성공하고 받은 response ", response);  //  성공적으로 응답받은 데이터 로그
				_draw.drawLocationDetail(response);

				_eventInit();  // html이 전부 그려진 후 호출되어야 작동함.
			},
			error: function(xhr, status, error) {
	            console.error("Error fetching Location Detail:", error);  // 오류 처리
	        }
		});   
   
	}
  
	let _draw = {
		// 여행지 상세보기 Card 그리기
		drawLocationDetail: function(list) {  //  list에는 info, img, keyword들어있음
			console.log("list?????", list);  
			console.log("list info?????", list.info);  

		/* 여행지 기본정보 */
			// 이름
			$("#locationName").html(list.info.name);  
			
			// 주소(시/동)
			$("#locationAddressSiDong").html(`<i class="bi bi-geo-alt me-1 text-primary"></i> ${list.info.address_si} ${list.info.address_dong}`); 

			// 설명
		  	$("#locationDescription").html(list.info.description);  

 
		/* 여행지 이미지 */
			let ImageList = $("#locationImgList"); 
			ImageList.empty();

			for(imgData of list.img) {
				let img = 
						`<div class="col-md-4">
							<a class="w-100 h-100" data-glightbox data-gallery="gallery" href="assets/images/category/directory/03.jpg">
								<div class="card card-element-hover card-overlay-hover overflow-hidden">
									<img src="${imgData.url}" class="card-img">
									<div class="hover-element w-100 h-100">
										<i class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
									</div>
								</div> 
							</a>
						</div>`;
				ImageList.append(img);
			}
			
		/* 여행지 정보 card */
			// 지역
			$("#locationArea").html(list.info.area);  
			// 분류
			$("#locationType").html(list.info.type);  

			// 키워드
			let keywordList = $("#locationKeword");
			keywordList.empty(); // 기존 내용을 비워줌
			
			if(list.keyword != undefined){  // 키워드 값이 있는 경우에만 실행
				// ㄴ 키워드 값이 없는 경우 서버에서 아예 리스트를 반환하지 않으므로 list.keyword는 undefined이다. 
				for(keywordData of list.keyword) {
					let keyword =
					`#${keywordData.keyword} `
					keywordList.append(keyword);
				}
			}

		/* 여행지 위치 card */
			// 주소 정보
			$("#locationAddress").html(`<i class="bi fa-fw bi-geo-alt me-2"></i>${list.info.address}`);  
		
			// 지도 
			_mapInit(list.info);  // 여기서 지도 매개변수를 넘겨준다. 
		}		
	};

	// 네이버 지도
	function _mapInit(data) {  // 파라미터로 들어오는 data값은 _draw.drawLocationDetail 함수에서 마지막에 호출되는 _mapInit(data); 부분에서 넘겨준다.
		let option = {
			zoom: 16,
			latitude: data.latitude,
			longitude: data.longitude,
		};
		
		comm.setMapWithGeo(option);
	};

	return {
		init,
	};
})();
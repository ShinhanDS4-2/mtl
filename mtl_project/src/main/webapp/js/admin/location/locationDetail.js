const locationDetail = (function() {
	let location_idx;  // 여행지 idx를 전역변수로 선언    
	let locationImgUpdate = false;  // 여행지 수정 시 이미지 수정 여부 상태 관리
       
	// js 로딩 시 이벤트 초기화 실행              
	function init() {                   
		// 현재 페이지의 URL에서 쿼리 스트링 파라미터를 가져옴      
		const urlParams = new URLSearchParams(window.location.search);  // window.location.search: 현재 URL에서 쿼리 스트링 부분을 반환
		   
		location_idx = urlParams.get('location_idx');  // location_idx 이름의 특정 파라미터 값을 가져옴
       
		fetchLocationDetail();  // 페이지 로드 시 Location 여행지 상세정보를 가져옴
		_draw.drawModalKeyword(); // 여행지 수정 모달창에 키워드 리스트 동적으로 그려줌
		_eventInit();                           
	};                                        
                       
	// 이벤트 초기화  -  (전부 동일 수정할 필요X)    
	function _eventInit() {       
		let evo = $("[data-src='locationDetail'][data-act]").off();
		evo.on("click change", function(e) {
			_eventAction(e);      
		});                 
	};      
	   
	// 이벤트 분기  --  버튼 클릭이 있으면 수정 필요  
	function _eventAction(e) {
		let evo = $(e.currentTarget); 
		  
		let action = evo.attr("data-act");
		   
		let type = e.type; 
		  
		if(type == "click") {    
			if(action == "clickLocationDelete") {  // 삭제하기 버튼 클릭 시 
				_event.clickLocationDelete(evo);
			} else if(action == "findAddress") {  // (모달창)주소찾기 버튼 클릭 시 
				comm.findAddress();			// 주소 찾는 다음API를 가져다 쓸 수 있게 만들어둔 함수 호출
			} else if(action == "clickAddress") {  // (모달창)주소찾기 input창 클릭 시 -> findAddress 버튼 클릭한거랑 동일하게 트리거 
				$("#findAddress").trigger("click");
			} else if (action == "clickModalUpdate") {	// 여행지 수정 모달에서 확인버튼 클릭 시 
				_event.clickLocationUpdate(evo);
			}; 
		} else if (type == "change") { 
			if (action == "changeFile") {  // 여행지 수정 모달창에서 사진업로드 하는 경우
				locationImgUpdate = true; // 여행지 이미지 수정 여부 상태 true로 변경
				comm.setPreview(evo); 		// 이미지 미리보기 생성  => 이거 안댐 수정필요
			};  
		}; 
	}; 
	
	// 이벤트
	let _event = {

		//  여행지 수정 모달에서 확인버튼 클릭 시 
		clickLocationUpdate: function(evo) {  
			let url = "/admin/location/update";

			// 모달창에 있는 val값 가져오기  +  데이터 수정 API호출
			
			// 지역
			let areaType = $("input[name='areaType']:checked").val();
		
			// 분류        
			let locationType = $("input[name='locationType']:checked").val();

			// 장소명  
			let placeName = $("#placeName").val();

			// 주소
			let address = $("#address").val();
			let address_si = $("#addressSi").val();
			let address_dong = $("#addressDong").val();

			// 상세정보
			let detailInfo = $("#detailInfo").val();

			// 키워드  =>  선택된 체크박스 값 가져오기
			let selectedKeywords = [];
			// 'keywordList'에 있는 체크박스 중 선택된 항목의 value 값을 배열에 추가
			$("input[type='checkbox']:checked").each(function() {
				selectedKeywords.push($(this).val());  // 키워드 value 값은 keyword_idx임 
			});
			
			let data = {
				// 기본정보수정에 필요한 데이터
				"location_idx" : location_idx,
				"area" : areaType,
				"type" : locationType,
				"name" : placeName,
				"address" : address,
				"address_si" : address_si,
				"address_dong" : address_dong,
				"description" : detailInfo,

				// 이미지 수정에 필요한 데이터

				// 키워드 수정에 필요한 데이터
				"keywordList" : selectedKeywords, 

			};
			console.log("data?>>>>>>>>>", data);

			// 데이터 null 체크
			for (let key in data) {
				if (data[key] == null || data[key] == "") {
					modal.alert({
						"content" : "입력되지 않은 값이 있습니다."
					});
					return;
				};
			};

// 정보 수정하는 경우 이미지 데이터가 없을 수 있음

			if(locationImgUpdate) {  // 여행지 수정 모달창에서 사진 업로드 했으면(true)
				// 업로드한 이미지 정보 가져와서 data에 넣어주기 
				data.images = $("#partnerImage").get(0).files;
				// 이미지 null 체크 * >> 
				// if ($("#preview").children().length <= 0) {
				// 	modal.alert({
				// 		"content" : "사진을 업로드해 주세요."
				// 	});
				// 	return;				
				// };  
				} else {  // 여행지 수정 모달창에서 사진 업로드 안했으면(falsr)
					// data에 images 안넘김
				}
// 체인지 이벤트가 발생하면 업로드 된 사진 데이터 넣어주고 미리보기 출력
// 체인지 이벤트가 발생 안하면 .. 이미지 데이터에는 빈배열로 넘겨서 자바에서 이미지 없으면 삭제/등록 처리 안하도록 로직 작성
			
console.log("data?최최종확인>>>>>>>>>", data);
			// 파일 전송을 위한 폼데이터 변경 (이미지와 같은 파일을 서버로 전송하기 위해 필요함)		
			let formData = comm.changeFormData(data);

			modal.confirm({
				"content" : "여행지를 수정하시겠습니까?",
				"confirmCallback" : function() {  // 사용자가 확인 버튼 눌렀을 때 API 호출
					
					// 이미지 파일 있는 경우 comm.sendFile로 ajax 호출해야함!! 아니면 이미지 파일 안넘어감
					// url은 위에서 선언 초기화 했음
					comm.sendFile(url, formData, "POST", function(resp) {
						console.log("API호출성공하고 받은 resp ", resp);  //  성공적으로 응답받은 데이터 로그
						if (resp.result == true) {  // 응답 성공 시 
							modal.alert({ 
								"content" : "정상적으로 수정되었습니다.",
								"confirmCallback" : function() {
									location.reload();
								}
							});
						} else {         
							modal.alert({
								"content" : "수정에 실패하였습니다.<br>다시 시도해 주세요."
							});
						}
					});

				}
			});
		},

		// 삭제하기 버튼 클릭 시 (완료)
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
									"confirmCallback" : function() {
										history.back();  // 삭제 처리 후 리스트페이지로 이동
									}
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
				_draw.drawLocationDetail(response);  // 여행지 상세조회 페이지 그리기
				_draw.drawLocationUpdateModal(response);  // 여행지 수정하기 모달 그리기
				_eventInit();  // html이 전부 그려진 후 호출되어야 작동함.
			},
			error: function(xhr, status, error) {
	            console.error("Error fetching Location Detail:", error);  // 오류 처리
	        }
		});        
   
	}
   
	let _draw = {
		drawModalKeyword: function(list) {
			/* 키워드 리스트 서버에서 받아서 동적으로 그려줌 START */
			let sendJsonUrl = "/common/keyword/list";  // API호출 url
			let sendJsonData = { "type" : "LOCATION" };  // 여행지에 관한 키워드만 선택
			
			comm.sendJson(sendJsonUrl, sendJsonData, "POST", function(resp) {
				let list = resp.list;
				let keywordList = $("#keywordList").empty();  
				// 키워드 리스트 반복하며 그려줌   
				let col = "";
				for (let i = 0; i < list.length; i++) {
					let data = list[i];
					
					if (i == 0 || i % 4 == 0) {
						col = $("<div>").addClass("col");
						keywordList.append(col);
					}
					 
					let div = $("<div>").addClass("form-check");
					col.append(div);
					  
					let input = $("<input>").addClass("form-check-input").attr({
						"type" : "checkbox",
						"id" : "keyword" + data.keyword_idx,
					}).val(data.keyword_idx);
					div.append(input);
					
					let label = $("<label>").addClass("form-check-label").attr("for", "keyword" + data.keyword_idx).html(data.keyword);
					div.append(label);
				};
			});   
			/* 키워드 리스트 서버에서 받아서 동적으로 그려줌 END */
		},

		// 여행지 수정하기 버튼 클릭 시 데이터 있는 상태의 Modal 그리기
		drawLocationUpdateModal: function(list) {  //  list에는 info, img, keyword들어있음
			console.log("list?????", list);  
			console.log("list info?????", list.info);  
     

		/* 여행지 수정 Modal */ 
			// 지역 
			$("input[name='areaType']").each(function() {  // each 반복문으로 모달에 라디오버튼 하나씩 돌면서 검사 
				if ($(this).val() === list.info.area) {  // 라디오 버튼 value값 === 서버에서 받은 list.info.area 값이 일치한다면 (ex. value="SEOUL")
					$(this).prop("checked", true);  // 해당 라디오 버튼 속성을 cheched로 설정해줘서 체크표시해준다. 
				}
			});

			// 분류        
			$("input[name='locationType']").each(function(){
				if ($(this).val() === list.info.type) {
					$(this).prop("checked", true); 
				}
			});

			// 장소명  
			$("#placeName").val(list.info.name);

			// 주소
			$("#address").val(list.info.address);
			$("#addressSi").val(list.info.address_si);
			$("#addressDong").val(list.info.address_dong);

			// 상세정보
			$("#detailInfo").val(list.info.description);


			// 키워드 (=> 동적으로 키워드리스트를 그려준다음에 선택해야 함)
			// 	ㄴ js 로딩 시 이벤트 초기화 실행 => init() 메서드에서 _draw.drawModalKeyword(); 호출해서 서버에서 받은 키워드리스트 미리 모달창에 그려놓음

			// 키워드 체크박스
			if (list.keyword) {
				for(data of list.keyword) {  // 키워드 수만큼 반복
					$("input[type='checkbox']").each(function() {  // 페이지에 동적으로 뿌려준 체크박스 요소 하나씩 반복 돌면서 검사
							// 서버에서 받아온 키워드 값과, 동적으로 뿌려놓은 키워드체크박스 라벨text가 같으면 체크해준다. 
						if (data.keyword.trim() === $(this).next("label").text().trim()) {  // $(this).next("label")은 현재 선택한 체크박스 바로 뒤에 있는 <label> 요소를 선택
							$(this).prop("checked", true);
						}
					}); 
				}
			};
			
			// 이미지 (=> 서버에서 이미지 데이터 받아와서 미리보기로 그려줌)
			console.log("list.img값은??????//", list.img)
			
			let imageList = $("#imageList").empty();
			let imageUploadButton = `<div id="imageUploadButton" class="border rounded d-flex justify-content-center align-items-center" style="width: 150px; height: 100px; background-color: #f8f9fa;">
										<label class="text-center" style="cursor: pointer;">
											<i class="bi bi-upload"></i><br>여행지 사진 업로드
											<input type="file" class="d-none" multiple="multiple" data-src="locationDetail" data-act="changeFile" id="partnerImage">
										</label>
									</div>`;  
			imageList.append(imageUploadButton);
			for(imgData of list.img) {
				let image = 
					`<div class="border rounded d-flex justify-content-center align-items-center" style="width: 150px; height: 100px;">
						<img src="${imgData.url}" alt="" style="max-width: 100%; max-height: 100%; object-fit: cover;">
					</div>`;
				imageList.append(image);
			}
		},		

		// 여행지 상세조회 페이지 그리기
		drawLocationDetail: function(list) {  //  list에는 info, img, keyword들어있음
			console.log("list?????", list);  
			console.log("list info?????", list.info);  
			console.log("list info?????", list.img);  

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
						`<div class="col-md-3">    
							<div class="card card-element-hover card-overlay-hover overflow-hidden fixed-size-img">
								<img src="${imgData.url}" class="card-img fixed-size-img" alt="">
							</div> 
						</div>`;
				ImageList.append(img);
			}
			
		/* 여행지 정보 card */ 
			// 지역
			$("#locationArea").html(list.info.area_name);  
			// 분류
			$("#locationType").html(list.info.type_name);  

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
		},		
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
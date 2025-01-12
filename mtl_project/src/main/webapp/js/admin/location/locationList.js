const locationList = (function() {  
	let isSearchClicked = false;  // 검색 버튼 클릭 여부 상태 관리      
	let keywordType = "PARTNER";                     

	// js 로딩 시 이벤트 초기화 실행                 
	function init() {          
		_draw.drawModalKeyword(); // 여행지 등록 모달창에서 > 키워드 리스트 서버에서 받아서 그려주는 것
		fetchLocationList();  // 페이지 로드 시 여행지 전체리스트 조회 
	};        
                          
	// 이벤트 초기화        
	function _eventInit() {  
		let evo = $("[data-src='locationList'][data-act]").off();
		evo.on("click change", function(e) {
			_eventAction(e); 
		});   
	};           
	   
	// 이벤트 분기
	function _eventAction(e) {   
		let evo = $(e.currentTarget);
		
		let action = evo.attr("data-act");
		
		let type = e.type;  
		   
		if(type == "click") {       
			if(action == "clickKeywordList") {  // data-act="clickKeywordList"
				_event.clickKeywordList(evo);
			} else if (action == "clickDuplication") {
				_event.clickDuplication();   
			} else if (action == "clickKeywordRegist") {
				_event.clickKeywordRegist();
			} else if (action == "clickKeywordTab") {
				_event.clickKeywordTab(evo);
			} else if (action == "clickKeywordDelete") {
				_event.clickKeywordDelete(evo);
			} // 여행지 등록
			 else if (action == "findAddress") {  // 주소찾기 버튼 클릭 시
				comm.findAddress();			// 주소 찾는 API를 작성해놓은 함수 호출
			} else if (action == "clickAddress") {	// 주소창 클릭 시 주소 찾기 버튼 트리거	
				$("#findAddress").trigger("click"); 	
			} else if (action == "clickLocationRegist") {	// 여행지 등록 모달에서 확인버튼 클릭 시 
				_event.clickLocationRegist(evo);
			} else if (action == "clickSearchButton") {	// 여행지 리스트 조회 페이지 > 검색버튼 클릭 시 
				_event.clickSearchButton(evo);
			} else if (action == "clickKeywordModal") {
				_event.clickKeywordModal();
			}
		} else if (type == "change") {
			if (action == "changeFile") {
				comm.setPreview(evo); 		// 이미지 미리보기 생성
			};
		};
	};
	
	// 이벤트
	let _event = {
	// 아래 삭제금지	
		// 키워드 리스트
		clickKeywordList: function(evo) {
			$.ajax({
				url: "/mtl/api/admin/location/keyword/list", 
		        method: "POST",  // POST 방식
		        data: { "type" : keywordType },
		        success: function(resp) {
		        	_draw.drawKeywordList(resp.list);
		        },
			});
		},
	
		// 중복 확인 클릭
		clickDuplication: function() {
			$.ajax({
		        url: "/mtl/api/admin/location/keyword/duplication",  // 중복 확인을 위한 URL (Controller에서 매핑 필요)
		        method: "POST",  // POST 방식
		        data: {
		        	"type" : $("#keywordType option:selected").val(),
		            "keyword": $("#keyword").val() // 입력한 키워드
		        },
		        success: function(resp) {
		            if (resp >= 1) {  // 중복 키워드가 있을 경우
		            	modal.alert({
		            		"content" : "이미 사용 중인 키워드입니다."
		            	});
		            	$("#keywordRegistBtn").attr("data-check", "0");
		            } else {  // 중복이 없으면
		            	modal.alert({
		            		"content" : "사용 가능한 키워드입니다."
		            	});
		            	$("#keywordRegistBtn").attr("data-check", "1");
		            };
		        },
		        error: function() {
		        	modal.alert({
	            		"content" : "중복 확인에 실패하였습니다.<br>다시 시도해주세요."
	            	});
		        }
		    });	
		},
		
		// 키워드 등록
		clickKeywordRegist: function() {
			let keywordType = $("#keywordType option:selected").val();
			if (keywordType == '' || keywordType == null) {
				modal.alert({
					"content" : "입력되지 않은 값이 있습니다."
				});
				return;
			}
			
			let keyword = $("#keyword").val();
			if (keyword == '' || keyword == null) {
				modal.alert({
					"content" : "입력되지 않은 값이 있습니다."
				});
				return;
			}
		
			if ($("#keywordRegistBtn").attr("data-check") == "0") {
				modal.alert({
					"content" : "중복확인을 해주세요."
				});
				return;
			};
			
			modal.confirm({
				"content" : "키워드를 등록하시겠습니까?",
				"confirmCallback" : function() {
					$.ajax({
				        url: "/mtl/api/admin/location/keyword/regist",
				        method: "POST",  // POST 방식
				        data: {
				        	"type" : keywordType,
				            "keyword": keyword 
				        },
				        success: function(resp) {
				        	modal.alert({
			            		"content" : "정상적으로 등록되었습니다.",
			            		"confirmCallback" : function() {
			            			_event.clickKeywordList();
			            			$("#keywordRegisterModal").modal("hide");
			            		}
			            	});
				        },
				        error: function() {
				        	modal.alert({
			            		"content" : "등록에 실패하였습니다.<br>다시 시도해주세요."
			            	});
				        }
				    });	
				}	
			});
		},
		
		// 키워드 등록 모달 초기화
		clickKeywordModal: function() {
			$("#keyword").val("");
		},

		// 키워드 탭 클릭
		clickKeywordTab: function(evo) {
			keywordType = evo.attr("data-type");

			_event.clickKeywordList(evo);
		},
		
		// 키워드 삭제
		clickKeywordDelete: function(evo) {
			let keywordIdx = evo.attr("data-keyword-idx");
			let keywordType = evo.attr("data-keyword-type");
			
			modal.confirm({
				"content" : "키워드를 삭제하시겠습니까?",
				"confirmCallback" : function() {
					$.ajax({
				        url: "/mtl/api/admin/location/keyword/delete",
				        method: "POST",  
				        data: {
				            "keyword_idx": keywordIdx,
				            "type": keywordType,
				        },
				        success: function(resp) {
				        	modal.alert({
			            		"content" : "정상적으로 삭제되었습니다.",
			            		"confirmCallback" : function() {
			            			_event.clickKeywordList();
			            		}
			            	});
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

		/* 여행지 등록 START */
		clickLocationRegist: function() {
			let url = "/admin/location/regist";
			// 지역 탭에서 선택된 라디오 버튼의 값을 가져오기
			let areaType = $('input[name="areaType"]:checked').val();

			// 분류 탭에서 선택된 값(단일)을 가져오기
			let categoryType = $('input[name="categoryType"]:checked').val();
			
       	 	// 장소명 입력 필드의 값을 가져오기
			let placeName = $('#placeName').val();
			
			// 상세정보 입력 필드의 값을 가져오기
			let detailInfo = $('#detailInfo').val();
			
			// 키워드 선택된 값(다중) 가져오기
			let selectedKeywords = $('#keywordList .form-check-input:checked').map(function () {
				return $(this).val();  // 선택된 각 체크박스를 순회하며, value값을 반환한다. / .get() : 제이쿼리 객체를 일반 배열로 변환한다. 
			}).get();

			let data = {    
				"area" : areaType,
				"type" : categoryType,
				"name" : placeName,
				"address" : $("#address").val(),
				"address_si" : $("#addressSi").val(),
				"address_dong" : $("#addressDong").val(),
				"description" : detailInfo,
				"keywordList" : selectedKeywords,
			};

			// 데이터 null 체크
			for (let key in data) {
				if (data[key] == null || data[key] == "") {
					modal.alert({
						"content" : "입력되지 않은 값이 있습니다."
					});
					return;
				};
			};

			// 이미지 정보 가져와서 data에 넣어주기 
			data.images = $("#partnerImage").get(0).files;
			// 이미지 null 체크
			if ($("#preview").children().length <= 0) {
				modal.alert({
					"content" : "사진을 업로드해 주세요."
				});
				return;				
			};
			// 파일 전송을 위한 폼데이터 변경 (이미지와 같은 파일을 서버로 전송하기 위해 필요함)		
			let formData = comm.changeFormData(data);

			modal.confirm({
				"content" : "여행지를 등록하시겠습니까?",
				"confirmCallback" : function() {  // 사용자가 등록확인 버튼 눌렀을 때 API 호출
					
					// comm.sendFile 불러와서 쓰는 경우 url값에 /mtl/api 기본값으로 들어있어서 생략해줘야함
					// url은 위에서 선언 초기화 했음 url = "/admin/location/regist";
					comm.sendFile(url, formData, "POST", function(resp) {
						if (resp.result == true) {  // 응답 성공 시 
							modal.alert({
								"content" : "정상적으로 저장되었습니다.",
								"confirmCallback" : function() {
									location.reload();
								}
							});
						} else {
							modal.alert({
								"content" : "저장에 실패하였습니다.<br>다시 시도해 주세요."
							});
						}
					});
				}
			});
		},
		/* 여행지 등록 END */	

		// 검색필터 검색 버튼 클릭 시
		clickSearchButton: function() {
			isSearchClicked = true;
			fetchLocationList();  // 조건에 맞는 리스트 조회
		},

	};  // let _event 끝

	
/* 시온 작성 */	



	/* 여행지 리스트 조회 START => /mtl/admin/locationlist */
	function fetchLocationList(curPage=1) {  //  _curPage=1 : 처음 화면 접속 시 1페이지부터 시작
		// 그냥 조회했을 때 기본 param값
		let param = {  // Ajax 요청 시 전달할 파라미터
			"searchType" : '',   // 여행지 타입 검색조건
			"searchArea" : '',  // 지역 타입 검색조건
			"searchName" : ''  // 장소명 타입 검색조건
		};
		console.log("검색 안했을때: param값은 ????", param);

		// 검색 버튼이 클릭된 경우 조건 추가
		if (isSearchClicked) {
			// 검색필터에 입력된 데이터 가져오기
			let searchType = $("input[name='searchLocationType']:checked").val();  // ""(전체), A(관광지), R(맛집)
			let searchArea = $("#searchLocationArea").val();  // ""(전체), SEOUL, GANGNEUNG, YEOSU, BUSAN, JEJU
			let searchName = $("#searchLocationName").val();  // ""(입력값X), text로 입력한 값
			
			param = { // ajax로 넘겨줄 data값 변수 선언
				"searchType" : searchType, 
				"searchArea" : searchArea,
				"searchName" : searchName
			};

			console.log("검색 조건: param값은 ????", param);

		} else {
			console.log("전체 리스트 조회");
		}

		/* 페이징 START */
		let pageOption = {
			limit: 10  // 한페이지에 몇개의 data item을 띄울지 설정  => 얘는 쿼리로 넘겨줄 정보
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
		/* 페이징 END */
		
		console.log(param);
		// Ajax 요청 - 여행지 리스트 조회 API호출
		$.ajax({   
			type: "POST", 
			url: "/mtl/api/admin/location/getList",  
			data: param,   // param값 => 검색필터(여행지 타입, 지역, 장소명, offset, limit)

			success: function(response) {   //  API 호출 성공 시 결과 response(여기서 API 리턴값: locationListCount, locationList)
				_draw.drawLocationList(response);  // 리스트 그리기
				page.drawPage(response.locationListCount);  // 하단 페이징 넘버 그려주는거 => 리스트 총 갯수를 파람으로 넣어주면 알아서 그려줌
				_eventInit();  // html이 전부 그려진 후 호출되어야 작동함. 
			},
			error: function(xhr, status, error) {
				console.error("Error :", error); 
			}
		});  
	}
	
	
	
	// 그리기
	let _draw = {
		// 키워드 등록 > 키워드 리스트 그리기
		drawKeywordList: function(list) {
			let keywordList = "";
			if (keywordType == "PARTNER") {
				keywordList = $("#keywordList1");
			} else {
				keywordList = $("#keywordList2");
			};
			keywordList.empty();
			
			for (let data of list) {
				let div = $("<div>").addClass("border-bottom text-center p-2");
				keywordList.append(div);
				
				let keyword = $("<strong>");
				keyword.append("<i class='fa-solid fa-hashtag'></i>");
				keyword.append(data.keyword);
				div.append(keyword);
				
				let deleteBtn = $("<a>").addClass("text-danger ms-2").append("<i class='fa-solid fa-xmark'></i>");
				deleteBtn.attr({
					"href" : "javascript:;",
					"data-src" : "locationList",
					"data-act" : "clickKeywordDelete",
					"data-keyword-idx" : data.keyword_idx,
					"data-keyword-type" : data.type
				});
				div.append(deleteBtn);
				
				_eventInit();
			};
		},

		// 여행지 리스트 출력
		drawLocationList: function(list) {  // 여행지 리스트 뿌려주는 곳 
			console.log("여행지 등록 모달 그리는 중 list값은 ?? ", list)  // list에는 locationListCount, locationList 값이 들어있음

			
			// List 상단 Tap 여행지리스트 총 개수
			$("#locationListCount").html(`총 ${list.locationListCount}건`);

			let locationList = $("#locationList");
			locationList.empty();

			// 여행지 List
			for (data of list.locationList) { // data에는 여행지 정보 1개가 들어있음  
				let Data = 
						`<div class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4 text-center">
							<div class="col">
								<small class="d-block d-sm-none">지역</small>
								<h6 class="ms-1 mb-0 fw-normal">${data.area_name}</h6>
							</div>     
							<div class="col">
								<small class="d-block d-sm-none">분류</small>
								<h6 class="ms-1 mb-0 fw-normal">${data.type_name}</h6>
							</div>
							<div class="col">
								<small class="d-block d-sm-none">장소명</small>
								<h6 class="ms-1 mb-0 fw-normal">${data.name}</h6>
							</div>
							<div class="col">
								<small class="d-block d-sm-none">등록일</small>
								<h6 class="ms-1 mb-1 fw-light">${data.createdate}</h6>
							</div>
							<div class="col">			
								<small class="d-block d-sm-none">상세보기</small>
								<div class="ms-1 col">
									<a role="button" href="admin/location/detail?location_idx=${data.location_idx}" class="btn btn-sm btn-light mb-0" 
										data-src="locationList" data-act="clickLocationDetail">상세보기</a>
								</div>
							</div>
						</div>`;
   
				locationList.append(Data);
			}
		},
  

		// 여행지 등록 모달창에서 > 키워드 리스트 서버에서 받아서 그려줌
		drawModalKeyword: function() {
			let url = "/common/keyword/list";
		
			let data = { "type" : "LOCATION" };
			
			comm.sendJson(url, data, "POST", function(resp) {
				let list = resp.list;
				
				let keywordList = $("#keywordList").empty();
				
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
		}, 



	};  // let _draw 끝

	
	return {
		init,
	};
})();
const regist = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		window.scrollTo(0,0);
		_eventInit();
		_setFacilities();
		_setKeyword();
		_setPartnerInfo();
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='regist'][data-act]").off();
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
			if (action == "findAddress") {
				comm.findAddress();			// 주소 입력
			} else if (action == "clickAddress") {
				$("#findAddress").trigger("click"); // 주소창 클릭 시 주소 찾기 버튼 트리거			
			} else if (action == "clickInfoSave") {
				_event.clickInfoSave();
			}
		} else if (type == "change") {
			if (action == "changeFile") {
				comm.setPreview(evo); 		// 이미지 미리보기 생성
			};
		};
	};
	
	// 이벤트
	let _event = {
		// 정보 저장
		clickInfoSave: function() {
			let url = "/partner/accomodation/update";
			
			let facilitiesList = $("#facilitiesList .form-check-input:checked").map(function () {
		        return $(this).val();
		    }).get();

			let keywordList = $("#keywordList .form-check-input:checked").map(function () {
		        return $(this).val();
		    }).get();
			
			let data = {
				"type" : $("#partnerType option:selected").val(),
				"area" : $("#partnerArea option:selected").val(),
				"check_in" : $("#partnerCheckInTime").val(),
				"check_out" : $("#partnerCheckOutTime").val(),
				"address" : $("#address").val(),
				"address_si" : $("#addressSi").val(),
				"address_dong" : $("#addressDong").val(),
				"facilitiesList" : facilitiesList,
				"keywordList" : keywordList,
				"description" : $("#partnerDescription").val()
			};
			
			// 데이터 null 체크
			for (let key in data) {
				if (data[key] == null || data[key] == "") {
					alert("입력되지 않은 값이 있습니다.");
					return;
				};
			};
			
			// 이미지 null 체크
			data.mfile = $("#partnerImage").get(0).files;
			if ($("#preview").children().length <= 0) {
				alert("이미지를 등록해 주세요.");
				return;				
			};

			// 파일 전송을 위한 폼데이터 변경			
			let formData = comm.changeFormData(data);

			comm.sendFile(url, formData, "POST", function(resp) {
				if (resp.result == true) {
					alert("정상적으로 저장되었습니다.");
					location.reload();
				} else {
					alert("저장에 실패하였습니다.<br>다시 시도해 주세요.");
				}
			});
		},
	};
	
	// 시설 세팅
	function _setFacilities() {
		let url = "/common/facilities/list";
		
		let data = { "type" : "COMMON" };
		
		comm.sendJson(url, data, "POST", function(resp) {
			let list = resp.list;
			
			let facilitiesList = $("#facilitiesList").empty();
			
			let col = "";
			for (let i = 0; i < list.length; i++) {
				let data = list[i];
				
				if (i == 0 || i % 4 == 0) {
					col = $("<div>").addClass("col");
					facilitiesList.append(col);
				}
				
				let div = $("<div>").addClass("form-check");
				col.append(div);
				
				let input = $("<input>").addClass("form-check-input").attr({
					"type" : "checkbox",
					"id" : "facilities" + data.facilities_idx,
				}).val(data.facilities_idx);
				div.append(input);
				
				let label = $("<label>").addClass("form-check-label").attr("for", "facilities" + data.facilities_idx).html(data.name);
				div.append(label);
			};
		});
	};
	
	// 키워드 세팅
	function _setKeyword() {
		let url = "/common/keyword/list";
		
		let data = { "type" : "PARTNER" };
		
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
	};
	
	// 숙소 정보 세팅
	function _setPartnerInfo() {
		let url = "/partner/accomodation/detail";
		
		let data = {};
		
		comm.sendJson(url, data, "POST", function(resp) {
			let info = resp.data.info;
			
			$("#partnerName").val(info.name);
			$("#businessPhone").val(info.business_phone);
			$("#partnerCheckInTime").val(info.check_in);
			$("#partnerCheckOutTime").val(info.check_out);
			$("#partnerPhone").val(info.phone);
			
			// 숙소 유형 select
			let typeElement = document.getElementById("partnerType");
			let typeChoices = "";
		    if (typeElement) {
		        typeChoices = new Choices(typeElement, {
		            searchEnabled: false, 
		        });
		    };

			// 숙소 지역 select
			let areaElement = document.getElementById("partnerArea");
			let areaChoices = "";
		    if (areaElement) {
		        areaChoices = new Choices(areaElement, {
		            searchEnabled: false, 
		        });
		    };

			// 가입 후 정보 등록을 했을 경우 기존 정보들 세팅
			if(info.info_yn == "Y") {
				$("#partnerDescription").val(info.description);
				$("#address").val(info.address).attr("disabled", true);
				$("#findAddress").attr("disabled", true)
				$("#addressSi").val(info.address_si);
				$("#addressDong").val(info.address_dong);

		        // 선택 값 변경
		        typeChoices.setChoiceByValue(info.type);
		        areaChoices.setChoiceByValue(info.area);
	
	        	// 키워드
	        	for (let item of resp.data.keywordList) {
	        		let id = "#keyword" + item.keyword_idx;
	        		$(id).prop("checked", true);
	        	};

		        // 시설
	        	for (let item of resp.data.facilitiesList) {
	        		let id = "#facilities" + item.facilities_idx;
	        		$(id).prop("checked", true);
	        	};
	        	
	        	// 이미지
        		let preview = $("#preview");
	        	for (let item of resp.data.imageList) {
					let div = $("<div>").addClass("position-relative me-3");
                	preview.append(div);
                	
                    let img = $("<img>").addClass("preview rounded border").attr("src", item.url);
                    div.append(img);	        		
	        	};
			}
	        
	        _eventInit();
		});
	}
	
	return {
		init,
	};
})();
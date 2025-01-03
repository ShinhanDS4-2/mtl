const regist = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_eventInit();
		_setFacilities();
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
			
			let data = {
				"type" : $("#partnerType option:selected").val(),
				"check_in" : $("#partnerCheckInTime").val(),
				"check_out" : $("#partnerCheckOutTime").val(),
				"address" : $("#address").val(),
				"address_si" : $("#addressSi").val(),
				"address_dong" : $("#addressDong").val(),
				"mfile" : $("#partnerImage").get(0).files,
				"facilitiesList" : facilitiesList
			};
			
			// 파일 전송을 위한 폼데이터 변경			
			let formData = comm.changeFormData(data);
			
			comm.sendFile(url, formData, "POST", function() {
				alert("정상적으로 저장되었습니다.");
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
			
			// select
			let element = document.getElementById("partnerType");
			let choices = "";
		    if (element) {
		        choices = new Choices(element, {
		            searchEnabled: false, 
		        });
		    };

			// 가입 후 정보 등록을 했을 경우 기존 정보들 세팅
			if(info.info_yn == 'Y') {
				$("#partnerDescription").val(info.description);
				$("#address").val(info.address).attr("disabled", true);
				$("#findAddress").attr("disabled", true)

		        // 선택 값 변경
		        choices.setChoiceByValue(info.type);
	
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
	        
		});
	}
	
	return {
		init,
	};
})();
const customLocation = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_setKeyword();
		_eventInit();
	};
 
	// 이벤트 초기화 
	function _eventInit() {  
		let evo = $("[data-src='customLocation'][data-act]").off();
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
			if (action == "clickNext") {
				_event.clickNext();
			} else if (action == "clickPrev") {
				_event.clickPrev();
			} else if (action == "clickLocationCard") {
				_event.clickLocationCard(evo);
			}
		};        
	};   
	
	// 이벤트 
	_event = {
		// 계속하기 클릭
		clickNext: function(evo) {
			let keywordList = $("#keywordList .btn-check:checked").map(function () {
		        return $(this).val();
		    }).get();
		    
		    if (keywordList.length <= 0) {
		    	modal.alert({
		    		"content" : "키워드를 하나 이상 선택해 주세요."
		    	});
		    	return;
		    };
		    
		    let url = "/user/location/custom/list";
		    
		    let data = {
		    	"keywordList" : keywordList,
		    	"reservation_idx" : comm.getUrlParam().idx
		    };
		    
		    comm.sendJson(url, data, "POST", function(resp) {
		    	_draw.drawLocation(resp.list);
		    });
		    
			$("#keywordSelect").attr("hidden", true);
			$("#locationCustom").attr("hidden", false);
		},

		// 이전으로 클릭
		clickPrev: function(evo) {
			$("#keywordList .btn-check").prop("checked", false);
		
			$("#keywordSelect").attr("hidden", false);
			$("#locationCustom").attr("hidden", true);
		},
		
		// 여행지 카드 클릭
		clickLocationCard: function(evo) {
			let locationIdx = evo.attr("data-location-idx");
			
			let url = "/user/location/min/detail";
			
			let data = {
		    	"location_idx" : locationIdx
		    };
		    
		    comm.sendJson(url, data, "POST", function(resp) {
		    	_draw.drawLocationDetail(resp.data);
		    });
		}
	};
	 
	// 키워드 세팅
	function _setKeyword() {
		let url = "/common/keyword/list";
		
		let data = { "type" : "LOCATION" };
		
		comm.sendJson(url, data, "POST", function(resp) {
			let list = resp.list;
			
			_draw.drawKeyword(list);
		});
	};
	
	// 그리기
	let _draw = {
		// 키워드 그리기
		drawKeyword: function(list) {
			let keywordList = $("#keywordList");
			
			for (let data of list) {
				let div = $("<div>").addClass("col-3");
				keywordList.append(div);
				
				let input = $("<input>").addClass("btn-check").attr({
					"type" : "checkbox",
					"id" : "keyword" + data.keyword_idx
				}).val(data.keyword_idx);
				div.append(input);
				
				let label = $("<label>").addClass("btn btn-primary-soft btn-primary-check rounded-4 w-120").attr({
					"for" : "keyword" + data.keyword_idx				
				});
				label.append("<i class='fa-solid fa-hashtag me-1'></i>");
				label.append(data.keyword);
				div.append(label);
			};
		}, 
		
		// 여행지 그리기
		drawLocation: function(list) {
			let locationList = $("#locationList").empty();
			
			for (let data of list) {
				let card = $("<div>").addClass("card shadow p-2 mb-3").attr({
					"role" : "button",
					"data-src" : "customLocation",
					"data-act" : "clickLocationCard",
					"data-location-idx" : data.location_idx
				});
				locationList.append(card);
				
				let row = $("<div>").addClass("row");
				card.append(row);
				
				let imgDiv = $("<div>").addClass("col-4 align-self-center h-70px");
				row.append(imgDiv);
				
				let img = $("<img>").addClass("rounded-2 h-100 w-100").attr("src", data.image);
				imgDiv.append(img);
				
				let contentDiv = $("<div>").addClass("col-8");
				row.append(contentDiv);
				
				let span = $("<span>").addClass("badge text-bg-primary bg-opacity-10 text-primary").html(data.type == "A" ? "관광지" : "맛집");
				contentDiv.append(span);
				
				let cardBody = $("<div>").addClass("card-body position-relative d-flex flex-column p-0 h-100");
				contentDiv.append(cardBody);
				
				let title = $("<h5>").addClass("card-title mb-0 mt-1").html(data.name);
				cardBody.append(title);
				
				let address = $("<small>").append("<i class='bi bi-geo-alt'></i>");
				address.append(data.address);
				cardBody.append(address);
			};
			
			_draw.drawLocationDetail(list[0]);
			
			_eventInit();
		},
		
		// 여행지 정보 그리기
		drawLocationDetail: function(data) {
			$("#locationName").html(data.name);
			$("#locationDescription").html(data.description);
			$("#locationImage").attr("src", data.image);
			
			comm.setMapWithGeo({
				"latitude" : data.latitude,
				"longitude" : data.longitude,
				"zoom" : 16
			});
		}
	};
	
	return {
		init,
	};
})();
const partnerDetail = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_eventInit();
		_event.getDetail();
		
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='partnerDetail'][data-act]").off();
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
		};
	};
	
	// 이벤트
	let _event = {
		getDetail: function() {
			let partnerIdx = comm.getUrlParam().idx;
        
	        let url = "/user/partner/detail";
	        
	        let data = { "partner_idx" : partnerIdx };
	        
			comm.sendJson(url, data, "POST", function(resp) {
				let data = resp.data;
				
				// 지도
				_mapInit(data);
				
				$("#partnerName").html(data.name);
				$("#partnerDescription").html(data.description);
				$("#partnerAddress").html(data.address);
				$("#partnerPhone").html(data.phone);
				
				// select
				let element = document.getElementById("searchArea");
			    if (element) {
			        let choices = new Choices(element, {
			            searchEnabled: false, 
			        });
			
			        // 선택 값 변경
			        choices.setChoiceByValue(data.area);
			    };
			    
			    // 시설
			    _draw.drawCommonFacilities(data.commonFacilitiesList);
			    _draw.drawRoomFacilities(data.roomFacilitiesList);
			    
			    // 객실
			    _draw.drawRoomList(data.roomList);
			    
			    // 사진
			    let imageList = data.imageList;
			    $("#thumbnail").css("background-image", "url(" + imageList[0].url + ")");
			    $("#rightImage1").css("background-image", "url(" + imageList[1].url + ")");
			    $("#rightImage2").css("background-image", "url(" + imageList[2].url + ")");
			    $("#rightImage3").css("background-image", "url(" + imageList[3].url + ")");
			    
			    _eventInit();
			    e.tinySlider();
			});
		}
	};
	
	let _draw = {
		// 공통 시설
		drawCommonFacilities: function(list) {
			let listObj = $("#commonFacilitiesList").empty();
			for (let data of list) {
				let li = $("<li>").addClass("list-group-item pb-0");
				li.append("<i class='fa-solid fa-check-circle text-success me-2'></i>");
				li.append(data.name);
				listObj.append(li);
			};
		},

		// 객실 시설
		drawRoomFacilities: function(list) {
			let listObj = $("#roomFacilitiesList").empty();
			for (let data of list) {
				let li = $("<li>").addClass("list-group-item pb-0");
				li.append("<i class='fa-solid fa-check-circle text-success me-2'></i>");
				li.append(data.name);
				listObj.append(li);
			};
		},
		
		// 객실 리스트
		drawRoomList: function(list) {
			let roomList = $("#roomList").empty();
			
			for (let data of list) {
				let card = $("<div>").addClass("card shadow p-3");
				roomList.append(card);

				let row = $("<div>").addClass("row g-4");
				card.append(row);

				let imgCard = $("<div>").addClass("col-md-5 position-relative");
				row.append(imgCard);
				
				// 이미지 단일 / 다중
				let imageList = data.imageList;
				if (imageList.length <= 1) {
					let img = $("<img>").addClass("card-img rounded-2 h-180px").attr({
						"src" : imageList[0].url 
					});
					imgCard.append(img);
				} else {
					let slider = $("<div>").addClass("tiny-slider arrow-round arrow-xs arrow-dark overflow-hidden rounded-2");
					imgCard.append(slider);

					let tiny = $("<div>").addClass("tiny-slider-inner").attr({
						 "data-autoplay" : "true",
						 "data-arrow" : "true",
						 "data-dots" : "false",
						 "data-items" : "1"
					});
					slider.append(tiny);

					for (image of imageList) {
						let imgDiv = $("<div>");
						tiny.append(imgDiv);

						let img = $("<img>").addClass("card-img rounded-2 h-180px").attr("src", image.url);
						imgDiv.append(img);
					};
				};

				// 객실 상세 정보
				let detailLink = $("<a>").addClass("btn btn-link p-0 mb-0 mt-1 text-primary more-hover");
				detailLink.attr({
					"href" : "javascript:;",
					"data-bs-toggle" : "modal",
					"data-bs-target" : "#roomDetail",
					"data-src" : "partnerDetail",
					"data-act" : "clickRoomDetail",
					"data-idx-room" : data.room_idx
				}).html("<i class='bi bi-eye-fill me-1'></i>객실 상세 정보");
				imgCard.append(detailLink);
				
				let contentCard = $("<div>").addClass("col-md-7");
				row.append(contentCard);

				let cardBody = $("<div>").addClass("card-body d-flex flex-column h-100 p-0");
				contentCard.append(cardBody);
				
				// 객실명
				let roomTitle = $("<h5>").addClass("card-title").html(data.name);
				cardBody.append(roomTitle);
				
				// 객실 시설
				let ul = $("<ul>").addClass("nav nav-divider mb-2");
				cardBody.append(ul);
				for (let i = 0; i < 3; i++) {
					let item = data.facilitiesList[i];
					let li = $("<li>").addClass("nav-item").html(item.name);
					ul.append(li);
				};
				
				// 인원
				let p1 = $("<p>").addClass("text-secondary mb-2").html("<i class='fa-solid fa-person-circle-check'></i> 기준 인원 " + data.standard + "인");
				cardBody.append(p1);
				
				let p2 = $("<p>").addClass("text-secondary mb-0").html("<i class='fa-solid fa-person-circle-plus'></i> 최대 인원 " + data.maximum + "인");
				cardBody.append(p2);
				
				// 가격
				let div = $("<div>").addClass("d-sm-flex justify-content-sm-between align-items-center mt-auto");
				cardBody.append(div);
				
				let priceDiv = $("<div>").addClass("d-flex align-items-center");
				div.append(priceDiv);
				
				let price = $("<h5>").addClass("fw-bold mb-0 me-1");
				price.append("<i class='fa-solid fa-won-sign'></i> ");
				price.append(data.basic_price);
				priceDiv.append(price);
				
				let span = $("<span>").addClass("mb-0 me-2").html(" / 일");
				priceDiv.append(span);
				
				// 예약 버튼
				let btnDiv = $("<div>").addClass("mt-3 mt-sm-0");
				div.append(btnDiv);
				
				let reservationLink = $("<a>").addClass("btn btn-sm btn-primary mb-0").attr({
					"href" : "javascript:;",
					"data-src" : "partnerDetail",
					"data-act" : "clickReservation",
					"data-idx-room" : data.room_idx
				}).text("객실 예약");
				btnDiv.append(reservationLink);
			};
		},
	};
	
	// 네이버 지도
	function _mapInit(data) {
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
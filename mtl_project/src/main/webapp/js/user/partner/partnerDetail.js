const partnerDetail = (function() {

	let _offset = 0;

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_eventInit();
		_setSearch();
		_list.setReview();
		_event.clickSearch();
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='partnerDetail'][data-act]").off();
		evo.on("click", function(e) {
			_eventAction(e);
		});
	};
	
	// 검색란 설정
	function _setSearch() {
		// 이전 페이지에서 검색 조건 그대로 가져옴
		let startDate = sessionStorage.getItem("search_start_date");
		let endDate = sessionStorage.getItem("search_end_date");
	    
	    if (startDate == null) {
	    	startDate = "today";
	    	endDate = new Date().fp_incr(1);
		};
		
		if (startDate != null && endDate == "undefined") {
			endDate = new Date(startDate).fp_incr(1);
	    };
   
	    flatpickr($("#searchDate"), {
	        mode: "range",
	        enableTime: false,
	        noCalendar: false,
	        inline: false,
	        animate: "false",
	        position: "top",
	        dateFormat: "Y-m-d",
	        disableMobile: "true",
	        minDate: "today",
	        defaultDate: [startDate, endDate]
	    });
	    
	    let guest = sessionStorage.getItem("search_guest");
	    if (guest != null) {
		    $("#searchGuest").val(guest + " 명");
		    $("#guestText").html(guest);
		    e.guestSelector(guest);
	    }
	};
	
	// 이벤트 분기
	function _eventAction(e) {
		let evo = $(e.currentTarget);
		
		let action = evo.attr("data-act");
		
		let type = e.type;
		
		if (type == "click") {
			if (action == "clickSearch") {
				_event.clickSearch();
			} else if (action == "clickReservation") {
				_event.clickReservation(evo);
			} else if (action == "clickRoomDetail") {
				_event.clickRoomDetail(evo);
			} else if (action == "clickMore") {
				_offset = _offset + 2;
				_list.setReview();
			} else if (action == "clickQuestion") {
				_event.clickQuestion();
			} else if (action == "clickQnaModal") {
				$("#qnaTitle").val("");
				$("#qnaContent").val("");
			}
		};
	};
	
	// 이벤트
	let _event = {
		// 검색 클릭
		clickSearch: function() {
			let partnerIdx = comm.getUrlParam().idx;
        
	        let url = "/user/partner/detail";
	    
	    	// 날짜 문자열 분리
			let [startDate, endDate] = $("#searchDate").val().split(" ~ ").map(date => date.trim());
	        
	        let data = { 
	        	"partner_idx" : partnerIdx,
	        	"start_date" : startDate,
	        	"end_date" : endDate,
	        	"guest" : $("#searchGuest").val().match(/\d+/)[0]
	        };
	        
			comm.sendJson(url, data, "POST", function(resp) {
				_list.setRoom(resp.data);
			});
		},
		
		// 예약 클릭
		clickReservation: function(evo) {
			let roomIdx = evo.attr("data-room-idx");
			let total = evo.attr("data-total-price");
			let one = evo.attr("data-price");
			
			// 날짜 문자열 분리
			let [startDate, endDate] = $("#searchDate").val().split(" ~ ").map(date => date.trim());
				
			// 인원 문자열 분리
			let guest = $("#searchGuest").val().match(/\d+/)[0];

			// 예약 정보를 넘기기 위해 클라이언트 세션에 저장			
			sessionStorage.setItem("search_start_date", startDate);
			sessionStorage.setItem("search_end_date", endDate);
			sessionStorage.setItem("search_guest", guest);
			sessionStorage.setItem("reservation_total_price", total);
			sessionStorage.setItem("reservation_one_price", one);
			
			location.href = "/mtl/reservation?idx=" + roomIdx;
		},
		
		// 객실 상세 정보 클릭
		clickRoomDetail: function(evo) {
			let roomIdx = evo.attr("data-room-idx");
			
			let url = "/user/partner/room/detail";
			
			let data = { "room_idx" : roomIdx };
			
			comm.sendJson(url, data, "POST", function(resp) {
				_draw.drawRoomDetail(resp.data);
			});
		},
		
		// 문의 전송
		clickQuestion: function() {
			let partnerIdx = comm.getUrlParam().idx;
			
			let url = "/user/question/regist";
			
			let data = {
				"partner_idx" : partnerIdx,
				"title" : $("#qnaTitle").val(),
				"content" : $("#qnaContent").val()
			};
			
			modal.confirm({
				"content" : "해당 숙소에 문의하시겠습니까?",
				"confirmCallback" : function() {
					comm.sendJson(url, data, "POST", function(resp) {
						if (resp.result == true) {
							modal.alert({
								"content" : "문의가 완료되었습니다.",
								"confirmCallback": function() {
									$("#qnaModal").modal("hide");
								}
							});
						} else {
							modal.alert({
								"content" : "오류가 발생하였습니다.<br>다시 시도해 주세요."
							});
						}
					});
				}
			});
		}
	};
	
	// 리스트
	let _list = {
		setRoom: function(data) {
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
		    
		    // 이용안내
		    _draw.drawNoticeList(data.noticeList);
		    
		    // 사진
		    let imageList = data.imageList;
		    $("#thumbnail").css("background-image", "url(" + encodeURI(imageList[0].url) + ")");
		    $("#rightImage1").css("background-image", "url(" + encodeURI(imageList[1].url) + ")");
		    $("#rightImage2").css("background-image", "url(" + encodeURI(imageList[2].url) + ")");
		    $("#rightImage3").css("background-image", "url(" + encodeURI(imageList[3].url) + ")");
		    
		    _eventInit();
		    _list.getRoomList();
		},
		
		// 객실 리스트
		getRoomList: function() {
			let partnerIdx = comm.getUrlParam().idx;
        
	        let url = "/user/partner/room/list";
	    
	    	// 날짜 문자열 분리
			let [startDate, endDate] = $("#searchDate").val().split(" ~ ").map(date => date.trim());
	        
	        let data = { 
	        	"partner_idx" : partnerIdx,
	        	"start_date" : startDate,
	        	"end_date" : endDate,
	        	"guest" : $("#searchGuest").val().match(/\d+/)[0]
	        };
	        
	        comm.sendJson(url, data, "POST", function(resp) {
				// 객실
			    _draw.drawRoomList(resp.list);
	        });
		},
		
		setReview: function() {
			let partnerIdx = comm.getUrlParam().idx;
			
			let url = "/user/review/list";
			
			let data = { 
				"partner_idx" : partnerIdx,
				"limit" : 2,
				"offset" : _offset
			 };
			
			comm.sendJson(url, data, "POST", function(resp) {
				if (resp.total <= 2) {
					$("#moreBtn").css("display", "none");
				}
				_draw.drawReview(resp.list);
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
		
		// 이용안내
		drawNoticeList: function(list) {
			let listObj = $("#parterNoticeList").empty();
			for (let data of list) {
				let li = $("<li>").addClass("list-group-item h6 fw-light d-flex mb-0");
				li.append("<i class='bi bi-patch-check-fill text-success me-2'></i>");
				li.append(data.content);
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
				if (imageList.length == 1) {
					let img = $("<img>").addClass("card-img rounded-2 h-180px w-100").attr({
						"src" : imageList[0].url 
					});
					imgCard.append(img);
				} else {
					let slider = $("<div>").addClass("tiny-slider arrow-round arrow-xs arrow-dark overflow-hidden rounded-2");
					imgCard.append(slider);

					let tiny = $("<div>").addClass("tiny-slider-inner").attr({
						 "data-autoplay" : true,
						 "data-arrow" : true,
						 "data-dots" : false,
						 "data-items" : 1
					});
					slider.append(tiny);

					for (image of imageList) {
						let imgDiv = $("<div>");
						tiny.append(imgDiv);

						let img = $("<img>").addClass("h-180px w-100").attr("src", image.url);
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
					"data-room-idx" : data.room_idx
				}).html("<i class='bi bi-eye-fill me-1'></i>객실 상세 정보");
				imgCard.append(detailLink);
				
				let contentCard = $("<div>").addClass("col-md-7");
				row.append(contentCard);

				let cardBody = $("<div>").addClass("card-body d-flex flex-column h-100 p-0");
				contentCard.append(cardBody);
				
				// 객실명
				let roomTitle = $("<h5>").addClass("card-title").html(data.room_type);
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
				
				// 1박 가격
				let div = $("<div>").addClass("d-sm-flex justify-content-sm-between align-items-center mt-3 mt-auto");
				cardBody.append(div);
				
				let priceDiv = $("<div>").addClass("d-flex align-items-center");
				div.append(priceDiv);
				
				let span = $("<span>").addClass("mb-0 me-2").html("1박 / ");
				priceDiv.append(span);

				let price = $("<h5>").addClass("fw-bold mb-0 me-1");
				let [startDate, endDate] = $("#searchDate").val().split(" ~ ").map(date => date.trim());
				startDate = new Date(startDate);
				endDate = new Date(endDate);
				let diffTime = endDate.getTime() - startDate.getTime();
				let diffDays = diffTime / (1000 * 60 * 60 * 24);
				price.append(comm.numberWithComma(Math.round(data.total_price / diffDays)));
				price.append(" <i class='fa-solid fa-won-sign'></i>");
				priceDiv.append(price);
				
				
				// 전체 가격
				let div2 = $("<div>").addClass("d-sm-flex justify-content-sm-between align-items-center");
				cardBody.append(div2);
				
				let priceDiv2 = $("<div>").addClass("d-flex align-items-center");
				div2.append(priceDiv2);
				
				let span2 = $("<span>").addClass("mb-0 me-2").html("전체 / ");
				priceDiv2.append(span2);

				let price2 = $("<h5>").addClass("fw-bold mb-0 me-1");
				price2.append(comm.numberWithComma(data.total_price));
				price2.append(" <i class='fa-solid fa-won-sign'></i>");
				priceDiv2.append(price2);
				
				
				// 예약 버튼
				let btnDiv = $("<div>").addClass("mt-1");
				div2.append(btnDiv);
				
				let reservationLink = $("<a>").addClass("btn btn-sm btn-primary mb-0").attr({
					"href" : "javascript:;",
					"data-src" : "partnerDetail",
					"data-act" : "clickReservation",
					"data-room-idx" : data.room_idx,
					"data-total-price" : data.total_price,
					"data-price" : Math.round(data.total_price / diffDays)
				}).text("객실 예약");
				btnDiv.append(reservationLink);
				
				_eventInit();
			};
			e.tinySlider();
		},
		
		// 객실 상세
		drawRoomDetail: function(data) {
			$("#roomType").html(data.room_type);
			$("#roomDescription").html(data.descrpition);
			
			let imageList = data.imageList;
			
			let roomImageList = $("#roomImageList").empty();
			if (imageList.length == 1) {
				let div = $("<div>");
				roomImageList.append(div);
				
				let img = $("<img>").addClass("rounded-2 h-300px w-100").attr("src", imageList[0].url);
				div.append(img);
			} else {
				for (let image of imageList) {
					let div = $("<div>");
					roomImageList.append(div);
					
					let img = $("<img>").addClass("rounded-2").attr("src", image.url);
					div.append(img);
				};
			};
			
			e.tinySlider2();
			
			let facilitiesList = data.facilitiesList;
			let half = Math.ceil(facilitiesList.length / 2);
			let firstList = facilitiesList.splice(0, half);
			let secondList = facilitiesList.splice(-half);

			let first = $("#facilitiesList1").empty();
			for (let facilities of firstList) {
				let li = $("<li>").addClass("list-group-item d-flex mb-0");
				first.append(li);

				li.append("<i class='fa-solid fa-check-circle text-success me-2'></i>");
				
				let span = $("<span>").addClass("h6 fw-light mb-0").html(facilities.name);
				li.append(span);
			};
			
			let second = $("#facilitiesList2").empty();
			for (let facilities of secondList) {
				let li = $("<li>").addClass("list-group-item d-flex mb-0");
				second.append(li);

				li.append("<i class='fa-solid fa-check-circle text-success me-2'></i>");
				
				let span = $("<span>").addClass("h6 fw-light mb-0").html(facilities.name);
				li.append(span);
			};
		},
		
		// 리뷰 그리기
		drawReview: function(list) {
			let reviewList = $("#reviewList");

			for (let data of list) {
				let flex = $("<div>").addClass("d-md-flex my-4");
				reviewList.append(flex);
	
				let div = $("<div>").addClass("w-100");
				flex.append(div);
				
				let flex2 = $("<div>").addClass("d-flex justify-content-between mt-1 mt-md-0");
				div.append(flex2);
	
				let div2 = $("<div>");
				flex2.append(div2);
	
				let h6 = $("<h6>").addClass("me-3 mb-0");
				h6.append("<i class='fa-solid fa-user-pen'></i> ");
				h6.append(data.user);
				div2.append(h6);

				let ul = $("<ul>").addClass("nav nav-divider small mb-2");
				div2.append(ul);

				let li1 = $("<li>").addClass("nav-item").html(data.create_date);
				ul.append(li1);

				let li2 = $("<li>").addClass("nav-item").html("후기 작성 수 : " + data.user_total_review + " 개");
				ul.append(li2);

				let score = $("<div>").addClass("icon-md rounded text-bg-warning fs-6").html(data.score_avg);
				flex2.append(score);

				let content = $("<p>").addClass("mb-2 space").html(data.content);
				div.append(content);

				if (data.imageList != null) {
					let row = $("<div>").addClass("row g-4");
					div.append(row);

					for (let image of data.imageList) {
						let col = $("<div>").addClass("col-4 col-sm-3 col-lg-2 w-150px h-100px");
						row.append(col);

						let img = $("<img>").addClass("rounded w-100 h-100").attr("src", image.url);
						col.append(img);
					};
				};

				if(data.reply != null) {
					let div = $("<div>").addClass("my-4");
					reviewList.append(div);

					let flex = $("<div>").addClass("d-md-flex p-3 bg-light rounded-3");
					div.append(flex);

					let div2 = $("<div>").addClass("mt-2 mt-md-0");
					flex.append(div2);

					let h6 = $("<h6>").addClass("mb-1");
					h6.append("<i class='fa-solid fa-hotel'></i> ");
					div2.append(h6);

					let p = $("<p>").addClass("mb-0").html(data.reply);
					div2.append(p);
				};

				let hr = $("<hr>");
				reviewList.append(hr);
				
			};
		},
	};
	
	// 네이버 지도
	function _mapInit(data) {
	
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
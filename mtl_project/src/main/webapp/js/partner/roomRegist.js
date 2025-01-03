const roomRegist = (function() {

    function init() {
        getRoomList();  // 페이지 로드 시 room 목록을 가져옴
    	_eventInit();
    }

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='roomRegist'][data-act]").off();
		evo.on("click", function(e) {
			_eventAction(e);
		});
		
		// '등록' 버튼 이벤트 추가
        $("#registerRoom").off("click").on("click", function (e) {
            addRoom(); // 객실 등록 처리
            e.preventDefault();
        });
        
        // '수정' 버튼 이벤트 추가
        $("#updateRoom").off("click").on("click", function (e) {
        	
        	let room_idx=$(this).data("room-idx");
        	console.log(room_idx);
            updateRoom(room_idx); // 객실 등록 처리
            e.preventDefault();
        });
        
		// 이미지 미리보기 생성
        $("#changeFile").off("change").on("change", function (e) {
        	comm.setPreview($(e.currentTarget));
        });
        
        $("#deleteRoom").off("click").on("click", function (e) {
        	
        	let room_idx=$(this).data("room-idx");
        	console.log(room_idx);
            deleteRoom(room_idx); // 객실 등록 처리
            e.preventDefault();
        });
	};
	
	
	
	// 이벤트 분기
	function _eventAction(e) {
		let evo = $(e.currentTarget);
		
		let action = evo.attr("data-act");
		
		let type = e.type;
		console.log(type);
		if(type == "click") {
			if(action == "clickRoomUpdate") {
				_event.clickRoomUpdate(evo);
			};
		};
	};

	let _event = {
		clickRoomUpdate: function(evo){

            const room_idx=evo.attr("data-room-idx");
            const partner_idx=90;

            $.ajax({

                type:"POST",
                url:"/mtl/partner/roomdetail",
                data:{
                    partner_idx:partner_idx,
                    room_idx:room_idx
                },

                success:function(response){
                    console.log("Room detail:",response);

					$("#roomType").val(response.room_type);
					$("#standard_person").val(response.standard);
					$("#basic_price").val(response.basic_price);
					$("#room_count").val(response.count);
					$("#maximum_person").val(response.maximum);
					$("#weekend_price").val(response.weekend_price);
					$("#update_description").val(response.description);
					$("#updateRoom").attr("data-room-idx", response.idx);

                }
            })
			
			
		}
	};
	

    function getRoomList() {
        $.ajax({
            type: "POST",
            url: "/mtl/partner/roomlist",  // API 호출
            data:{partner_idx:90},
            success: function(response) {
	            console.log(response);  // 성공적으로 응답받은 데이터 로그
                _draw.drawRoomList(response);
                _eventInit();
	        },
	        error: function(xhr, status, error) {
	            console.error("Error fetching room list:", error);  // 오류 처리
	            const modalBody = $("#roomRegistModal .modal-body");
	            modalBody.empty();  // 기존 내용 지우기
	            modalBody.append("<p>객실 목록을 가져오는데 실패했습니다. 다시 시도해주세요.</p>");
	        }
        });
    }
	
	function updateRoom(room_idx){
	
		let formData = new FormData();
		
		formData.append("room_idx",room_idx);
		
	    // 폼 데이터 직렬화 및 추가
	    let formElements = $("#frm_update").serializeArray();
	    
	    let optionCnt=0;
	    let imageCnt=0; 
	    
	    console.log("dd",formElements)
	    formElements.forEach(item => {
	        formData.append(item.name, item.value);
	        if(item.name=="option"){
	        	optionCnt++;
	        }
	    });
	    
	    if(optionCnt===0){
	    	alert("객실 옵션을 설정하세요.");
	    	return;
	    }
	
	    // 업로드된 이미지 파일 추가
	    const imageFiles = document.getElementById("roomImageUpdate").files;
	    
	    if(imageFiles.length===0){
	    	alert("숙소 이미지를 등록하세요.");
	    	return;
	    }
	    
	    for (let i = 0; i < imageFiles.length; i++) {
	        formData.append("images", imageFiles[i]);
	    }
        
		formData.forEach((value, key) => {
    		console.log(key, value);
		});

		
		
		$.ajax({
            type: "POST",
            url: "/mtl/partner/roomupdate",  // API 호출
            data:formData,
            processData: false,
            contentType: false,
            success: function(response) {
	            console.log(response);  // 성공적으로 응답받은 데이터 로그
                alert("객실 수정을 완료했습니다.");
                location.reload();
                _eventInit();
	        },
	        error: function(xhr, status, error) {
	            console.error("Error fetching room list:", error);  
	        }
        });
	
    }
    
	function addRoom(){
	
		let formData = new FormData();

	    // 폼 데이터 직렬화 및 추가
	    let formElements = $("#frm").serializeArray();
	    
	    let optionCnt=0;
	    let imageCnt=0; 
	    
	    formElements.forEach(item => {
	        formData.append(item.name, item.value);
	        if(item.name=="option"){
	        	optionCnt++;
	        }
	    });
	    
	    if(optionCnt===0){
	    	alert("객실 옵션을 설정하세요.");
	    	return;
	    }
	
	    // 업로드된 이미지 파일 추가
	    const imageFiles = document.getElementById("roomImageUpload").files;
	    
	    if(imageFiles.length===0){
	    	alert("숙소 이미지를 등록하세요.");
	    	return;
	    }
	    
	    for (let i = 0; i < imageFiles.length; i++) {
	        formData.append("images", imageFiles[i]);
	    }
        
		formData.forEach((value, key) => {
    		console.log(key, value);
		});

		
		
		$.ajax({
            type: "POST",
            url: "/mtl/partner/roomregist",  // API 호출
            data:formData,
            processData: false,
            contentType: false,
            success: function(response) {
	            console.log(response);  // 성공적으로 응답받은 데이터 로그
                alert("객실 등록을 완료했습니다.");
                location.reload();
                _eventInit();
	        },
	        error: function(xhr, status, error) {
	            console.error("Error fetching room list:", error); 
	        }
        });
	
    }
    
    let _draw = {
        drawRoomList: function(list) {
            let roomList = $("#roomList").empty();

            for (let data of  list) {
                let col = $("<div>").addClass("col");
                roomList.append(col);
    
                let card = $("<div>").addClass("card shadow h-100");
                col.append(card);
    
                // 카드 헤더더
                let overayItem = $("<div>").addClass("position-relative");
                card.append(overayItem);
    
                let img = $("<img>").addClass("card-img-top");
                img.attr({
                    //"src" : data.url
                    "src" : "assets/images/category/hotel/4by3/03.jpg"
                });
                overayItem.append(img);

                let overlay = $("<div>").addClass("card-img-overlay d-flex flex-column p-3");
                overayItem.append(overlay);

                let topDiv = $("<div>").addClass("d-flex justify-content-between align-items-center");
                overlay.append(topDiv);

                // 카드 바디
                let cardBody = $("<div>").addClass("card-body px-3");
                card.append(cardBody);

                let title = $("<h5>").addClass("card-title mb-1");
                cardBody.append(title);

                //이동막기
                let titleLink = $("<a>").attr("href", "javascript:;");
                titleLink.html(data.name);
                title.append(titleLink);

                let ul = $("<ul>").addClass("list-group list-group-borderless small mt-2 mb-0");
                cardBody.append(ul);

                let li = $("<li>").addClass("list-group-item pb-0");
                li.append("<i class='fa-solid fa-building fa-fw me-2'></i>");
                li.append("객실 수 : " + data.count + "개");
                ul.append(li);

                let li2 = $("<li>").addClass("list-group-item pb-0");
                li2.append("<i class='fa-solid fa-person-circle-check fa-fw me-2'></i>");
                li2.append("기준 인원 : " + data.standard + "인");
                ul.append(li2);

                let li3 = $("<li>").addClass("list-group-item pb-0");
                li3.append("<i class='fa-solid fa-person-circle-plus fa-fw me-2'></i>");
                li3.append("최대 인원 : " + data.maximum + "인");
                ul.append(li3);
                //  Card body END

                let cardFooter = $("<div>").addClass("card-footer pt-0");
                card.append(cardFooter);

                let priceDiv = $("<div>").addClass("hstack gap-2 mb-2");
                cardFooter.append(priceDiv);

                let h6 = $("<h6>").addClass("hstack gap-2 mb-2").append(data.basic_price + "원");
                priceDiv.append(h6);

                let btnDiv = $("<div>").addClass("hstack gap-2 mb-2");
                cardFooter.append(btnDiv);

                let btnLink1 = $("<a>").addClass("btn btn-sm btn-dark-soft mb-0 w-50").html("수정");
                btnLink1.attr({
                    "data-bs-toggle" : "modal",
                    "data-bs-target" : "#roomRegistModal",
                    "role" : "button",
                    "data-src" : "roomRegist",
                    "data-act" : "clickRoomUpdate",
                    "data-room-idx" : data.room_idx,
                    "href" : "javascript:;"
                });
                btnDiv.append(btnLink1);

                let btnLink2 = $("<a>").addClass("btn btn-sm btn-danger-soft mb-0 w-50").html("삭제");
                btnLink2.attr({
                	"role" : "button",
                    "data-room-idx" : data.room_idx,
                    "href" : "javascript:;",
                    "id": "deleteRoom"
                })
                btnDiv.append(btnLink2);
            }
        }
    }

 

    return {
        init
    };

})();
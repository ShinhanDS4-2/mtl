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

            let room_idx=evo.attr("data-room-idx");
            
            console.log(room_idx);

            $.ajax({

                type:"POST",
                url:"/mtl/partner/roomdetail",
                data:{
                    room_idx:room_idx
                },

                success:function(response){
                    console.log("Room detail:",response);
						
					const roomInfo = response.roomInfo;

				    $("#roomType").val(roomInfo.room_type);
				    $("#standard_person").val(roomInfo.standard);
				    $("#basic_price").val(roomInfo.basic_price);
				    $("#room_count").val(roomInfo.count);
				    $("#maximum_person").val(roomInfo.maximum);
				    $("#weekend_price").val(roomInfo.weekend_price);
				    $("#update_description").val(roomInfo.description);
				    $("#updateRoom").attr("data-room-idx", roomInfo.idx);
				    
				    const roomFacilities = response.roomFacilitiesInfo;
				    $("input[name='option']").prop("checked", false);
	
	                roomFacilities.forEach((facility) => {
	                    const facilityValue = facility.facilities_idx; 
	                    $(`input[name='option'][value='${facilityValue}']`).prop("checked", true);
	                });
	                
	                const imageUrl=response.imageUrl;
	                const previewContainer = $("#preview");

	                // 기존 미리보기 초기화
	                previewContainer.empty();
	
	                // 각 이미지 URL을 사용해 미리보기 생성
	                imageUrl.forEach((imageObj) => {
	                	
	                	let url=imageObj.url;
	                	console.log("url =" ,url);
	                    let imgElement = `
	                        <div class="border rounded d-flex justify-content-center align-items-center" 
	                             style="width: 150px; height: 100px; overflow: hidden; position: relative;">
	                            <img src="${url}" alt="Room Image" style="width: 100%; height: 100%; object-fit: cover;">
	                        </div>
	                    `;
	                    previewContainer.append(imgElement);
	                });
                },
	            error: function (err) {
	                console.error("Error fetching room details:", err);
	            },
            });		
		}
	};
	
	//전체 조회
    function getRoomList() {
    
        $.ajax({
            type: "POST",
            url: "/mtl/partner/roomlist",  // API 호출
            data:{},
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
	
	//삭제
	function deleteRoom(room_idx){
	
		$.ajax({
            type: "POST",
            url: "/mtl/partner/roomdelete",  // API 호출
            data: {room_idx : room_idx},
            success: function(response) {
	            console.log(response);  // 성공적으로 응답받은 데이터 로그
                modal.alert({
                	"content" : "객실을 삭제했습니다.",
                	"confirmCallback" : function() {
		                location.reload();
		                _eventInit();
                	}
                });
	        },
	        error: function(xhr, status, error) {
	            console.error("Error fetching room list:", error);  
	        }
        });
		
	}
	
	//수정
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
	    	modal.alert({ "content" : "객실 옵션을 설정하세요." });
	    	return;
	    }
	
	    // 업로드된 이미지 파일 추가
	    const imageFiles = document.getElementById("changeFile").files;

	    
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
                modal.alert({
                	"content" : "객실을 수정하였습니다.",
                	"confirmCallback" : function() {
		                location.reload();
		                $("#roomRegistModal").modal("hide");
		                _eventInit();
                	}
                });
	        },
	        error: function(xhr, status, error) {
	            console.error("Error fetching room list:", error);  
	        }
        });
	
    }
    
    //등록
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
	    	modal.alert({ "content" : "객실 옵션을 설정하세요." });
	    	return;
	    }
	
	    // 업로드된 이미지 파일 추가
	    const imageFiles = document.getElementById("roomImageUpload").files;
	    
	    if(imageFiles.length===0){
	    	modal.alert({ "content" : "숙소 이미지를 등록하세요." });
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
                modal.alert({
                	"content" : "객실을 등록했습니다.",
                	"confirmCallback" : function() {
                		window.scrollTo(0,0);
                		document.getElementById("frm").reset();
                		$("#imagePreviewContainer").empty();
                		getRoomList();
                		document.getElementById("listTab").click();
		                _eventInit();
                	}
                });
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
                    "src" : data.image_url,
                    "style": "width: 100%; height: 200px; object-fit: cover; object-position: center;"
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
                titleLink.html(data.room_type);
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

                let h6 = $("<h6>").addClass("hstack gap-2 mb-2").append("평일: " + comm.numberWithComma(data.basic_price) + "원");
                priceDiv.append(h6);

				let priceDiv2 = $("<div>").addClass("hstack gap-2 mb-2");
                cardFooter.append(priceDiv2);

                let h62 = $("<h6>").addClass("hstack gap-2 mb-2").append("주말: " + comm.numberWithComma(data.weekend_price) + "원");
                priceDiv2.append(h62);

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
	
	$(document).on("click", "#deleteRoom", function (e) {
	    e.preventDefault();
	
	    let room_idx = $(this).data("room-idx");
	    console.log(room_idx);
		
		modal.confirm({
	        "content": "정말 삭제하시겠습니까?",
	        "confirmCallback": function() {
	            deleteRoom(room_idx); 
	            _eventInit(); 
	        }
	    });
	});
	
	// 이미지를 선택하면 미리보기로 보여주는 코드
	document.getElementById("roomImageUpload").addEventListener("change", function(e) {
	    const files = e.target.files;
	    const previewContainer = document.getElementById("imagePreviewContainer");
	
	    // 기존 미리보기 이미지를 비웁니다
	    previewContainer.innerHTML = '';
	
	    // 선택된 이미지들을 미리보기로 추가
	    Array.from(files).forEach(file => {
	        const reader = new FileReader();
	
	        reader.onload = function(event) {
	            // 미리보기 이미지 생성
	            const imgElement = document.createElement("div");
	            imgElement.classList.add("position-relative");
	
	            const img = document.createElement("img");
	            img.src = event.target.result; // FileReader로 읽어온 이미지 URL
	            img.alt = "숙소 사진";
	            img.classList.add("rounded", "border");
	            img.style.width = "150px";
	            img.style.height = "100px";
	            img.style.objectFit = "cover";
	            img.addClass("me-2");
	
	            imgElement.appendChild(img);
	            previewContainer.appendChild(imgElement);
	        };
	
	        reader.readAsDataURL(file); // 파일을 Data URL로 읽어들입니다
	    });
	});
	

 	
    return {
        init
    };

})();
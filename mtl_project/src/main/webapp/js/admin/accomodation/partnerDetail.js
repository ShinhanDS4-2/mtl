const partnerDetail = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {

		_eventInit();
        fetchDetail();
	};

	// 이벤트 초기화 
	function _eventInit() {

	};

    function getIdxFromUrl(){

        let urlParams=new URLSearchParams(window.location.search);
        return urlParams.get('idx');
    }

    function fetchDetail(){

        let idx=getIdxFromUrl();

        $.ajax({
            url:"/mtl/admin/accomodation/detail",
            type: "POST",
            data:{idx:idx},
            success:function(response){

                _draw.drawAnswerList(response.list);
                _draw.insertInfo(response.list);
                _draw.insertImage(response.images);
            },
            error:function(xhr,status,error){
                console.log("상세 데이터 가져오기 실패: ",error);
            }
            
        });
    }
	
	let _draw={

        insertImage: function (images) {

            let imageList = $("#images").empty(); 
        
            let col = `
                <div class="col-xxl-6">
                    <div class="row g-2 g-sm-4">
                        <div class="col-6">
                            <a data-glightbox data-gallery="gallery" href="${images[0]}">
                                <div class="card card-element-hover card-overlay-hover overflow-hidden">
                                    <!-- Image -->
                                    <img src="${images[0]}" alt="" style="width: 100%; height: 250px; object-fit: cover;">
                                    <!-- Full screen button -->
                                    <div class="hover-element w-100 h-100">
                                        <i class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-6">
                            <a data-glightbox data-gallery="gallery" href="${images[1]}">
                                <div class="card card-element-hover card-overlay-hover overflow-hidden">
                                    <!-- Image -->
                                    <img src="${images[1]}" alt="" style="width: 100%; height: 250px; object-fit: cover;">
                                    <!-- Full screen button -->
                                    <div class="hover-element w-100 h-100">
                                        <i class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-6">
                            <a data-glightbox data-gallery="gallery" href="${images[2]}">
                                <div class="card card-element-hover card-overlay-hover overflow-hidden">
                                    <!-- Image -->
                                    <img src="${images[2]}" alt="" style="width: 100%; height: 250px; object-fit: cover;">
                                    <!-- Full screen button -->
                                    <div class="hover-element w-100 h-100">
                                        <i class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-6">
                            <a data-glightbox data-gallery="gallery" href="${images[3]}">
                                <div class="card card-element-hover card-overlay-hover overflow-hidden">
                                    <!-- Image -->
                                    <img src="${images[3]}" alt="" style="width: 100%; height: 250px; object-fit: cover;">
                                    <!-- Full screen button -->
                                    <div class="hover-element w-100 h-100">
                                        <i class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            `;
        
            imageList.append(col);
        },

        insertInfo:function(list){

            let info = $("#info").empty();

            let col = `
                <div class="col-xxl-6 mb-5">
                    <h4>${list[0].name}</h4>
                    <p class="mb-2 mb-sm-0">
                        <i class="bi bi-geo-alt me-1 text-primary"></i>${list[0].address}
                    </p>
                    <p class="mb-4">${list[0].description}</p>		
                </div>
            `;
    
            info.append(col);
        },

        drawAnswerList:function(list){

            let answerList=$("#answerList").empty();
            let index=1;

            for(let data of list){

                
                let row = $("<div>").addClass("row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4 text-center d-flex justify-content-center align-items-center");
                answerList.append(row);

                let num_col=$("<div>").addClass("col");
                row.append(num_col);

                let num_h6=$("<h6>").addClass("ms-1 mb-0 fw-normal").html(index++);
                num_col.append(num_h6);

                let type_col=$("<div>").addClass("col");
                row.append(type_col);

                let type_h6=$("<h6>").addClass("ms-1 mb-0 fw-normal").html(data.room_type);
                type_col.append(type_h6);

                let standard_col=$("<div>").addClass("col");
                row.append(standard_col);

                let standard_h6=$("<h6>").addClass("ms-1 mb-0 fw-normal").html(data.standard+"인");
                standard_col.append(standard_h6);

                let max_col=$("<div>").addClass("col");
                row.append(max_col);

                let max_h6=$("<h6>").addClass("ms-1 mb-0 fw-normal").html(data.maximum+"인");
                max_col.append(max_h6);
                
                let basicPrice_col=$("<div>").addClass("col");
                row.append(basicPrice_col);

                let basicPrice_h6=$("<h6>").addClass("ms-1 mb-0 fw-normal").html(data.basic_price+"원");
                basicPrice_col.append(basicPrice_h6);

                let weekendPrice_col=$("<div>").addClass("col");
                row.append(weekendPrice_col);

                let weekendPrice_h6=$("<h6>").addClass("ms-1 mb-0 fw-normal").html(data.weekend_price+"원");
                weekendPrice_col.append(weekendPrice_h6);
            }


        }
    }
	return {
		init,
	};
})();
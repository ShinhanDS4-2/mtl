const comm = {
	prefix: "/mtl/api",
	
	// ajax 기본 통신
	send: function(url_v, data_v, method, successCallback, errorCallback) {
		// url
		url_v = this.prefix + url_v;
		
		$.ajax({
			type: method,
			url: url_v,
			data: data_v,
			success: successCallback,
			error: errorCallback
		});
	},
	
	sendJson: function(url_v, data_v, method, successCallback, errorCallback) {
		// url
		url_v = this.prefix + url_v;
		
		$.ajax({
			type: method,
			url: url_v,
			contentType: "application/json",
			data: JSON.stringify(data_v),
			success: successCallback,
			error: errorCallback
		});
	},
	
	// ajax 파일 통신
	sendFile: function(url_v, data_v, method, successCallback, errorCallback) {
		// url
		url_v = this.prefix + url_v;
		
		let fData = new FormData();
		if (data_v instanceof FormData) {
			let entries = data_v.entries();
			let obj = {};
			for(let pair of entries) {
				let key = pair[0];
				let value = pair[1];
				
				if (value instanceof File) {
					fData.append(key, value);
				} else {
					obj[key] = value;
				}
			}
		}
		
		$.ajax({
			type: method,
			url: url_v,
			data: data_v,
			contentType : false,
		    processData: false,
		    enctype: "multipart/form-data",
		    xhrFields: {
		          withCredentials: true
		    },
		    cache: false,
			success: successCallback,
			error: errorCallback
		});
	},
	
	// 이메일 형식 검증
    validateEmail: function(email) {
        const regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        return regex.test(email);
    },
    
    // url 파라미터 가져오기
    getUrlParam: function() {
		let data = null;
		let search = location.search.substring(1);
		
		if (search) {
			data = {};
			
			let split = search.split("&");
			
			for (let str of split) {
				let split2 = str.split("=");
				
				let key = split2[0];
				let value = split2[1];
				
				if(!isNaN(value)) {
					value = parseInt(value);
				};
				
				data[key] = value;
			};
		};
		
		return data;
	},
	
	// 위도 경도로 지도 세팅
	setMapWithGeo: function(option) {
		// 지도 옵션
        let _option = {
        	// 지도를 띄울 영역
        	mapObj : "map",
        	// 확대 레벨
			zoom : 15,
			// 위도 경도
			latitude : 37,
			hardness : 127
        }
        
        _option = $.extend(_option, option);
	
		// 지도 옵션 설정
        let mapOptions = {
            center: new naver.maps.LatLng(_option.latitude, _option.hardness),
            zoom: _option.zoom
        };

        // 지도 생성
        let map = new naver.maps.Map(_option.mapObj, mapOptions);
        
        // 마커 추가
        let marker = new naver.maps.Marker({
            position: new naver.maps.LatLng(_option.latitude, _option.hardness), // 마커 위치
            map: map 
        });
	},
	
	// 3자리마다 , 찍어서 반환
	numberWithComma: function(num) {
    	if (num == null || num == undefined) return "";

    	return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    },
    
	// 년월일로 반환
    formatDate: function(date) {
	    let [year, month, day] = date.split("-");
	
	    return `${year}년 ${month}월 ${day}일`;
	},
	
	// 예약 코드 반환
	makeReservationCode: function(idx) {
	    let now = new Date();
	
	    // 날짜
	    let year = now.getFullYear(); 
	    let month = String(now.getMonth() + 1).padStart(2, '0'); 
	    let date = String(now.getDate()).padStart(2, '0');
	    let hours = String(now.getHours()).padStart(2, '0'); 
	    let minutes = String(now.getMinutes()).padStart(2, '0');
	    let seconds = String(now.getSeconds()).padStart(2, '0'); 
	
	    // 랜덤 숫자 4자리
	    let random = Math.floor(Math.random() * 10000).toString().padStart(4, '0');
	
	    return `PRCD-${idx}-${year}${month}${date}${hours}${minutes}${seconds}${random}`;
	},
	
	// 다음 주소 입력
	findAddress: function() {
		new daum.Postcode({
		    oncomplete: function (data) {
		        let address = ""; // 주소
		        let addressObj = document.getElementById("address"); // 주소
		        let addressSi = document.getElementById("addressSi"); // 시군구
		        let addressDong = document.getElementById("addressDong"); // 동
		
		        if (data.userSelectedType === "R") { // 도로명 주소
		            address = data.roadAddress;
		        } else { // 지번 주소
		            address = data.jibunAddress;
		        };
		        
				// 각 필드에 주소값을 넣는다.
		        addressObj.value = address;
		        addressSi.value = data.sigungu;
		        addressDong.value = data.bname;
		    }
		}).open();
	},
	
	// 이미지 미리보기
	setPreview: function(evo) {
		let files = evo.get(0).files;
		let preview = $("#preview");
		
		if (files && files.length > 0) {
            preview.empty();

            Array.from(files).forEach(file => {
                let reader = new FileReader();
                reader.onload = function(e) {
                	let div = $("<div>").addClass("position-relative me-3");
                	preview.append(div);
                	
                    let img = $("<img>").addClass("preview rounded border").attr("src", e.target.result);
                    div.append(img);
                };
                reader.readAsDataURL(file);
            });
        };
	},
	
	// 폼데이터로 변경
	changeFormData: function(data) {
        let formData = new FormData();
        let keys = Object.keys(data);

        for (let key of keys) {
            let value = data[key];
			if (value instanceof FileList) {
				for (let file of value) {
					formData.append(key, file);
				}
			} else {
				formData.append(key, value);
			} 
        }

        return formData;
    },
}
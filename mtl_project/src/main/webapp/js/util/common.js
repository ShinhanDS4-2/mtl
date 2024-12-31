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
			data: fData,
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
	}
}
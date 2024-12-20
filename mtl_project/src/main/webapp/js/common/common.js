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
}
const modal = (function() {
	/*
		alert 모달
		옵션 : {
				content : 내용
				confirmCallback : 확인 누른 후 콜백함수
			  }
	*/
	function alert(option) {
		let modal_o = $("<div>").addClass("modal fade").attr({
			"data-bs-backdrop": "static",
			"data-bs-keyboard": false,
			"tabindex": -1,
			"aria-hidden": true,
		});
		{
			let dialog_o = $("<div>").addClass("modal-dialog modal-dialog-centered modal-sm");
			modal_o.append(dialog_o);
			
			let content_o = $("<div>").addClass("modal-content").css({
				"border" : "1px solid #85878a",
				"text-align": "left"
			});
			dialog_o.append(content_o);
			
			{
				let body_o = $("<div>").addClass("modal-body");
				content_o.append(body_o);
				
				if(option.content != null) {
					body_o.append("<p class='m-2'>" + option.content + "</p>");
				}
			}
			{
				let footer_o = $("<div>").addClass("modal-footer");
				content_o.append(footer_o);
				
				let confirm_o = $("<button>").addClass("btn btn-primary").html("확인");
				footer_o.append(confirm_o);
				
				confirm_o.off("click");
				confirm_o.on("click", function(){
					$(modal_o).modal("hide");
					if(typeof(option.confirmCallback) == "function") {
						option.confirmCallback();
					}
				});
			}
		}
		
		$(document.body).append(modal_o);
		
		$(modal_o).modal("show");
		
		$(modal_o).off("hidden.bs.modal");
		$(modal_o).on("hidden.bs.modal", function(){
			$(modal_o).remove();
		});
	}
	
	/*
		confirm 모달
		옵션 : {
				content : 내용
				cancelCallback : 취소 누른 후 콜백함수
				confirmCallback : 확인 누른 후 콜백함수
			  }
	*/
	function confirm(option) {
		let modal_o = $("<div>").addClass("modal fade").attr({
			"data-bs-backdrop": "static",
			"data-bs-keyboard": false,
			"tabindex": -1,
			"aria-hidden": true,
		});
		{
			let dialog_o = $("<div>").addClass("modal-dialog modal-dialog-centered modal-sm");
			modal_o.append(dialog_o);
			
			let content_o = $("<div>").addClass("modal-content").css({
				"border" : "1px solid #85878a",
				"text-align": "left"
			});
			dialog_o.append(content_o);
			
			{
				let body_o = $("<div>").addClass("modal-body");
				content_o.append(body_o);
				
				if(option.content != null) {
					body_o.append("<p 'class=m-2'>" + option.content + "</p>");
				}
			}
			{
				let footer_o = $("<div>").addClass("modal-footer");
				content_o.append(footer_o);
				
				let cancel_o = $("<button>").addClass("btn btn-secondary").html("취소");
				footer_o.append(cancel_o);
				
				cancel_o.off("click");
				cancel_o.on("click", function(){
					$(modal_o).modal("hide");
					if(typeof(option.cancelCallback) == "function") {
						option.cancelCallback();
					}
				});
				
				let confirm_o = $("<button>").addClass("btn btn-primary").html("확인");
				footer_o.append(confirm_o);
				
				confirm_o.off("click");
				confirm_o.on("click", function(){
					$(modal_o).modal("hide");
					if(typeof(option.confirmCallback) == "function") {
						option.confirmCallback();
					}
				});
			}
		}
		
		$(document.body).append(modal_o);
		
		$(modal_o).modal("show");
		
		$(modal_o).off("hidden.bs.modal");
		$(modal_o).on("hidden.bs.modal", function(){
			$(modal_o).remove();
		});
	}
	
	return {
		alert,
		confirm
	}
})();
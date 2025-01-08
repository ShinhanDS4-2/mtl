const info = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_setInfo();
		_eventInit();
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='info'][data-act]").off();
		evo.on("click", function(e) {
			_eventAction(e);
		});
	};
	
	// 이벤트 분기
	function _eventAction(e) {
		let evo = $(e.currentTarget);
		
		let action = evo.attr("data-act");
		
		let type = e.type;
		
		if(type == "click") {
		
			if(action == "updateInfo") {
				_event.updateInfo();
			} else if(action == "changePassword") {
				_event.changePassword();
			} else if(action == "updateBusinessInfo") {
				_event.updateBusinessInfo();
			};
		};
	};
	
	// 이벤트
	let _event = {
		// 마이페이지 회원 정보 수정
		updateInfo: function() {
            const formData = {
                partnerIdx: $("#partnerIdx").val(),
                name: $("#name").val(),
                phone: $("#phone").val()
            };
            
	        // 유효성 검사
		    if (!formData.phone) {
		    	modal.alert({
		    		"content" : "연락처를 입력해주세요."
		    	});
		        return;
		    }
			if (!/^010-\d{3,4}-\d{4}$/.test(formData.phone)) {
				modal.alert({
		    		"content" : "올바른 연락처를 입력하세요.<br>형식은 010-0000-0000입니다."
		    	});	
			    return;
			}
			
			// 서버로 데이터 전송
        	modal.confirm({
        		"content" : "정보를 수정하시겠습니까?",
        		"confirmCallback" : function() {
		            comm.send("/partner/update", formData, "POST", function(response) {
		                if (response.result == true) {
		                	modal.alert({
					    		"content" : "내 정보 수정이 완료되었습니다.",
					    		"confirmCallback" : function() {
				                    location.reload();
					    		}
					    	});
		                } else {
		                	modal.alert({
					    		"content" : "내 정보 수정에 실패했습니다. 다시 시도해주세요."
					    	});
		                }
		            }, function(error) {
		            	modal.alert({
				    		"content" : "내 정보 수정 중 오류가 발생했습니다. 다시 시도해주세요."
				    	});
		            });
	    		} 
        	});
        },
        
        
        // 비밀번호 변경
        changePassword: function() {
        	modal.confirm({
        		"content" : "비밀번호를 변경하시겠습니까?",
        		"confirmCallback" : function() {
		        	const formData = {
		        		password: $("#password").val(),
		                newPassword: $("#newPassword").val(),
		                confirmPassword: $("#confirmPassword").val(),
		        	};
		        
			        // 유효성 검사
			        if (!formData.password) {
						alert("기존 비밀번호를 입력해주세요.");
			            return;
			        }
			        if (!formData.newPassword) {
						alert("새 비밀번호를 입력해주세요.");
			            return;
			        }
			        if (formData.newPassword !== formData.confirmPassword) {
			            alert("새 비밀번호와 일치하지 않습니다.");
			            return;
			        }
			        	
			        // 서버로 데이터 전송
		            comm.send("/partner/changePassword", formData, "POST", function(response) {
		                if (response.result) {
		                	modal.alert({
		                		"content" : response.message,
		                		"confirmCallback" : function() {
				                    location.href = "/mtl/partner/mypage";
		                		}
		                	});
		                } else {
		                	modal.alert({
		                		"content" : response.message
		                	});
		                }
		            }, function(error) {
		            	modal.alert({
		            		"content" : "비밀번호 변경 중 오류가 발생했습니다.<br>다시 시도해주세요."
		            	});
		            });
        		}
        	});
        },
    	
    	// 마이페이지 업체 정보 수정
    	updateBusinessInfo: function() {
    		modal.confirm({
    			"content" : "정보를 수정하시겠습니까?",
				"confirmCallback" : function() {
					const formData = {
						partnerIdx: $("#partnerIdx").val(),
			        	account_bank: $("#account_bank").val(),
			        	account_number: $("#account_number").val(),
					};
		
					// 유효성 검사
					if (!formData.account_bank) {
						modal.alert({
		            		"content" : "정산계좌 은행을 선택해주세요."
		            	});
				        return;
				    }
				    if (!formData.account_number) {
				    	modal.alert({
		            		"content" : "계좌번호를 입력해주세요."
		            	});
				        return;
				    }
			
					// 서버로 데이터 전송
				    comm.send("/partner/businessupdate", formData, "POST", function(response) {
				        if (response.result) {
				        	modal.alert({
			            		"content" : "업체 정보 수정이 완료되었습니다.",
			            		"confirmCallback": function() {
						            location.reload();
			            		}
			            	});
				        } else {
				        	modal.alert({
			            		"content" : "업체 정보 수정에 실패했습니다. 다시 시도해주세요."
			            	});
				        }
				    }, function(error) {
				    	modal.alert({
		            		"content" : "업체 정보 수정 중 오류가 발생했습니다. 다시 시도해주세요."
		            	});
				    });
				}    			
    		});
		},	
    };
    
    // 정보 세팅
    function _setInfo() {
		comm.send("/partner/info", null, "POST", function(response) {
			// select
			let element = document.getElementById("account_bank");
			let choices = "";
		    if (element) {
		        choices = new Choices(element, {
		            searchEnabled: false, 
		        });
		    };
		    
		    if (response.account_bank != null) {
		        // 선택 값 변경
		        choices.setChoiceByValue(response.account_bank);
			};
			
			$("#name").val(response.name);
			$("#email").val(response.email);
			$("#phone").val(response.phone);
			
			$("#businessName").val(response.business_name);
			$("#business_number").val(response.business_number);
			$("#address").val(response.address);
			$("#business_phone").val(response.business_phone);
			$("#account_bank").val(response.account_bank);
			$("#account_number").val(response.account_number);
			
			if (response.password_update_date != null) {
				$("#passwordUpdateDate").html(response.password_update_date);
			} else {
				$("#passwordUpdateDate").html("-");
			};
        }, function(error) {
        
        });
	};
	
	return {
		init,
	};
})();
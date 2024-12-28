const partnerList = (function() {

	// js 로딩 시 이벤트 초기화 실행
	function init() {
		_eventInit();
		_randomBanner();
		_list.getPartnerList();
	};

	// 이벤트 초기화 
	function _eventInit() {
		let evo = $("[data-src='partnerList'][data-act]").off();
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
			if (action == "clickPartner") {
				_event.clickPartner(evo);
			} else if (action == " clickSearchBtn") {
				_list.getPartnerList();
			}
		};
	};
	
	// 이벤트
	let _event = {
		clickPartner: function(evo) {
			let partnerIdx = evo.attr("data-partner-idx");
			location.href = "/mtl/partner/detail?idx=" + partnerIdx;
		},
	};
	
	// 리스트
	let _list = {
		// 숙소 리스트
		getPartnerList: function(curPage = 1) {
			let url = "/user/partner/search/list";

			let data = {};

			// 검색 파라미터
			_setSearchParam(data);
			
			// 페이징
			let pageOption = {
				limit: 5
			};
			
			let page = $("#pagination").customPaging(pageOption, function(_curPage){
				_list.getPartnerList(_curPage);
			});
			
			let pageParam = page.getParam(curPage);
			
			if(pageParam) {
				data.offset = pageParam.offset;
				data.limit = pageParam.limit;
			};
			// 페이징 끝
			
			comm.send(url, data, "POST", function(resp) {
				console.log(resp);
				
				page.drawPage(resp.totalCnt);
				
			});
		}
	};
	
	// 검색 파라미터 설정
	function _setSearchParam(data) {
		// 날짜 문자열 분리
		let [startDate, endDate] = $("#searchDate").val().split(" ~ ").map(date => date.trim());
			
		// 인원 문자열 분리
		let guest = $("#searchGuest").val().match(/\d+/)[0];
		
		// data 객체 안에 값 설정
		data.startData = startDate;
		data.endData = endDate;
		data.guest = guest;
		data.area = $("#searchArea option:selected").val();
	};
	
	// 배너 랜덤으로 변경
	function _randomBanner() {
		let num = Math.floor(Math.random() * 7) + 1;
		$("#banner").css("background-image","url(assets/images/banner/" + num +".jpg)");
	};

	return {
		init,
	};
})();
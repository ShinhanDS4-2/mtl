(function() {
    $.fn.customPaging = function(option, callback) {

        // 페이징 옵션
        let _option = {
            // 보여질 게시글 수
            limit: 10,
            // 보여질 페이지 수
            showPageNum: 5
        }
        
        _option = $.extend(_option, option);

        let _pagingObj = this;      // 페이징 오브젝트
        let _curPage = 1;           // 현재 페이지
        let _offset = 0;            // 첫행 게시글 번호
        let _totalCount = 0;        // 전체 게시글 수
        let _totalPage = 0;         // 전체 페이지 수
        let _startPage = 0;         // 시작 페이지
        let _endPage = 0;           // 끝 페이지

        let _callback = callback;

        // 리밋 설정
        function _setLimit(limit) {
      	  _option.limit = limit;
        };
        
        // 파라미터 구하기
        function _getParam(curPage) {
            if (curPage) {
                _curPage = curPage;
            };
            
            let limit = _option.limit;
            _offset = (_curPage - 1) * limit;

            return {
                limit: limit,
                offset: _offset
            };
        };

        // 페이지 숫자자 그리기 
        function _drawPage(totalCount) {
            let limit = _option.limit;
            let showPageNum = _option.showPageNum;

            _totalCount = totalCount;
            _totalPage = _totalCount == 0 ? 1 : Math.ceil(totalCount / limit);
            _startPage = Math.floor((_curPage - 1) / showPageNum) * showPageNum + 1;
            _endPage = _startPage + showPageNum - 1;

            if (_endPage > _totalPage) {
                _endPage = _totalPage;
            }
            
            // 현재 페이지가 총 페이지 수보다 크면 현재 페이지를 1로
            if(_curPage > _totalPage) {
				_curPage = 1;
			}

            // 페이지 html 비우기
            $(_pagingObj).html("");
            
            let firstDisabled = "";
            let lastDisabled = "";
           
            // 1페이지는 이전 버튼에 disabled 클래스 추가
            if (_curPage == 1) {
				firstDisabled = " disabled";
            };
                    
			//이전버튼
			let prevLi = $("<li>").addClass("page-item" + firstDisabled);
			let prev = $("<a>").addClass("page-link").attr({ "href": "javascript:;", "aria-label": "Previous" }).html("<i class='fa-solid fa-angle-left'></i>");
        	_pagingObj.append(prevLi.append(prev));

        	//이전버튼 이벤트 바인딩
        	$(prev).off();
            $(prev).on("click", function() {
                _clickPage( Number(_curPage) - 1);
            });

            // 페이지 숫자들들
            for (let i = _startPage; i <= _endPage; i++) {
                let li = $("<li>").addClass("page-item mb-0");
               
                if (i == _curPage) {
                    li.addClass("active");
                };

                let link = $("<a>").addClass("page-link").attr({ "href": "javascript:;", "data-page": i }).text(i);
                li.append(link);

                $(link).off();
                $(link).on("click", function(ev) {
                    let target = ev.currentTarget;
                    let pageNum = $(target).attr("data-page");
                    _clickPage(pageNum);
                });

                $(_pagingObj).append(li);
            };
            
            // 마지막 페이지는 다음 버튼에 disabled 클래스 추가
			if(_curPage == _totalPage){
				lastDisabled = " disabled";
			};

			//다음버튼
			let nextLi = $("<li>").addClass("page-item" + lastDisabled);
            let next = $("<a>").addClass("page-link").attr({ "href": "javascript:;", "aria-label": "Next" }).html("<i class='fa-solid fa-angle-right'></i>");
            _pagingObj.append(nextLi.append(next));
            
            //다음버튼 이벤트 바인딩
            $(next).off();
            $(next).on("click", function() {
                _clickPage( Number(_curPage) + 1);
            });
            
        };

        // 페이지 클릭 이벤트
        function _clickPage(pageNum) {
            if (typeof(_callback) == "function") {
                _curPage = pageNum;
                _callback(pageNum);
            }
        }

        return {
        	setLimit: function(limit) {
        		_setLimit(parseInt(limit));
        	},
        	
            getParam: function(curPage) {
                return _getParam(curPage);
            },

            drawPage: function(totalCount) {
                _drawPage(totalCount);
            },

            getCurPage: function() {
                return _curPage;
            }
        };
    };

}());
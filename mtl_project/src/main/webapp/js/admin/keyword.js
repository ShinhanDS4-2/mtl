$("#keywordRegisterModal .btn-dark-soft").on("click", function() {
    const keyword = $("#placeName").val();  // 입력한 키워드 값
    console.log(keyword);
    if (!keyword) {
        alert("키워드를 입력해주세요.");
        return;
    }

    $.ajax({
        url: "dupleKeyword",  // 중복 확인을 위한 URL (Controller에서 매핑 필요)
        method: "POST",  // POST 방식
        data: {
            "keyword": keyword  // 입력한 키워드
        },
        success: function(resp) {
        	console.log(resp);
            if (resp == 1) {  // 중복 키워드가 있을 경우
                alert("이미 사용 중인 키워드입니다.");
                $("#placeName").attr("disabled", "disabled");  // 키워드 입력 비활성화
            } else {  // 중복이 없으면
                alert("사용 가능한 키워드입니다.");
                $("#placeName").removeAttr("disabled");  // 키워드 입력 활성화
            }
        },
        error: function() {
            alert("중복 확인을 실패했습니다. 다시 시도해주세요.");
        }
    });
    
    $.ajax({
        url: "getAllKeywords", // 모든 키워드 조회를 위한 URL
        method: "GET",
        success: function (data) {
            console.log(data); // 조회된 키워드 데이터 확인

            // 키워드 목록을 HTML로 구성
            let keywordListHtml = "";
            data.forEach(function (item) {
                keywordListHtml += `<li>${item.keyword} (${item.type})</li>`;
            });

            // 모달창 내 키워드 목록에 추가
            $("#keywordList").html(keywordListHtml);
        },
        error: function () {
            alert("키워드 목록 조회를 실패했습니다. 다시 시도해주세요.");
        },
    });
    
});


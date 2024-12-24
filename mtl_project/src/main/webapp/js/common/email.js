$('#mail-Check-Btn').click(function() {
    const email = $('#joinEmail1').val() + $('#joinEmail2').val();  // @앞뒤 결합, 이메일 주소값 얻어오기!
    console.log('완성된 이메일 : ' + email);  // 이메일 오는지 확인
    const checkInput = $('.mail-check-input'); // 인증번호 입력하는 곳



    $.ajax({
        type: 'get',
        url: '/user/mailCheck?email=' + email,  // GET방식으로 이메일을 URL에 포함시킴
        success: function(data) {
            console.log("data : " + data);
            checkInput.attr('disabled', false);
            code = data;
            alert('인증번호가 전송되었습니다.');
        },
        error: function(xhr, status, error) {
            alert('인증번호 전송에 실패했습니다. 다시 시도해 주세요.');
        }
    });
});
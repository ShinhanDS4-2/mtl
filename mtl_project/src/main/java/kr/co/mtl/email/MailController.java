package kr.co.mtl.email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MailController {

    @Autowired
    private MailService mailService;

    // 이메일 인증 요청 처리
    @GetMapping("/mailCheck")
    @ResponseBody
    public String mailCheck(@RequestParam("email") String email) {
        int code = mailService.sendCodeMail(email);  // 인증번호 메일 전송
        return String.valueOf(code);  // 생성된 인증번호 반환
    }

    // 인증번호 확인 처리
    @GetMapping("/checkAuth")
    @ResponseBody
    public String checkAuth(@RequestParam("inputCode") int inputCode) {
        // MailService.getNumber()를 통해 number 값을 가져옵니다.
        if (inputCode == MailService.getNumber()) {
            return "인증 성공!";
        } else {
            return "인증 실패!";
        }
    }
}

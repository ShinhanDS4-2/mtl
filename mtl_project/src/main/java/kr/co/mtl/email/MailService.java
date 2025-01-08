package kr.co.mtl.email;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailService {
	
	@Autowired
    private JavaMailSender mailSender;
    private static int number;  // 인증 코드 저장

    // 이메일 발송
    public void sendMail(Map<String, Object> param) {
        MimeMessage message = mailSender.createMimeMessage();
        
        try {
            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

            // 이메일 발송 시 사용자의 이메일과 이름 설정
            try {
                messageHelper.setFrom("shinhands472@gmail.com", "Admin");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }

            messageHelper.setSubject((String) param.get("subject"));
            messageHelper.setTo((String) param.get("to"));
            messageHelper.setText((String) param.get("text"));
            mailSender.send(message);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

//    // 인증번호 생성 및 메일 전송
//    public int sendCodeMail(String email) {
//        // 인증번호 생성
//        number = (int) (Math.random() * 900000) + 100000; // 100000 ~ 999999 랜덤 생성
//        String subject = "이메일 인증번호";
//        String body = "인증번호: " + number;
//        sendMail(email, subject, body);  // 이메일 발송
//        return number;  // 인증번호 반환
//    }

    // 인증번호 가져오기
    public static int getNumber() {
        return number;
    }
}

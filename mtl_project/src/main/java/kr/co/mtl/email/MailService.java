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

    // 이메일 발송
    public boolean sendMail(MailVO vo) {
        MimeMessage message = mailSender.createMimeMessage();
        
        try {
            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

            // 이메일 발송 시 사용자의 이메일과 이름 설정
            try {
                messageHelper.setFrom("shinhanDS472@gmail.com", "관리자");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }

            messageHelper.setSubject(vo.getTitle());
            messageHelper.setTo(vo.getEmail());
            messageHelper.setText(vo.getContent(), true);
            mailSender.send(message);

            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }

}

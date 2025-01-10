package kr.co.mtl.email;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service
public class MailService {
	
	@Autowired
    private JavaMailSender mailSender;

    // 이메일 발송
	@Async
    public void sendMail(MailVO vo) {
        MimeMessage message = mailSender.createMimeMessage();
        
        try {
            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

            // 이메일 발송 시 사용자의 이메일과 이름 설정
            try {
                messageHelper.setFrom("shinhanDS472@gmail.com", "떠날지도");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }

            messageHelper.setSubject(vo.getTitle());
            messageHelper.setTo(vo.getEmail());
            messageHelper.setText(vo.getContent(), true);
            mailSender.send(message);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

}

package kr.co.mtl.email;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

@Configuration
@ImportResource("classpath:/email.xml")  // email.xml 파일을 로드
public class AppConfig {
    // 기타 설정이 필요하다면 추가
}

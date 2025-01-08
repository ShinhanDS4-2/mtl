package kr.co.mtl.email;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/email")
public class EmailController {

	@Autowired
	private EmailService emailService;

	/**
	 * 비밀번호 찾기
	 * @param param
	 * @return 
	 */
	@PostMapping("/find/password")
	public Map<String, Object> findPassword(@RequestBody Map<String, Object> param) throws Exception {
		
		Map<String, Object> result = emailService.findPassword(param);
		
		return result;
	}

	/**
	 * 이메일 인증
	 * @param param
	 * @return 
	 */
	@PostMapping("/auth")
	public Map<String, Object> emailAuth(@RequestBody Map<String, Object> param, HttpServletRequest request) throws Exception {
		
		Map<String, Object> result = emailService.emailAuth(param, request);
		
		return result;
	}
	
	/**
	 * 이메일 인증 확인
	 * @param param
	 * @return 
	 */
	@PostMapping("/auth/check")
	public Map<String, Object> emailAuthCheck(@RequestBody Map<String, Object> param, HttpServletRequest request) throws Exception {
		
		
		Map<String, Object> result = emailService.emailAuthCheck(param, request);
		
		return result;
	}
}

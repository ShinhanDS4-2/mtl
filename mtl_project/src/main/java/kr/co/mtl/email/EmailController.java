package kr.co.mtl.email;

import java.util.Map;

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
}

package kr.co.mtl.login;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.mtl.util.CommonUtil;

@RestController
public class LoginController {

	@Autowired
	private LoginService loginService;

	/**
	 * 사용자 정보 가져오기
	 * @param param
	 * @return 사용자 정보
	 */
	@PostMapping("/user/info")
	public Map<String, Object> getUserInfo(@RequestParam Map<String, Object> param) throws Exception {
		
		// 필수 파라미터 null 체크
		// ajax를 통해 받아온 param이라는 이름의 Map 데이터 안에 userIdx라는 값이 있는지 체크하는 함수
		CommonUtil.checkIsNull(param, "userIdx");
		
		Map<String, Object> result = loginService.getUserInfo(param);
		
		return result;
	}
}

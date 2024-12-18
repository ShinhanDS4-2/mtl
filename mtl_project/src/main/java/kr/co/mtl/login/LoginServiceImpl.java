package kr.co.mtl.login;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginMapper loginMapper;

	/**
	 * 사용자 정보 가져오기
	 * @param param
	 * @return 사용자 정보
	 */
	public Map<String, Object> getUserInfo(Map<String, Object> param) {
		
		/**
		 * 1. Map 형태의 param을 매개변수로 넘긴다.
		 * 2. 매핑된 sql에서 ${userIdx}를 받아 해당 idx를 가진 사용자의 정보를 가져와 자신을 호출한 곳으로 return 한다.
		 * 3. 추가 로직이 필요한 경우 service 클래스인 이곳에 작성 
		 */
		Map<String, Object> result = loginMapper.getUserInfo(param);
		
		return result ;
	};
}

package kr.co.mtl.login;

import java.util.Map;

public interface LoginService {

	// 사용자 정보 가져오기
	Map<String, Object> getUserInfo(Map<String, Object> param);
}

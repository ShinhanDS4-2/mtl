package kr.co.mtl.email;

import java.util.Map;

public interface EmailService {

	// 비밀번호 찾기
	Map<String, Object> findPassword(Map<String, Object> param) throws Exception;
}


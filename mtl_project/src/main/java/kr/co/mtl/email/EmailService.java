package kr.co.mtl.email;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface EmailService {

	// 비밀번호 찾기
	Map<String, Object> findPassword(Map<String, Object> param) throws Exception;

	// 이메일 인증
	Map<String, Object> emailAuth(Map<String, Object> param, HttpServletRequest request) throws Exception;

	// 이메일 인증 확인
	Map<String, Object> emailAuthCheck(Map<String, Object> param, HttpServletRequest request) throws Exception;
}


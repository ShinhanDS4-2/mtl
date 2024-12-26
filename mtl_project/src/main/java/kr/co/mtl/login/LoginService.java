package kr.co.mtl.login;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface LoginService {

    /**
     * 사용자 정보 조회
     * @param param 요청 파라미터
     * @return 사용자 정보
     * @throws Exception 예외 처리
     */
    Map<String, Object> getUserInfo(Map<String, Object> param) throws Exception;

    /**
     * 사용자 로그인
     * @param param 로그인 요청 파라미터
     * @return 로그인 결과
     * @throws Exception 예외 처리
     */
    Map<String, Object> login(Map<String, Object> param, HttpServletRequest request) throws Exception;

    /**
     * 사용자 로그아웃
     * @param param 로그아웃 요청 파라미터
     * @return 로그아웃 결과
     * @throws Exception 예외 처리
     */
    Map<String, Object> logout(Map<String, Object> param, HttpServletRequest request) throws Exception;
}
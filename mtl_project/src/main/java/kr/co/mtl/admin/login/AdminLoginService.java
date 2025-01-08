package kr.co.mtl.admin.login;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface AdminLoginService {

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
    
    
    /**
     * 관리자 회원가입
     */
    Map<String, Object> registerUser(Map<String, Object> param) throws Exception;
    
    
    /**
     * 회원가입 이메일 중복 체크
     */
    boolean isEmailDuplicated(Map<String, Object> param) throws Exception;
    
    
    /**
     * 마이페이지 수정
     */
    boolean updateUserInfo(Map<String, Object> param, HttpSession session) throws Exception;

    
    /**
     * 현재 비밀번호 확인 + 비밀번호  변경
     */
    Map<String, Object> changePassword(Map<String,Object> param) throws Exception;
    

}
package kr.co.mtl.user.login;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
    
    
    /**
     * 사용자 회원가입
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
    
    
    /**
     * 회원탈퇴
     */
    boolean deactivateUser(Map<String, Object> param) throws Exception;
    
    
    /**
     * 사용자 정보 가져오기 list admin 사용자 관리에서 사용
     */
    Map<String, Object> getAllUser(Map<String, Object> param) throws Exception;
    
    /**
     * 사용자 정보 가져오기2 admin 사용자 관리에서 사용 views/user/userDetail.jsp에서 사용
     */
    Map<String, Object> getUserDetail(Map<String, Object> param) throws Exception;
    
}
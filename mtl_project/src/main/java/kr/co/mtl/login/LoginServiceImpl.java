package kr.co.mtl.login;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mtl.vo.Code;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginMapper loginMapper;

    /**
     * 사용자 정보 조회
     * @param param 요청 파라미터
     * @return 사용자 정보
     * @throws Exception 예외 처리
     */
    @Override
    public Map<String, Object> getUserInfo(Map<String, Object> param) throws Exception {
        return loginMapper.getUserInfo(param);
    }

    /**
     * 사용자 로그인
     * @param param 로그인 요청 파라미터
     * @return 로그인 결과
     * @throws Exception 예외 처리
     */
    @Override
    public Map<String, Object> login(Map<String, Object> param, HttpServletRequest request) throws Exception {
        Map<String, Object> result = new HashMap<>();

        HttpSession session = request.getSession();
//        session.setMaxInactiveInterval(-1);
        
        // 사용자 인증
        Map<String, Object> user = loginMapper.getUserCheck(param);

        // 사용자 존재 여부 확인
//        if (user == null) {
//        	return result;
//        }

        /**
         * TODO
         * 로그인 성공 후 세션 처리
         * 세션에다가 가져온 유저 정보 넣기
         */
        //
        if(user == null) {
        	result.put("code", Code.LOGIN_ERROR.code);
        	return result;
        }
        
        
        // 로그인 성공 세션 처리
        session.setAttribute("login_user", user);	//세션에 사용자 정보 저장
        
        // 로그인 성공 처리 (예: 세션 생성 또는 토큰 발급)
        result.put("login_user", user);
        result.put("code", Code.OK.code);
        return result;
    }

    /**
     * 사용자 로그아웃
     * @param param 로그아웃 요청 파라미터
     * @return 로그아웃 결과
     * @throws Exception 예외 처리
     */
    @Override
    public Map<String, Object> logout(Map<String, Object> param, HttpServletRequest request) throws Exception {
    	HttpSession session = request.getSession();
    	
        if (session.getAttribute("login_user") != null) {
            session.invalidate(); // 세션 삭제
        }

    	Map<String, Object> result = new HashMap<>();
        // 로그아웃 처리 로직
        result.put("status", "success");
        result.put("message", "Logout successful.");
        return result;
    }
    
    
    /**
     * 사용자 회원가입
     * @param param 회원가입 요청 파라미터
     * @return 회원가입 결과
     * @throws Exception 예외 처리
     */
    @Override
    public Map<String, Object> registerUser(Map<String, Object> param) throws Exception {
        Map<String, Object> result = new HashMap<>();

        // 필수 파라미터 확인
//        if (param.get("password") == null || param.get("name") == null ||
//            param.get("birthYear") == null || param.get("birthMonth") == null ||
//            param.get("birthDay") == null || param.get("phone") == null) {
//            result.put("code", Code.VALIDATION_ERROR.code);
//            result.put("message", "필수 항목이 누락되었습니다.");
//            return result;
//        }

     // 비밀번호 암호화 (MD5 방식)
        String rawPassword = param.get("password").toString();
        String hashedPassword = encryptMD5(rawPassword); // MD5 암호화 적용
        param.put("password", hashedPassword);

        // 사용자 정보 저장
        loginMapper.insertUser(param);

        result.put("code", Code.OK.code);
        result.put("message", "회원가입이 완료되었습니다.");
        return result;
    }
    
    
    
    /**
     * MD5 암호화 메서드
     * @param input 암호화할 문자열
     * @return MD5 암호화된 문자열
     */
    private String encryptMD5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(input.getBytes());
            byte[] digest = md.digest();

            // 바이트 배열을 16진수 문자열로 변환
            StringBuilder sb = new StringBuilder();
            for (byte b : digest) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("MD5 암호화 중 오류 발생", e);
        }
    }
    
    
    
    /**
     * 마이페이지 수정
     */
    @Override
    public boolean updateUserInfo(Map<String, Object> param) throws Exception {
        int rowsAffected = loginMapper.updateUser(param);
        return rowsAffected > 0;
    }
    

}

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
        session.setAttribute("login_user_idx", user.get("user_idx"));	//세션에 사용자 정보 저장
        session.setAttribute("login_user_name", user.get("name"));	//세션에 사용자 정보 저장
        session.setAttribute("login_user_email", user.get("email"));	//세션에 사용자 정보 저장
        
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
    public boolean updateUserInfo(Map<String, Object> param, HttpSession session) throws Exception {
        int rowsAffected = loginMapper.updateUser(param);
        // 1
        session.setAttribute("login_user_name", param.get("name"));

        return rowsAffected > 0;
    }
    
    @Override
    public Map<String, Object> changePassword(Map<String, Object> param) throws Exception {
    	
    	Map<String, Object> result = new HashMap<>();
    	
    	param.put("password", encryptMD5(String.valueOf(param.get("password"))));
    	Map<String, Object> isPasswordMatch = loginMapper.getPasswordCheck(param);
    	if(isPasswordMatch == null) {
    		result.put("result", false);
    		result.put("message", "현재 비밀번호가 일치하지 않습니다.");
    		
    		return result;
    	} else {
    		// 업데이트
		    // 새 비밀번호 암호화
		    String rawPassword = param.get("newPassword").toString();
		    String hashedPassword = encryptMD5(rawPassword); // 기존 MD5 암호화 방식 사용
		    param.put("newPassword", hashedPassword);
		  
            // 비밀번호 업데이트
		    int rowsAffected = loginMapper.updatePassword(param);
		    if (rowsAffected > 0) {
		    	result.put("result", true);
		    	result.put("message", "비밀번호가 변경되었습니다.");
		    } else {
		    	result.put("result", false);
		    	result.put("message", "비밀번호 변경에 실패했습니다.");
		    }
    	}
    	
    	return result;
    }
    
    
    
    
    
//    /**
//     * 비밀번호 변경
//     */
//    @Override
//    public boolean changePassword(Map<String, Object> param) throws Exception {
//        // 현재 비밀번호 확인
//        Map<String, Object> user = loginMapper.getUserCheck(param);
//        if (user == null) {
//            return false; // 현재 비밀번호가 일치하지 않음
//        }
//
//        // 새 비밀번호 암호화
//        String rawPassword = param.get("newPassword").toString();
//        String hashedPassword = encryptMD5(rawPassword); // 기존 MD5 암호화 방식 사용
//        param.put("newPassword", hashedPassword);
//
//        // 비밀번호 업데이트
//        int rowsAffected = loginMapper.updatePassword(param);
//        return rowsAffected > 0;
//    }
//    
//    /**
//     * 비밀번호 변경시 현재 비밀번호와 일치하는지 확인
//     */
//    @Override
//    public boolean checkPassword(Map<String, Object> param) throws Exception {
//       
//    	// 현재 비밀번호 확인
//        boolean isPasswordMatch = loginService.checkPassword(param);
//        if (!isPasswordMatch) {
//            result.put("result", false);
//            result.put("message", "현재 비밀번호가 일치하지 않습니다.");
//            return result;
//        }
//        
//        if (user == null) {
//            return false; // 비밀번호가 일치하지 않음
//        }
//        return true; // 비밀번호가 일치함
//    }

}

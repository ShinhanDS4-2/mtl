package kr.co.mtl.login;

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
        session.setMaxInactiveInterval(-1);
        
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
        
        // 로그인 성공 세션 처리
        session.setAttribute("user", user);	//세션에 사용자 정보 저장
        
        // 로그인 성공 처리 (예: 세션 생성 또는 토큰 발급)
        result.put("user", user);
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
    	HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); // 세션 무효화
        }

    	Map<String, Object> result = new HashMap<>();
        // 로그아웃 처리 로직 (예: 세션 무효화 또는 토큰 삭제)
        result.put("status", "success");
        result.put("message", "Logout successful.");
        return result;
    }
}

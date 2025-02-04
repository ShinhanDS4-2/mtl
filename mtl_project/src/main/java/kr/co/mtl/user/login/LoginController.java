package kr.co.mtl.user.login;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.mtl.util.CommonUtil;

@RestController
@RequestMapping("/api/user")
public class LoginController {

    @Autowired
    private LoginService loginService;

    /**
     * 사용자 정보 가져오기
     * @param param 사용자 정보 요청 파라미터
     * @return 사용자 정보
     * @throws Exception 예외 처리
     */
    @PostMapping("/info")
    public Map<String, Object> getUserInfo(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {

    	HttpSession session = request.getSession();
    	param.put("userIdx", session.getAttribute("login_user_idx"));
    	
        // 사용자 정보 조회
        Map<String, Object> result = loginService.getUserInfo(param);

        return result;
    }

    /**
     * 로그인 처리
     * @param param 로그인 요청 파라미터
     * @return 페이지 이동
     * @throws Exception 예외 처리
     */
    @PostMapping("/login")
    public Map<String, Object> login(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
        // 필수 파라미터 체크
        CommonUtil.checkIsNull(param, "email");
        CommonUtil.checkIsNull(param, "password");

        // 로그인 처리
        Map<String, Object> result = loginService.login(param, request);

        return result;
    }

    /**
     * 사용자 로그아웃
     * @param param 로그아웃 요청 파라미터
     * @return 로그아웃 결과
     * @throws Exception 예외 처리
     */
    @PostMapping("/logout")
    public void logout(@RequestParam Map<String, Object> param, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
    	HttpSession session = request.getSession();
    	
        if (session.getAttribute("login_user_idx") != null) {
        	session.removeAttribute("login_user_idx"); // 세션 무효화 session.invalidate();는 사용자, 파트너, 관리자 상관없이 다 날리므로 사용하면 안됨
        }
        
    }
    
    /**
     * 회원가입 처리
     * @param param 회원가입 요청 파라미터
     * @return 회원가입 결과
     * @throws Exception 예외 처리
     */
    @PostMapping("/join")
    public Map<String, Object> join(@RequestParam Map<String, Object> param) throws Exception {

        // 회원가입 처리
        Map<String, Object> result = loginService.registerUser(param);

        return result;
    }
    
    /**
     * 회원가입 이메일 중복 체크
     */
    @PostMapping("/clickEmailCheck")
    public Map<String, Object> clickEmailCheck(@RequestParam Map<String, Object> param) throws Exception {
    	Map<String, Object> result = new HashMap<>();
    	
    	boolean isDuplicated = loginService.isEmailDuplicated(param);
    	result.put("duplicated", isDuplicated);

        return result;
    }
    
    /**
     * 내 정보 수정 처리
     */
    @PostMapping("/update")
    public Map<String, Object> updateUser(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
    	HttpSession session = request.getSession();

    	param.put("userIdx", session.getAttribute("login_user_idx"));
        
    	Map<String, Object> result = new HashMap<>();
        
        boolean isUpdated = loginService.updateUserInfo(param, session);
        result.put("result", isUpdated);
        
        return result;
    }
    
    /**
     * 비밀번호 변경
     */
    @PostMapping("/changePassword")
    public Map<String, Object> changePassword(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        param.put("userIdx", session.getAttribute("login_user_idx"));

        Map<String, Object> result = new HashMap<>();

        result = loginService.changePassword(param);
       
        return result;
    }
    
    /**
     * 회원탈퇴
     */
    @PostMapping("/withdraw")
    public Map<String, Object> withdraw(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        param.put("userIdx", session.getAttribute("login_user_idx"));

        Map<String, Object> result = new HashMap<>();
        boolean isDeactivated = loginService.deactivateUser(param);
        result.put("status", isDeactivated);
        
        if(isDeactivated) {
        	session.invalidate(); // 세션 무효화
        }
        
        return result;
    }
    
}
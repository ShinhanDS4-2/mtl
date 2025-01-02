package kr.co.mtl.user.login;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.mtl.util.CommonUtil;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
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

        // 디버깅용 파라미터 출력
        log.info("Login parameters =============> " + param);

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
        // 필수 파라미터 null 체크
//        CommonUtil.checkIsNull(param, "userIdx");

        // 로그아웃 처리
//      Map<String, Object> result = loginService.logout(param, request);
    	
    	HttpSession session = request.getSession();
    	
        if (session.getAttribute("login_user_idx") != null) {
            session.invalidate(); // 세션 무효화
        }
        
//        return result;
    }
 
    
    
    /**
     * 회원가입 처리
     * @param param 회원가입 요청 파라미터
     * @return 회원가입 결과
     * @throws Exception 예외 처리
     */
    @PostMapping("/join")
    public Map<String, Object> join(@RequestParam Map<String, Object> param) throws Exception {
        // 필수 파라미터 체크
//        CommonUtil.checkIsNull(param, "password");
//        CommonUtil.checkIsNull(param, "name");
//        CommonUtil.checkIsNull(param, "birthYear");
//        CommonUtil.checkIsNull(param, "birthMonth");
//        CommonUtil.checkIsNull(param, "birthDay");;
//        
//        CommonUtil.checkIsNull(param, "phone");

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
     * 비밀번호 변경시 현재 비밀번호와 일치하는지 확인
     */
//    @PostMapping("/checkPassword")
//    public Map<String, Object> checkPassword(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
//        HttpSession session = request.getSession();
//        param.put("userIdx", session.getAttribute("login_user_idx"));
//
//        Map<String, Object> result = new HashMap<>();
//        
//
//       return 
//
//    }

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
package kr.co.mtl.login;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
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
    public Map<String, Object> getUserInfo(@RequestParam Map<String, Object> param) throws Exception {
        // 필수 파라미터 null 체크
        CommonUtil.checkIsNull(param, "userIdx");

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
    @PostMapping("/api/user/logout")
    public Map<String, Object> logout(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
        // 필수 파라미터 null 체크
        CommonUtil.checkIsNull(param, "userIdx");

        // 로그아웃 처리
        Map<String, Object> result = loginService.logout(param, request);

        return result;
    }
}


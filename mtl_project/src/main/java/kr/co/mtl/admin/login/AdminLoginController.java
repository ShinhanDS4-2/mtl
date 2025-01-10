package kr.co.mtl.admin.login;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.mtl.partner.login.PartnerLoginService;
import kr.co.mtl.user.login.LoginService;
import kr.co.mtl.util.CommonUtil;

@RestController
@RequestMapping("/api/admin")
public class AdminLoginController {

    @Autowired
    private AdminLoginService loginService;
    
    @Autowired
    private LoginService userLoginService; // 사용자 정보 가져오기 list가져와야 해서 추가
    
    @Autowired
    private PartnerLoginService partnerLoginService; // 판매자 정보 가져오기 list가져와야 해서 추가
    
    /**
     * 사용자 정보 가져오기
     * @param param 사용자 정보 요청 파라미터
     * @return 사용자 정보
     * @throws Exception 예외 처리
     */
    @PostMapping("/info")
    public Map<String, Object> getUserInfo(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {

    	HttpSession session = request.getSession();
    	param.put("adminIdx", session.getAttribute("login_admin_idx"));
    	
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
        CommonUtil.checkIsNull(param, "admin_email");
        CommonUtil.checkIsNull(param, "admin_password");

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
    	
        if (session.getAttribute("login_admin_idx") != null) {
        	session.removeAttribute("login_admin_idx"); // 세션 무효화 session.invalidate();는 사용자, 파트너, 관리자 상관없이 다 날리므로 사용하면 안됨
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
     * 마이페이지 관리자 정보 수정 처리
     */
    @PostMapping("/update")
    public Map<String, Object> updateUser(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
    	HttpSession session = request.getSession();

    	param.put("adminIdx", session.getAttribute("login_admin_idx"));
        
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
        param.put("adminIdx", session.getAttribute("login_admin_idx"));

        Map<String, Object> result = new HashMap<>();

        result = loginService.changePassword(param);
               
        return result;
    }
    
    /**
     * 사용자 정보 가져오기 list
     * 사용자 LoginMapper.java -> LoginMapper.xml에서 사용자 목록 조회 SQL 생성 -> LoginService.java를 통해 데이터 가져옴
     * AdminLoginController.java 에서 LoginService를 호출 USER 정보를 가져옴
     * userList.js에 AJAX 요청 전송 -> userList.jsp
     */
    @PostMapping("/list")
    public Map<String, Object> getUserList(@RequestParam Map<String, Object> param) {
        Map<String, Object> result = new HashMap<>();
        try {
            // User의 LoginService를 사용해 데이터 가져오기
            result = userLoginService.getAllUser(param);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("error", "사용자 목록 조회 중 오류가 발생했습니다.");
        }
        return result;
    }
    
    
    /**
     * 사용자 정보 가져오기2
     * admin 사용자 관리에서 사용 views/admin/user/userDetail.jsp에서 사용
     */
    @PostMapping("/detail")
    public Map<String, Object> getUserDetail(@RequestParam Map<String, Object> param) {
        Map<String, Object> result = new HashMap<>();
        try {
            // 사용자 상세 정보 조회
            Map<String, Object> userDetail = userLoginService.getUserDetail(param);

            // 결과에 사용자 정보 추가
            result.put("userDetail", userDetail);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("error", "사용자 상세 정보 조회 중 오류가 발생했습니다.");
        }
        return result;
    }
    
    
    /**
     * 판매자 정보 가져오기 list
     * 판매자 PartnerLoginMapper.java -> PartnerLoginMapper.xml에서 사용자 목록 조회 SQL 생성 -> PartnerLoginService.java를 통해 데이터 가져옴
     * AdminLoginController.java 에서 LoginService를 호출 USER 정보를 가져옴
     * partnerList.js에 AJAX 요청 전송 -> partnerList.jsp
     */
    @PostMapping("/partnerList")
    public Map<String, Object> getPartnerList(@RequestParam Map<String, Object> param) {
        Map<String, Object> result = new HashMap<>();
        try {
            // Partner의 PartnerLoginService를 사용해 데이터 가져오기
        	result = partnerLoginService.getAllPartner(param);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("error", "판매자 목록 조회 중 오류가 발생했습니다.");
        }
        return result;
    }
    
    /**
     * 판매자 정보 가져오기2
     * admin 판매자 관리에서 사용 views/admin/user/partnerDetail.jsp에서 사용
     */
    @PostMapping("/partnerDetail")
    public Map<String, Object> getPartnerDetail(@RequestParam Map<String, Object> param) {
        Map<String, Object> result = new HashMap<>();
        try {
            // 사용자 상세 정보 조회
            Map<String, Object> partnerDetail = partnerLoginService.getPartnerDetail(param);

            // 결과에 사용자 정보 추가
            result.put("partnerDetail", partnerDetail);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("error", "판매자 상세 정보 조회 중 오류가 발생했습니다.");
        }
        return result;
    }
    
    
    /**
     * 판매자 상태 승인
     */
    @PostMapping("/updateApprovalStatus")
    public Map<String, Object> updateApprovalStatus(@RequestParam Map<String, Object> param) {
        Map<String, Object> result = new HashMap<>();
        try {
            // 현재 상태 확인
        	partnerLoginService.updateApprovalStatus(param);
            result.put("success", true);
            result.put("message", "상태가 성공적으로 변경되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("success", false);
            result.put("error", "상태 변경 중 오류가 발생했습니다.");
        }
        return result;
    }
    
    
}
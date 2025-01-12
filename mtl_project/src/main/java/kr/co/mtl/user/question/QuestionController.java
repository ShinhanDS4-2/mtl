package kr.co.mtl.user.question;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
@RequestMapping("/api/user/question")
public class QuestionController {

    @Autowired
    private QuestionService questionService;
    
    /**
     * 문의 등록
     * @param param
     * @param request
     * @return
     */
    @PostMapping("/regist")
    public Map<String, Object> registQuestion(@RequestBody Map<String, Object> param, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>();
        HttpSession session = request.getSession();
        
        // 로그인 체크
        Object userIdx = session.getAttribute("login_user_idx");
        if (userIdx == null) {
            result.put("result", false);
            result.put("message", "로그인 후 이용해 주세요.");
            return result;
        }

        param.put("user_idx", userIdx); // 로그인된 사용자 정보 사용
        result = questionService.registQuestion(param); // 서비스 호출하여 데이터 저장
        return result;
    }

    /**
     * 문의 목록 조회
     * @param param
     * @param request
     * @return
     */
    @PostMapping("/list")
    public Map<String, Object> getQuestionList(@RequestBody Map<String, Object> param, HttpServletRequest request) {
        HttpSession session = request.getSession();
        
        // 로그인 체크
        Object userIdx = session.getAttribute("login_user_idx");
        if (userIdx == null) {
            Map<String, Object> result = new HashMap<>();
            result.put("result", false);
            result.put("message", "로그인 후 이용해 주세요.");
            return result;
        }

        param.put("user_idx", userIdx); // 로그인된 사용자 정보 사용
        return questionService.getQuestionList(param); // 서비스 호출하여 문의 리스트 조회
    }

    /**
     * 문의 상세 조회
     * @param param
     * @return
     */
    @PostMapping("/detail")
    public Map<String, Object> getQuestionDetail(@RequestBody Map<String, Object> param) {
        return questionService.getQuestionDetail(param); // 상세 조회
    }
}

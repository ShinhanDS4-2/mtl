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
	public Map<String,Object> registQuestion(@RequestBody Map<String,Object> param, HttpServletRequest request) {
		
		Map<String, Object> result = new HashMap<>();
		
		HttpSession session = request.getSession();
		param.put("user_idx", session.getAttribute("login_user_idx"));
		
		result = questionService.registQuestion(param);

		return result;
	};
	
	/**
	 * 자주 묻는 질문 리스트
	 * @param param
	 * @param request
	 * @return
	 */
	@PostMapping("/list")
	public Map<String, Object> getQuestionList(@RequestBody Map<String, Object> param, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		param.put("user_idx", session.getAttribute("login_user_idx"));
		
		Map<String, Object> result = new HashMap<>();
//		result = QuestionService.getQuestionList(param);
		
		return result;
	}
}

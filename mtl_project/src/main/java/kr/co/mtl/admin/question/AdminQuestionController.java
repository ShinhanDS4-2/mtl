package kr.co.mtl.admin.question;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/admin/accomodation/question")
public class AdminQuestionController {
	
	@Autowired
	private AdminQuestionService adminQuestionService;
	
	@PostMapping("/search")
	public Map<String,Object> search(@RequestBody Map<String,Object> param) {
		
		return adminQuestionService.searchQuestions(param);
	}

	@PostMapping("/list")
	public Map<String,Object> getList(@RequestBody Map<String,Object> param) {
		
		return adminQuestionService.getList(param);
	}
	
	@PostMapping("/detail")
	public Map<String,Object> getDetail(@RequestBody Map<String,Object> param) {
		
		return adminQuestionService.getDetail(param);
	}
	
	@PostMapping("/answer")
	public Map<String,Object> answer(@RequestBody Map<String,Object> param, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		param.put("admin_idx", session.getAttribute("login_admin_idx"));
		
		return adminQuestionService.answer(param);
	}

}

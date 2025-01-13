package kr.co.mtl.admin.aquestion;

import java.util.List;
import java.util.Map;

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
	@PostMapping("/update")
	public Map<String,Object> update(@RequestBody Map<String,Object> param) {
		
		return adminQuestionService.updateQuestions(param);
	}
}

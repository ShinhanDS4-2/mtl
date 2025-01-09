package kr.co.mtl.faq;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/faq")
public class FaqController {

	@Autowired
	private FaqService faqService;

	/**
	 * 자주 묻는 질문 리스트 관리자
	 * @param param
	 * @return 
	 */
	@PostMapping("/list")
	public Map<String, Object> getList(@RequestBody Map<String, Object> param) {
		
		Map<String, Object> result = faqService.getList(param);
		
		return result;
	}
}

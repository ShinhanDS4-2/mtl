package kr.co.mtl.faq;

import java.util.Map;

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

	/**
	 * 자주 묻는 질문 업데이트
	 * @param param
	 * @return 
	 */
	@PostMapping("/update")
	public Map<String, Object> updateStatus(@RequestBody Map<String, Object> param) {
		
		Map<String, Object> result = faqService.updateStatus(param);
		
		return result;
	}

	/**
	 * 자주 묻는 질문 등록
	 * @param param
	 * @return 
	 */
	@PostMapping("/regist")
	public Map<String, Object> registFaq(@RequestBody Map<String, Object> param) {
		
		Map<String, Object> result = faqService.registFaq(param);
		
		return result;
	}
	
	/**
	 * 자주 묻는 질문 리스트 사용자
	 * @param param
	 * @return 
	 */
	@PostMapping("/user/list")
	public Map<String, Object> getListWithUser(@RequestBody Map<String, Object> param) {
		
		Map<String, Object> result = faqService.getListWithUser(param);
		
		return result;
	}
}

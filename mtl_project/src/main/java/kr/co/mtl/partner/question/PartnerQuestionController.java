package kr.co.mtl.partner.question;

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
@RequestMapping("/api/partner/question")
public class PartnerQuestionController {

	@Autowired
	private PartnerQuestionService partnerQuestionService;
	
	/**
	 * 문의 리스트
	 * @param param
	 * @param request
	 * @return
	 */
	@PostMapping("/list")
	public Map<String, Object> getList(@RequestBody Map<String, Object> param, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		param.put("partner_idx", session.getAttribute("login_partner_idx"));
		
		Map<String, Object> result = new HashMap<>();
		
		result = partnerQuestionService.getList(param);
		
		return result;
	}

	/**
	 * 답변 등록
	 * @param param
	 * @return
	 */
	@PostMapping("/answer")
	public Map<String, Object> answer(@RequestBody Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		
		result = partnerQuestionService.answer(param);
		
		return result;
	}
	
	/**
	 * 문의 상세
	 * @param param
	 * @return
	 */
	@PostMapping("/detail")
	public Map<String, Object> getDetail(@RequestBody Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		
		result = partnerQuestionService.getDetail(param);
		
		return result;
	}

}

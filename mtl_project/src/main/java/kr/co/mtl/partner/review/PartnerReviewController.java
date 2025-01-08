package kr.co.mtl.partner.review;

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
@RequestMapping("/api/partner/review")
public class PartnerReviewController {

	@Autowired
	private PartnerReviewService partnerReviewService;
	
	/**
	 * 리뷰 리스트
	 * @param param
	 * @param request
	 * @return
	 */
	@PostMapping("/list")
	public Map<String, Object> getReviewList(@RequestBody Map<String, Object> param, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		param.put("partner_idx", session.getAttribute("login_partner_idx"));
		
		Map<String, Object> result = new HashMap<>();
		
		result = partnerReviewService.getReviewList(param);
		
		return result;
	}

	/**
	 * 답변 등록
	 * @param param
	 * @param request
	 * @return
	 */
	@PostMapping("/reply/regist")
	public Map<String, Object> registReviewReply(@RequestBody Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		
		result = partnerReviewService.registReviewReply(param);
		
		return result;
	}

	/**
	 * 후기 상태 업데이트
	 * @param param
	 * @param request
	 * @return
	 */
	@PostMapping("/reply/hide")
	public Map<String, Object> updateReviewReply(@RequestBody Map<String, Object> param, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		param.put("partner_idx", session.getAttribute("login_partner_idx"));
		
		Map<String, Object> result = new HashMap<>();
		
		result = partnerReviewService.updateReviewReply(param);
		
		return result;
	}

}

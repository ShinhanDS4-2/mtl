package kr.co.mtl.partner.accomodation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/api/partner/accomodation")
public class AccomodationController {
	
	@Autowired
	private AccomodationService accomodationService;
	
	/**
	 * 숙소 정보 업데이트
	 * @param param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/update")
	public Map<String,Object> updateAccomodationInfo(@RequestParam Map<String,Object> param, 
													 @RequestParam(required = false, name = "mfile") List<MultipartFile> mfile, 
													 HttpServletRequest request) {
		
		Map<String, Object> result = new HashMap<>();
		
		HttpSession session = request.getSession();
		param.put("partner_idx", session.getAttribute("login_partner_idx"));
		
		result = accomodationService.updateAccomodationInfo(param, mfile);

		return result;
	};
	
	/**
	 * 숙소 상세
	 * @param param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/detail")
	public Map<String,Object> getDetail(@RequestBody Map<String,Object> param, HttpServletRequest request) {
		
		Map<String, Object> result = new HashMap<>();
		
		HttpSession session = request.getSession();
		param.put("partner_idx", session.getAttribute("login_partner_idx"));
		
		result = accomodationService.getDetail(param);

		return result;
	};
	
	
	/**
	 * 이용안내 등록
	 * @param param
	 * @return
	 */
	@PostMapping("/notice/regist")
	public Map<String,Object> registPartnerNotice(@RequestBody Map<String,Object>param, HttpServletRequest request) {
		
		Map<String, Object> result = new HashMap<>();
		
		HttpSession session = request.getSession();
		param.put("partner_idx", session.getAttribute("login_partner_idx"));
		
		result = accomodationService.insertPartnerNotice(param);
		
		return result;
	}
	
	/**
	 * 이용안내 수정
	 * @param param
	 * @return
	 */
	@PostMapping("/notice/update")
	public Map<String,Object> updatePartnerNotice(@RequestBody Map<String,Object>param, HttpServletRequest request) {
		
		Map<String, Object> result = new HashMap<>();
		
		HttpSession session = request.getSession();
		param.put("partner_idx", session.getAttribute("login_partner_idx"));

		result = accomodationService.updatePartnerNotice(param);
		
		return result;
	}
	
	
	/**
	 * 이용안내 삭제
	 * @param param
	 * @return
	 */
	@PostMapping("/notice/delete")
	public Map<String,Object> deletePartnerNotice(@RequestBody Map<String,Object>param, HttpServletRequest request) {
	
		Map<String, Object> result = new HashMap<>();
		
		HttpSession session = request.getSession();
		param.put("partner_idx", session.getAttribute("login_partner_idx"));

		result = accomodationService.deletePartnerNotice(param);

		return result;
	}
	
	/**
	 * 이용안내 리스트
	 * @param param
	 * @return
	 */
	@PostMapping("/notice/list")
	public Map<String,Object> getPartnerNoticeList(@RequestBody Map<String,Object>param, HttpServletRequest request) {
		
		Map<String, Object> result = new HashMap<>();
		
		HttpSession session = request.getSession();
		param.put("partner_idx", session.getAttribute("login_partner_idx"));
		
		result = accomodationService.getPartnerNoticeList(param);

		return result;
	}
	
	
}

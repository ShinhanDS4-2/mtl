package kr.co.mtl.partner.accomodation;

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
	public Map<String,Object> updateAccomodationInfo(@RequestBody Map<String,Object> param, HttpServletRequest request) throws Exception {
		
		Map<String, Object> result = new HashMap<>();
		
//		HttpSession session = request.getSession();
//		param.put("partner_idx", session.getAttribute("login_partner_idx"));
		
		param.put("partner_idx", 82);
		
		accomodationService.updateAccomodationInfo(param);

		return result;
	}
	
	@PostMapping("/detail")
	public Map<String,Object> getDetail(@RequestBody Map<String,Object> param, HttpServletRequest request) throws Exception {
		
		Map<String, Object> result = new HashMap<>();
		
//		HttpSession session = request.getSession();
//		param.put("partner_idx", session.getAttribute("login_partner_idx"));
		
		param.put("partner_idx", 82);
		
		result.put("data", accomodationService.getDetail(param));

		return result;
	}
	
}

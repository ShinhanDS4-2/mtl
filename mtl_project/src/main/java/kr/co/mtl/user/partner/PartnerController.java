package kr.co.mtl.user.partner;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/user/partner")
public class PartnerController {

	@Autowired
	private PartnerService partnerService;

	/**
	 * 인기 숙소 리스트
	 * @param param
	 * @return 숙소 리스트
	 */
	@PostMapping("/best/list")
	public Map<String, Object> getBestPartnerList(@RequestParam Map<String, Object> param) throws Exception {
		
		Map<String, Object> result = partnerService.getBestPartnerList(param);
		
		return result;
	}
}

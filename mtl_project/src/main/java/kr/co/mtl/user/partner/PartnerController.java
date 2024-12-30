package kr.co.mtl.user.partner;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public Map<String, Object> getBestPartnerList(@RequestBody Map<String, Object> param) throws Exception {
		
		Map<String, Object> result = partnerService.getBestPartnerList(param);
		
		return result;
	}
	
	/**
	 * 숙소 검색
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/search/list")
	public Map<String, Object> getPartnerSearchList(@RequestBody Map<String, Object> param) throws Exception {

		Map<String, Object> result = partnerService.getPartnerSearchList(param);
		
		return result;
	}

	/**
	 * 숙소 상세
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/detail")
	public Map<String, Object> getPartnerDetail(@RequestBody Map<String, Object> param) throws Exception {
		
		Map<String, Object> result = partnerService.getPartnerDetail(param);
		
		return result;
	}
}

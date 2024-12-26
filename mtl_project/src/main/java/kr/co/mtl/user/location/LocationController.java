package kr.co.mtl.user.location;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/user/location")
public class LocationController {

	@Autowired
	private LocationService locationService;

	/**
	 * 지역 별 여행지 리스트
	 * @param param
	 * @return 여행지 리스트
	 */
	@PostMapping("/list")
	public Map<String, Object> getBestPartnerList(@RequestParam Map<String, Object> param) throws Exception {
		
		Map<String, Object> result = new HashMap<>();
		
		result = locationService.getLocationList(param);
		
		return result;
	}
}

package kr.co.mtl.common;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/common")
public class CommonController {

	@Autowired
	private CommonService commonService;

	/**
	 * 지역 코드
	 * @param param
	 * @return 지역 코드 리스트
	 */
	@PostMapping("/area/list")
	public Map<String, Object> getAreaList(@RequestBody Map<String, Object> param) throws Exception {
		
		param.put("type", "AREA");
		Map<String, Object> result = commonService.getCodeList(param);
		
		return result;
	}
	
	/**
	 * 숙소 분류 코드
	 * @param param
	 * @return 숙소 분류 리스트
	 */
	@PostMapping("/accomodation/list")
	public Map<String, Object> getAccomodationList(@RequestBody Map<String, Object> param) throws Exception {
		
		param.put("type", "ACCOMODATION");
		Map<String, Object> result = commonService.getCodeList(param);
		
		return result;
	}
	
	/**
	 * 키워드 
	 * @param param
	 * @return 키워드 리스트
	 */
	@PostMapping("/keyword/list")
	public Map<String, Object> getKeywordList(@RequestBody Map<String, Object> param) throws Exception {
		
		Map<String, Object> result = commonService.getKeywordList(param);
		
		return result;
	}
	
	/**
	 * 시설
	 * @param param
	 * @return 시설 리스트
	 */
	@PostMapping("/facilities/list")
	public Map<String, Object> getFacilitiesList(@RequestBody Map<String, Object> param) throws Exception {
		
		Map<String, Object> result = commonService.getFacilitiesList(param);
		
		return result;
	}
}

package kr.co.mtl.user.location;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/user/location")
public class LocationController {

	@Autowired
	private LocationService locationService;

	/** 시온 - API 완료
	 * [사용자] 지역 별 여행지 리스트 조회
	 * 리스트 페이지 접속 => http://localhost:8090/mtl/area/list
	 * @param LOCATION테이블에서 쓰일 area지역, type타입
	 * @return 여행지 리스트 LocationList, 리스트 총 갯수 LocationListCount
	 */
	@PostMapping("/list")
	public Map<String, Object> getLocationList(@RequestParam Map<String, Object> param) throws Exception {
		System.out.println("paradmddㅇㅇㅇㅇㅇㅇㅇㅇ" + param);
		Map<String, Object> result = new HashMap<>();
		result = locationService.getLocationList(param);
		return result;
	}
	
	/** 시온 - API 완료
	 * [사용자] 여행지(관광지/맛집) 상세페이지 조회
	 * 상세페이지 접속 => http://localhost:8090/mtl/location/detail
	 * @param location_idx
	 * @return Image, Description, Keyword (=> 여행지 1개 상세페이지에 들어갈 내용)
	 */
	@PostMapping("/detail")
	public Map<String, Object> getLocationDetailImage(@RequestParam Map<String, Object> param) throws Exception {
		Map<String, Object> result = new HashMap<>();
		result = locationService.getLocationDetail(param);
		return result;
	} 
	
	/**
	 * 랜덤 여행지 리스트
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/random/list")
	public Map<String, Object> getRandomLocationList(@RequestParam Map<String, Object> param) {
		Map<String, Object> result = new HashMap<>();
	
		result = locationService.getRandomLocationList(param);
		
		return result;
	}


	/**
	 * 여행지 추천 리스트
	 * @param param
	 * @return
	 */
	@PostMapping("/custom/list")
	public Map<String, Object> getCustomList(@RequestBody Map<String, Object> param) {
		Map<String, Object> result = new HashMap<>();
		
		result = locationService.getCustomList(param);
		
		return result;
	}

	/**
	 * 여행지 정보
	 * @param param
	 * @return
	 */
	@PostMapping("/min/detail")
	public Map<String, Object> getLocationMinDetail(@RequestBody Map<String, Object> param) {
		Map<String, Object> result = new HashMap<>();
		
		result = locationService.getLocationMinDetail(param);
		
		return result;
	}

	/**
	 * 여행지 추천 저장
	 * @param param
	 * @return
	 */
	@PostMapping("/custom/save")
	public Map<String, Object> insertCustomLocation(@RequestBody Map<String, Object> param) {
		Map<String, Object> result = new HashMap<>();
		
		result = locationService.insertCustomLocation(param);
		
		return result;
	}

	/**
	 * 여행지 유무 확인
	 * @param param
	 * @return
	 */
	@PostMapping("/custom/check")
	public Map<String, Object> checkCustomLocation(@RequestBody Map<String, Object> param) {
		Map<String, Object> result = new HashMap<>();
		
		result = locationService.checkCustomLocation(param);
		
		return result;
	}

	/**
	 * 저장된 여행지 추천 리스트
	 * @param param
	 * @return
	 */
	@PostMapping("/custom/save/list")
	public Map<String, Object> getSavedCustomList(@RequestBody Map<String, Object> param) {
		Map<String, Object> result = new HashMap<>();
		
		result = locationService.getSavedCustomList(param);
		
		return result;
	}
}

package kr.co.mtl.admin.location;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/api/admin/location")
public class AdminLocationController {
	
	@Autowired
	private AdminLocationService adminLocationService;
	
	/** 완료
	 * 여행지 등록
	 * @param (기본정보)area, type, name, address, description / 
	 * (사진정보 images 키값으로 배열저장)url, thumbnail_yn, origin_filename / (키워드 정보 keywordList 키값으로 배열저장)keyword_idx
	 * @return result(true/false), message
	 */
	@PostMapping("/regist")
	public Map<String,Object> registLocation(@RequestParam Map<String,Object> param,
											@RequestParam(required = false, name = "images") List<MultipartFile> images) {
		
		Map<String, Object> result = new HashMap<>();
		result = adminLocationService.registLocation(param, images);

		return result;
	};
	

	/** 
	 * 여행지 수정 
	 * @param (기본정보수정)location_idx, area, type, name, address, description / (이미지,키워드 삭제)location_idx / 
	 * 		(사진등록 images 키값으로 배열저장)url, thumbnail_yn, origin_filename / (키워드등록 keywordList 키값으로 배열저장)keyword_idx
	 * @return result(true/false), message
	 */
	@PostMapping("/update")
	public Map<String,Object> updateLocation(@RequestParam Map<String,Object> param,
											@RequestParam(required = false, name = "images") List<MultipartFile> images) {
		
		Map<String, Object> result = new HashMap<>();
		result = adminLocationService.updateLocation(param, images);
		
		return result;
	};
	
	
	/** 완료
	 * 여행지 삭제
	 * @param location_idx (여행지idx)
	 * @return result(true/false)
	 * result값이 t인경우 프론트에서 삭제가 완료되었습니다 알림창 띄우고, f인경우 ? 삭제가 불가? . .
	 */
	@PostMapping("/delete")
	public Map<String,Object> deleteLocation(@RequestParam Map<String,Object> param) {
		
		Map<String,Object> result = adminLocationService.deleteLocation(param);
		
		return result;
	};
	
	/** 완료
	 * 여행지 리스트 조회
	 * @param (검색조건) searchType, searchArea, searchName
	 * @return locationListCount, locationList
	 */
	@PostMapping("/getList")
	public Map<String,Object> getLocationList(@RequestParam Map<String,Object> param) {
		System.out.println("param값은 ?????????" + param);
		Map<String, Object> result = new HashMap<>();
		result = adminLocationService.getLocationList(param);
		System.out.println(result);
		return result;
	};
	
	/** 완료
	 * 여행지 상세정보 조회
	 * @param location_idx (여행지 리스트에서 상세정보 클릭했을 때, 해당 여행지의 idx를 받아와야 함 => location_idx)
	 * @return info, img, keyword
	 */
	@PostMapping("/getDetail")
	public Map<String,Object> getLocationDetail(@RequestParam Map<String,Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		result = adminLocationService.getLocationDetail(param);
		
		return result;
	};
	
}

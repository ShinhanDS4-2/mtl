package kr.co.mtl.admin.location;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface AdminLocationService {
	// 여행지 등록
	Map<String, Object> registLocation(Map<String,Object> param, List<MultipartFile> images);
	
	// 여행지 수정
	Map<String, Object> updateLocation(Map<String,Object> param, List<MultipartFile> images);
	
	// 여행지 삭제
	Map<String, Object> deleteLocation(Map<String,Object> param);
	
	// 여행지 리스트 조회
	Map<String, Object> getLocationList();  // 파라미터X
	
	// 여행지 상세정보 조회
	Map<String, Object> getLocationDetail(Map<String,Object> param);
}

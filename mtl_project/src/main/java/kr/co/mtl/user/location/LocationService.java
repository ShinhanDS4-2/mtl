package kr.co.mtl.user.location;

import java.util.Map;

public interface LocationService {
	
	// [사용자] 지역 별 여행지 리스트 조회
	Map<String, Object> getLocationList(Map<String, Object> param);

	// [사용자] 여행지(관광지/맛집) 상세페이지 조회
	Map<String, Object> getLocationDetail(Map<String, Object> param); 

	// 랜덤 여행지 리스트
	Map<String, Object> getRandomLocationList(Map<String, Object> param); 



}

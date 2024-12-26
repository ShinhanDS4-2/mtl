package kr.co.mtl.user.location;

import java.util.Map;

public interface LocationService {
	
	// 지역 별 여행지 리스트
	Map<String, Object> getLocationList(Map<String, Object> param);

}

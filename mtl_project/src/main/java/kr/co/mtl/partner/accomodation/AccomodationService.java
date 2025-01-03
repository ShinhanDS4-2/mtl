package kr.co.mtl.partner.accomodation;

import java.util.Map;

public interface AccomodationService {
	
	// 숙소 정보 업데이트
	Map<String, Object> updateAccomodationInfo(Map<String,Object> param) throws Exception;

	// 숙소 상세
	Map<String, Object> getDetail(Map<String,Object> param) throws Exception;

}

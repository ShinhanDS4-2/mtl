package kr.co.mtl.user.partner;

import java.util.Map;

public interface PartnerService {

	// 인기 숙소 리스트
	Map<String, Object> getBestPartnerList(Map<String, Object> param);
	
	// 숙소 검색
	Map<String, Object> getPartnerSearchList(Map<String, Object> param);

	// 숙소 상세
	Map<String, Object> getPartnerDetail(Map<String, Object> param);
	
}

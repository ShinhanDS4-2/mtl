package kr.co.mtl.user.location;

import java.util.Map;

public interface LocationService {
	
	// [사용자] 지역 별 여행지 리스트 조회
	Map<String, Object> getLocationList(Map<String, Object> param);

	// [사용자] 여행지(관광지/맛집) 상세페이지 조회
	Map<String, Object> getLocationDetail(Map<String, Object> param); 
	
	// [사용자] 마이페이지 예약내역 리스트 조회
	Map<String, Object> getMypageReservationHistoryList(Map<String, Object> param); 
	
	// [사용자] 마이페이지 예약내역 상세정보 조회
	Map<String, Object> getMypageReservationHistoryDetail(Map<String, Object> param);
	
	// [판매자] 정산내역 리스트 조회	
	Map<String, Object> getPartnerPayoutList(Map<String, Object> param);
	
	// [판매자] 정산 상세내역 리스트 조회
	Map<String, Object> getPartnerPayoutDetailList(Map<String, Object> param);
	
	
	// [판매자] 정산 상세 내역 조회
}

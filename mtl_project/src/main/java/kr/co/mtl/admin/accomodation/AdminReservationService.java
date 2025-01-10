package kr.co.mtl.admin.accomodation;

import java.util.Map;

public interface AdminReservationService {
 
	// [판매자] 예약내역 리스트 조회	
	Map<String, Object> getReservationList(Map<String, Object> param);
	// [판매자] 예약내역 상세 조회
	Map<String, Object> getReservationDetail(Map<String, Object> param);
	
	// 숙소에 등록되어 있는 객실타입 조회
	Map<String, Object> getRoomTypeList(Map<String, Object> param);
	
} 
 
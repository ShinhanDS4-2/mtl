package kr.co.mtl.admin.accomodation;

import java.util.Map;

public interface AdminReservationService {
 
	// [관리자] 예약내역 리스트 조회	
	Map<String, Object> getReservationList(Map<String, Object> param);
	// [관리자] 예약내역 상세 조회
	Map<String, Object> getReservationDetail(Map<String, Object> param);
	
} 
 
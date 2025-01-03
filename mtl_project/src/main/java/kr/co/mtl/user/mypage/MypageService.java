package kr.co.mtl.user.mypage;

import java.util.Map;

public interface MypageService {
	
	// [사용자] 마이페이지 예약내역 리스트(상세정보) 조회
	Map<String, Object> getMypageReservationHistoryList(Map<String, Object> param); 
	
	// [사용자] 마이페이지 예약내역 상세정보 조회
	Map<String, Object> getReservationHistoryDetail(Map<String, Object> param); 
	

}

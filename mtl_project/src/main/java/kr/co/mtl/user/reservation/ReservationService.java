package kr.co.mtl.user.reservation;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ReservationService {

	// 예약 상세 정보
	Map<String, Object> getDetail(Map<String, Object> param, HttpServletRequest request);

	// 예약 취소
	Map<String, Object> cancelReservation(Map<String, Object> param);
	
}


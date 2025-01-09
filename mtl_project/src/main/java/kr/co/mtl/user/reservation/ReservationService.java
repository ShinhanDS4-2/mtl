package kr.co.mtl.user.reservation;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ReservationService {

	// 예약 상세 정보
	Map<String, Object> getDetail(Map<String, Object> param, HttpServletRequest request);

	// 회원별 에약 리스트
	Map<String, Object> getList(Map<String, Object> param);

}


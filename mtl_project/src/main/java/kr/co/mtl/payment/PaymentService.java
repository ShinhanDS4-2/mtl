package kr.co.mtl.payment;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface PaymentService {

	// 숙소 예약 결제
	Map<String, Object> reservationComplete(Map<String, Object> param, HttpServletRequest request) throws Exception;
}


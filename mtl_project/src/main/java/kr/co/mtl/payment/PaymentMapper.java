package kr.co.mtl.payment;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentMapper {

	// 숙소 예약 결제
	public int reservationComplete(Map<String, Object> param);
	
	// 숙소 총 예약 수 업데이트
	public int totalReservationUpdate(Map<String, Object> param);
	
	// 예약 취소
	public int cancelReservation(Map<String, Object> param);
	
	public String getReservationCode(Map<String, Object> param);
}

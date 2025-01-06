package kr.co.mtl.user.reservation;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReservationMapper {

	// 예약 상세 정보
	public Map<String, Object> getDetail(Map<String, Object> param);
	
	public int cancelReservation(Map<String, Object> param);
}

package kr.co.mtl.admin.accomodation;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;

@Mapper
public interface AdminReservationMapper {
	 
	/* [판매자] 예약 관리 */	
	int getReservationListCount(Map<String, Object> param);  // 예약내역 리스트 총 개수
	List<Map<String, Object>> getReservationList(Map<String, Object> param);  // 예약내역 리스트 조회
	Map<String, Object> getReservationDetail(Map<String, Object> param);  // 예약내역 상세조회 조회
	
	List<Map<String, Object>> getRoomTypeList(Map<String, Object> param); // 숙소에 등록되어 있는 객실타입 조회

	
}
 
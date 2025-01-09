package kr.co.mtl.user.reservation;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReservationMapper {

	// 예약 상세 정보
	public Map<String, Object> getDetail(Map<String, Object> param);
	
	// 회원 별 예약 리스트
	public List<Map<String, Object>> getList(Map<String, Object> param);
	
	// 회원 별 예약 리스트 개수
	public int getListCnt(Map<String, Object> param);
	
}

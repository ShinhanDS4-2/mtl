package kr.co.mtl.admin.dashboard;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminDashboardMapper {

	// 사용자 통계
	public Map<String, Object> getUser(Map<String, Object> param);
	
	// 판매자 통계
	public Map<String, Object> getPartner(Map<String, Object> param);
	
	// 미답변 문의
	public Map<String, Object> getQeustion(Map<String, Object> param);
	
	// 최근 7일 예약 건수
	public Map<String, Object> getReservation(Map<String, Object> param);
	
	// 지역별 숙소
	public Map<String, Object> getPartnerWithArea(Map<String, Object> param);
	
	// 지역별 여행지
	public Map<String, Object> getLocationWithArea(Map<String, Object> param);
	
	// 최근 가입 숙소
	public List<Map<String, Object>> getResentPartnerList(Map<String, Object> param);
	
}

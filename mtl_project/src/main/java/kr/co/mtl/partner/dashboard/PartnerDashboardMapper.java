package kr.co.mtl.partner.dashboard;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PartnerDashboardMapper {

	// 객실 별 오늘 예약 건수
	public List<Map<String, Object>> getRoomReservation(Map<String, Object> param);
	
	// 오늘 매출, 한달 매출
	public Map<String, Object> getPayout(Map<String, Object> param);
	
	// 공지사항
	public List<Map<String, Object>> getNotice(Map<String, Object> param);
	
	// 평점
	public Map<String, Object> getScore(Map<String, Object> param);
	
	// 후기
	public Map<String, Object> getReview(Map<String, Object> param);
	
	// 미답변 후기
	public Map<String, Object> getReviewNoReply(Map<String, Object> param);
	
}

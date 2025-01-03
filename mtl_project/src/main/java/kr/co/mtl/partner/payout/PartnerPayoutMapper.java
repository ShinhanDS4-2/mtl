package kr.co.mtl.partner.payout;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PartnerPayoutMapper {
	

/* [판매자] 결제 관리 > 정산내역 */	
	int getPartnerPayoutListCount(Map<String, Object> param);  // 정산내역 리스트 총 개수
	List<Map<String, Object>> getPartnerPayoutList(Map<String, Object> param);  // 정산내역 리스트 조회
	List<Map<String, Object>> getPartnerPayoutDetailList(Map<String, Object> param);  // 정산 상세내역 리스트 조회
	
	

	
}

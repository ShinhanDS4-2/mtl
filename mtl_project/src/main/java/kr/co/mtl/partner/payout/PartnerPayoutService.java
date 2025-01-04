package kr.co.mtl.partner.payout;

import java.util.Map;

public interface PartnerPayoutService {
 

	// [판매자] 정산내역 리스트 조회	
	Map<String, Object> getPartnerPayoutList(Map<String, Object> param);
	
	// [판매자] 정산 상세내역 리스트 조회
	Map<String, Object> getPartnerPayoutDetailList(Map<String, Object> param);
	
	
}

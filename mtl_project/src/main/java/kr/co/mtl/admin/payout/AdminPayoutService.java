package kr.co.mtl.admin.payout;

import java.util.Map;

public interface AdminPayoutService {

	// [관리자] 정산내역 리스트 조회	
	Map<String, Object> getAdminPayoutList(Map<String, Object> param);
	
	// [관리자] 정산 상세내역 조회
	Map<String, Object> getAdminPayoutDetail(Map<String, Object> param);
	
}

package kr.co.mtl.admin.payout;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminPayoutMapper {
	
	/* [관리자] 정산내역 */	 
	int getAdminPayoutListCount(Map<String, Object> param);   // 정산내역 리스트 총 개수
	List<Map<String, Object>> getAdminPayoutList(Map<String, Object> param);  // 정산내역 리스트 조회
	Map<String, Object> getAdminPayoutDetail(Map<String, Object> param);  // 정산내역 상세정보
	int updateCalculateStatus(Map<String, Object> param);  // 정산상태 변경
	
}

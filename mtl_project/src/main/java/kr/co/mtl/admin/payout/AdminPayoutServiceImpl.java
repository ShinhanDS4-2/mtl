package kr.co.mtl.admin.payout;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminPayoutServiceImpl implements AdminPayoutService {

	@Autowired
	private AdminPayoutMapper payoutMapper;
  
	/** 시온
	 * [관리자] 정산내역 리스트 조회
	 * @param calculate_date_start(정산기간필터 시작일), calculate_date_end(정산기간필터 종료일), calculate_status(정산상태)
	 * @return PayoutListCount, PayoutList, Param
	 */
	public Map<String, Object> getAdminPayoutList(Map<String, Object> param) {
		System.out.println("param 값은? " + param);  //calculate_date_start, calculate_date_end, calculate_status값이 들어있어야 함
		
		Map<String, Object> result = new HashMap<>();
		
		List<Map<String, Object>> list = payoutMapper.getAdminPayoutList(param);  // 정산내역 리스트
		int count = payoutMapper.getAdminPayoutListCount(param);  // 정산내역 리스트 총 개수
		
		result.put("PayoutList", list);
		result.put("PayoutListCount", count);
		result.put("Param", param);  // 요청데이터를 응답에 포함
		
		System.out.println("result 값은? " + result);  // PayoutListCount, PayoutList, Param 정보가 들어있어야 함
		return result;
	}
	
	/** 시온
	 * [관리자] 정산 상세내역 리스트 조회
	 * @param reservation_idx (예약idx)
	 * @return PayoutDetail    
	 */
	public Map<String, Object> getAdminPayoutDetail(Map<String, Object> param) {
		System.out.println("param 값은? " + param);  // reservation_idx값이 들어있어야 함
		
		Map<String, Object> result = new HashMap<>();	
		Map<String, Object> data = payoutMapper.getAdminPayoutDetail(param);  // 정산 상세내역 정보
		
		result.put("PayoutDetail", data);
		
		System.out.println("result 값은? " + result);  // PayoutDetail 정보가 들어있어야 함
		return result;
	}

	/** 시온
	 * [관리자] 정산 상태 변경 
	 * @param reservation_idx (예약idx)
	 * @return result(true/false)  
	 */
	@Override
	public Map<String, Object> updateCalculateStatus(Map<String, Object> param) {
		System.out.println("정산상태변경 param 값은? " + param); 
		
		Map<String, Object> result = new HashMap<>();	
		      
		int update = payoutMapper.updateCalculateStatus(param);
		  
		
		System.out.println("정산상태변경 update 값은? " + update);
		
		if (update > 0) {
			System.out.println("업데이트 성공: " + update + "개의 행이 변경되었습니다.");
			result.put("result", true);
		} else {
			System.out.println("업데이트 실패: 조건에 맞는 데이터가 없습니다.");
			result.put("result", false);
		}         
		 
		System.out.println("result 값은? " + result);    
		return result;   
	}
}

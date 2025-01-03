package kr.co.mtl.partner.payout;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PartnerPayoutServiceImpl implements PartnerPayoutService {

	@Autowired
	private PartnerPayoutMapper payoutMapper;

	/** 시온
	 * [판매자] 정산내역 리스트 조회
	 * @param calculate_date_start(정산기간필터 시작일), calculate_date_end(정산기간필터 종료일), calculate_stauts(정산상태)
	 * @return PayoutListCount, PayoutList(=> 정산일, 총 판매 금액, 총 정산 금액, 정산 대기중인 금액(=정산 상태가 N일 때 정산금액 총합), 정산 완료된 금액(=정산 상태가 Y일 때 정산금액 총합))
	 */
	public Map<String, Object> getPartnerPayoutList(Map<String, Object> param) {
		System.out.println("param 값은? " + param);  //calculate_date_start, calculate_date_end, calculate_stauts값이 들어있어야 함
		
		Map<String, Object> result = new HashMap<>();
		
		List<Map<String, Object>> list = payoutMapper.getPartnerPayoutList(param);  // 정산내역 리스트
		int count = payoutMapper.getPartnerPayoutListCount(param);  // 정산내역 리스트 총 개수
		
		result.put("PayoutList", list);
		result.put("PayoutListCount", count);
		result.put("Param", param);  // 요청데이터를 응답에 포함
		
		System.out.println("result 값은? " + result);  // PayoutListCount, PayoutList 정보가 들어있어야 함
		return result;
	}
	
	/** 시온
	 * [판매자] 정산 상세내역 리스트 조회
	 * @param calculate_date(정산일)
	 * @return PayoutDetailList ( => calculate_date(정산일), idx(예약번호), name(객실명), price(객실요금), calculate_price(정산금액), calculate_stauts(정산 상태) )
	 */
	public Map<String, Object> getPartnerPayoutDetailList(Map<String, Object> param) {
		System.out.println("param 값은? " + param);  //calculate_date값이 들어있어야 함
		
		Map<String, Object> result = new HashMap<>();	
		List<Map<String, Object>> list = payoutMapper.getPartnerPayoutDetailList(param);  // 정산 상세내역 리스트
		
		result.put("PayoutDetailList", list);
		result.put("calculate_date", param.get("calculate_date"));  // 요청데이터를 응답에 포함
		
		System.out.println("result 값은? " + result);  // PayoutDetailList 정보가 들어있어야 함
		return result;
	}
	
	

}

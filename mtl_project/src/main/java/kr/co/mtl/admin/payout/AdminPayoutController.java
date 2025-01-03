package kr.co.mtl.admin.payout;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
//@Controller("adminPayoutController")  // partner>payout에서의 빈이름과 동일하므로 빈 이름을 명시적으로 다르게 설정해줘서 충돌방지
@RequestMapping("/api/admin/payout")
public class AdminPayoutController {

	@Autowired
	private AdminPayoutService payoutService;

	/** 시온 - API 완료
	 * [관리자] 정산내역 리스트 조회
	 * 페이지 접속 => http://localhost:8090/mtl/admin/payoutlist
	 * @param calculate_date_start(정산기간필터 시작일), calculate_date_end(정산기간필터 종료일), calculate_stauts(정산상태)
	 * @return PayoutListCount, PayoutList, Param
	 */
	@PostMapping("/list")
	public Map<String, Object> getPartnerPayoutList(@RequestParam Map<String, Object> param) throws Exception {
		Map<String, Object> result = payoutService.getAdminPayoutList(param);
		return result;
	}
	
	/** 시온 - API 완료
	 * [관리자] 정산 상세내역 리스트 조회
	 * @param reservation_idx (예약idx)
	 * @return PayoutDetail
	 */
	@PostMapping("/detail")
	public Map<String, Object> getPartnerPayoutDetailList(@RequestParam Map<String, Object> param) throws Exception {
		Map<String, Object> result = payoutService.getAdminPayoutDetail(param);
		return result;
	}
	
}

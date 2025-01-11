package kr.co.mtl.partner.payout;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

   
@RestController
@RequestMapping("/api/partner/payout")
public class PartnerPayoutController {

	@Autowired
	private PartnerPayoutService payoutService;
 
 
	/** 시온 - API 완료
	 * [판매자] 정산내역 리스트 조회 
	 * 페이지 접속 => http://localhost:8090/mtl/partner/payoutlist
	 * @param partner_idx, calculate_date_start(정산기간필터 시작일), calculate_date_end(정산기간필터 종료일), calculate_stauts(정산상태)
	 * @return PayoutListCount, PayoutList(=> 정산일, 총 판매 금액, 총 정산 금액, 정산 대기중인 금액(=정산 상태가 N일 때 정산금액 총합), 정산 완료된 금액(=정산 상태가 Y일 때 정산금액 총합))
	 */
	@PostMapping("/list")
	public Map<String, Object> getPartnerPayoutList(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		param.put("partner_idx", session.getAttribute("login_partner_idx"));
		
		Map<String, Object> result = payoutService.getPartnerPayoutList(param);
		return result;
	}
	
	/** 시온 - API 완료
	 * [판매자] 정산 상세내역 리스트 조회
	 * @param partner_idx, calculate_date(정산일)
	 * @return PayoutDetailList ( => calculate_date(정산일), idx(예약번호), name(객실명), price(객실요금), calculate_price(정산금액), calculate_stauts(정산 상태) )
	 */
	@PostMapping("/detailList")
	public Map<String, Object> getPartnerPayoutDetailList(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		param.put("partner_idx", session.getAttribute("login_partner_idx"));
		
		Map<String, Object> result = payoutService.getPartnerPayoutDetailList(param);
		return result;
	}

	
}

package kr.co.mtl.partner.reservation;

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
//@Controller("partnerPayoutController")  // admin>payout에서의 빈이름과 동일하므로 빈 이름을 명시적으로 다르게 설정해줘서 충돌방지
@RequestMapping("/api/partner/reservation")
public class PartnerReservationController {

	@Autowired 
	private PartnerReservationService reservationService;
 
	/** 시온
	 * [판매자] 예약내역 리스트 조회 
	 * 페이지 접속 => http://localhost:8090/mtl/partner/reservation/list
	 * @param partner_idx, 및 필터들
	 * @return List, Count, Param
	 */
	@PostMapping("/list")
	public Map<String, Object> getReservationList(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		param.put("partner_idx", session.getAttribute("login_partner_idx"));  // 세션에서 partner_idx 얻어서 param에 넣어주기
		
		Map<String, Object> result = reservationService.getReservationList(param);
		return result;
	}
	 
	/** 시온
	 * [판매자] 예약내역 상세조회
	 * @param reservation_idx(예약idx 값 받아서 조회)
	 * @return Detail, Param
	 */  
	@PostMapping("/detail")
	public Map<String, Object> getReservationDetail(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {   
		Map<String, Object> result = reservationService.getReservationDetail(param);
		return result;
	}
	
	/** 시온
	 * [판매자] 숙소에 등록되어 있는 객실타입 조회
	 * @param partner_idx (세션에서 가져오는거임)
	 * @return roomTypeList
	 */    
	@PostMapping("/roomList")
	public Map<String, Object> getRoomTypeList(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		param.put("partner_idx", session.getAttribute("login_partner_idx"));  // 세션에서 partner_idx 얻어서 param에 넣어주기
		
		Map<String, Object> result = reservationService.getRoomTypeList(param);
		return result;
	}
	
}

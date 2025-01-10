package kr.co.mtl.admin.accomodation;

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
@RequestMapping("/api/admin/reservation")
public class AdminReservationController {

	@Autowired 
	private AdminReservationService reservationService;
 
	/** 시온
	 * [관리자] 예약내역 리스트 조회 
	 * @param 검색필터(date_start시작일, date_end종료일, payment_status정산상태, partnerName숙소명)
	 * @return List, Count, Param
	 */
	@PostMapping("/list")
	public Map<String, Object> getReservationList(@RequestParam Map<String, Object> param) throws Exception {
		Map<String, Object> result = reservationService.getReservationList(param);
		return result;
	}  
	
	/** 시온
	 * [관리자] 예약내역 상세조회
	 * @param reservation_idx(예약idx 값 받아서 조회)
	 * @return Detail, Param
	 */ 
	@PostMapping("/detail")   
	public Map<String, Object> getReservationDetail(@RequestParam Map<String, Object> param) throws Exception {
		Map<String, Object> result = reservationService.getReservationDetail(param);
		return result;
	}
	
	
}

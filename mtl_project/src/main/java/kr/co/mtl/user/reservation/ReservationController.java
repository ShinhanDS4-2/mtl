package kr.co.mtl.user.reservation;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/user/reservation")
public class ReservationController {

	@Autowired
	private ReservationService reservationService;

	/**
	 * 예약 상세 정보
	 * @param param
	 * @return 예약 상세
	 */
	@PostMapping("/detail")
	public Map<String, Object> getDetail(@RequestBody Map<String, Object> param, HttpServletRequest request) throws Exception {
		
		Map<String, Object> result = reservationService.getDetail(param, request);
		
		return result;
	}
	
	/**
	 * 회원별 예약 리스트
	 * @param param
	 * @return 예약 리스트
	 */
	@PostMapping("/list")
	public Map<String, Object> getList(@RequestBody Map<String, Object> param) throws Exception {
		
		Map<String, Object> result = reservationService.getList(param);
		
		return result;
	}
	
}

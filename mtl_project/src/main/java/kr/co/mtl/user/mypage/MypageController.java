package kr.co.mtl.user.mypage;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/user/mypage")
public class MypageController {

	@Autowired
	private MypageService locationService;

	
	/** 시온 - API 완료
	 * [사용자] 마이페이지 예약내역 리스트(상세정보) 조회
	 * 상세페이지 접속 => http://localhost:8090/mtl/mypage/reservation
	 * @param user_idx
	 * @return ReservationListCount, ReservationList (=> 예약idx, 판매자(=숙소)idx, 숙소이름, 숙소위치정보, 예약 입실/퇴실 일자, 예약인원, 객실 금액, img, 객실타입roomtype)
	 */
	@PostMapping("/reservationHistoryList")
	public Map<String, Object> getMypageReservationHistory(@RequestParam Map<String, Object> param) throws Exception {
		Map<String, Object> result = locationService.getMypageReservationHistoryList(param);
		return result;
	}
	


	
}

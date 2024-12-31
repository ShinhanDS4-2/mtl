package kr.co.mtl.user.location;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/user/location")
public class LocationController {

	@Autowired
	private LocationService locationService;

	/** 시온 - 완료
	 * [사용자] 지역 별 여행지 리스트 조회
	 * 리스트 페이지 접속 => http://localhost:8090/mtl/area/list
	 * @param LOCATION테이블에서 쓰일 area지역, type타입
	 * @return 여행지 리스트 LocationList, 리스트 총 갯수 LocationListCount
	 */
	@PostMapping("/list")
	public Map<String, Object> getLocationList(@RequestParam Map<String, Object> param) throws Exception {
		System.out.println("paradmddㅇㅇㅇㅇㅇㅇㅇㅇ" + param);
		Map<String, Object> result = new HashMap<>();
		result = locationService.getLocationList(param);
		return result;
	}
	
	/** 시온 - 완료
	 * [사용자] 여행지(관광지/맛집) 상세페이지 조회
	 * 상세페이지 접속 => http://localhost:8090/mtl/location/detail
	 * @param location_idx
	 * @return 여행지 1개 상세페이지에 들어갈 내용
	 */
	@PostMapping("/detail")
	public Map<String, Object> getLocationDetailImage(@RequestParam Map<String, Object> param) throws Exception {
		Map<String, Object> result = new HashMap<>();
		result = locationService.getLocationDetail(param);
		return result;
	}
	
	/** 시온
	 * [사용자] 마이페이지 예약내역 리스트 조회
	 * 상세페이지 접속 => http://localhost:8090/mtl/mypage/reservation
	 * @param user_idx
	 * @return 예약idx, 숙소이름, 숙소위치정보, 예약 입실/퇴실 일자, 객실 금액, 예약인원
	 */
	@PostMapping("/mypageReservationHistoryList")
	public Map<String, Object> getMypageReservationHistory(@RequestParam Map<String, Object> param) throws Exception {
		Map<String, Object> result = locationService.getMypageReservationHistoryList(param);
		return result;
	}
	
	/** 시온
	 * [사용자] 마이페이지 예약내역 상세정보 조회
	 * @param reservation_idx (예약 idx)
	 * @return 예약테이블에서 뽑고싶은거 뽑으면댐 
	 */
	@PostMapping("/mypageReservationHistoryDetail")
	public Map<String, Object> getMypageReservationHistoryDetail(@RequestParam Map<String, Object> param) throws Exception {
		Map<String, Object> result = locationService.getMypageReservationHistoryDetail(param);
		return result;
	}

	
	/** 시온
	 * [판매자] 결제 관리
	 * @param ?
	 * @return 예약idx, 숙소이름, 숙소위치정보, 예약 입실/퇴실 일자, 객실 금액, 예약인원
	 */
	
	/** 시온
	 * [관리자] 정산 관리
	 * @param ?
	 * @return 예약idx, 숙소이름, 숙소위치정보, 예약 입실/퇴실 일자, 객실 금액, 예약인원
	 */

	
}

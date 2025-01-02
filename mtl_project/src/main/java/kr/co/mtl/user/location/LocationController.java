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

	/** 시온 - API 완료
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
	
	/** 시온 - API 완료
	 * [사용자] 여행지(관광지/맛집) 상세페이지 조회
	 * 상세페이지 접속 => http://localhost:8090/mtl/location/detail
	 * @param location_idx
	 * @return Image, Description, Keyword (=> 여행지 1개 상세페이지에 들어갈 내용)
	 */
	@PostMapping("/detail")
	public Map<String, Object> getLocationDetailImage(@RequestParam Map<String, Object> param) throws Exception {
		Map<String, Object> result = new HashMap<>();
		result = locationService.getLocationDetail(param);
		return result;
	}
	
	

	/** 시온 - API 완료
	 * [판매자] 정산내역 리스트 조회
	 * @param calculate_date_start(정산기간필터 시작일), calculate_date_end(정산기간필터 종료일), calculate_stauts(정산상태)
	 * @return PayoutListCount, PayoutList(=> 정산일, 총 판매 금액, 총 정산 금액, 정산 대기중인 금액(=정산 상태가 N일 때 정산금액 총합), 정산 완료된 금액(=정산 상태가 Y일 때 정산금액 총합))
	 */
	@PostMapping("/PartnerPayoutList")
	public Map<String, Object> getPartnerPayoutList(@RequestParam Map<String, Object> param) throws Exception {
		Map<String, Object> result = locationService.getPartnerPayoutList(param);
		return result;
	}
	
	/** 시온 - API 완료
	 * [판매자] 정산 상세내역 리스트 조회
	 * @param calculate_date(정산일)
	 * @return PayoutDetailList ( => calculate_date(정산일), idx(예약번호), name(객실명), price(객실요금), calculate_price(정산금액), calculate_stauts(정산 상태) )
	 */
	@PostMapping("/PartnerPayoutDetailList")
	public Map<String, Object> getPartnerPayoutDetailList(@RequestParam Map<String, Object> param) throws Exception {
		Map<String, Object> result = locationService.getPartnerPayoutDetailList(param);
		return result;
	}

	
	/** 시온
	 * [관리자] 정산 관리
	 * @param ?
	 * @return 예약idx, 숙소이름, 숙소위치정보, 예약 입실/퇴실 일자, 객실 금액, 예약인원
	 */
	@PostMapping("/AdminPayoutList")
	public Map<String, Object> getAdminPayoutList(@RequestParam Map<String, Object> param) throws Exception {
		Map<String, Object> result = locationService.getPartnerPayoutList(param);
		return result;
	}

	
}

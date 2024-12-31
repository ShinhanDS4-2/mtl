package kr.co.mtl.user.location;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LocationServiceImpl implements LocationService {

	@Autowired
	private LocationMapper locationMapper;

	/** 시온
	 * [사용자] 지역 별 여행지 리스트 조회
	 * @param LOCATION테이블에서 쓰일 area지역, type타입
	 * @return 여행지 리스트 페이지에 조회 될 여행지 목록들을 Map 형태로 저장하여 반환
	 */
	public Map<String, Object> getLocationList(Map<String, Object> param) {

		Map<String, Object> result = new HashMap<>();
		System.out.println("param 값은 멀까요" + param);
		List<Map<String, Object>> list = locationMapper.getLocationList(param);
		for(Map<String, Object> data : list) {  // 반복문 돌면서 data에는 여행지 정보, 사진, 키워드 데이터가 합쳐짐
			param.put("location_idx", data.get("location_idx"));
			
			Map<String, Object> img = locationMapper.getLocationImage(param); // param으로 location_idx를 넘겨줌
			System.out.println("img: " + img);
			data.put("image", img);
			
			List<Map<String, Object>> keyword = locationMapper.getLocationKeyword(param); // param으로 location_idx를 넘겨줌
			System.out.println("keyword: " + keyword);
			data.put("keyword", keyword); 
		}
		result.put("LocationList", list);
		return result;
	};

	/** 시온
	 * [사용자] 여행지(관광지/맛집) 상세페이지 조회 => (상세페이지 사진, 상세페이지 정보, 상세페이지 키워드 3가지 mapper를 사용)
	 * @param location_idx
	 * @return 여행지 상세페이지에 들어갈 내용들을 Map 형태로 저장하여 반환
	 */
	public Map<String, Object> getLocationDetail(Map<String, Object> param) {
		// 여기는 처음부터 param 값에 location_idx가 들어옴. 리스트에서 클릭해서 location_idx값에 대한 상세정보를 조회하는 것이기 때문.

		Map<String, Object> result = new HashMap<>();

		List<Map<String, Object>> img = locationMapper.getLocationDetailImage(param); // 여행지(관광지/맛집) 상세페이지 사진
		Map<String, Object> description = locationMapper.getLocationDetailDescription(param); // 여행지(관광지/맛집) 상세페이지 정보
		List<Map<String, Object>> keyword = locationMapper.getLocationDetailKeyword(param); // 여행지(관광지/맛집) 상세페이지 키워드

		// 위에서 받은 사진/정보/키워드 정보들을 Key:value 형태로 result에 넣어준다.
		result.put("Image", img);
		result.put("Description", description);
		result.put("Keyword", keyword);

		return result;
	};
	
	
	
	/** 시온
	 * [사용자] 마이페이지 예약내역 리스트 조회
	 * @param user_idx
	 * @return 예약idx, 숙소이름, 숙소위치정보, 예약 입실/퇴실 일자, 객실 금액, 예약인원
	 */
	public Map<String, Object> getMypageReservationHistoryList(Map<String, Object> param) {
		System.out.println("param 값은? " + param);
		
		Map<String, Object> result = new HashMap<>();
		
		List<Map<String, Object>> list = locationMapper.getMypageReservationHistoryList(param);
		result.put("ReservationHistoryList", list);
		System.out.println("result 값은? " + result);
		return result;
	}
	
	/** 시온
	 * [사용자] 마이페이지 예약내역 상세정보 조회
	 * @param reservation_idx (예약 idx)
	 * @return 예약테이블에서 뽑고싶은거 뽑으면댐 
	 */
	public Map<String, Object> getMypageReservationHistoryDetail(Map<String, Object> param) {
		Map<String, Object> result = locationMapper.getMypageReservationHistoryDetail(param);
		return result;
	}

}

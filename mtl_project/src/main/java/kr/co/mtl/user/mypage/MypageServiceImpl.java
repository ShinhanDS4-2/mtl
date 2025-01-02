package kr.co.mtl.user.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	private MypageMapper locationMapper;
	
	/** 시온
	 * [사용자] 마이페이지 예약내역 리스트(상세정보) 조회
	 * @param user_idx
	 * @return ReservationListCount, ReservationList (=> 예약idx, 판매자(=숙소)idx, 숙소이름, 숙소위치정보, 예약 입실/퇴실 일자, 예약인원, 객실 금액, img, 객실타입roomtype)
	 */
	public Map<String, Object> getMypageReservationHistoryList(Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();  // 결과 넣을 Map
		
		int count = locationMapper.getReservationHistoryListCount(param);  // 마이페이지 예약내역 리스트 총 개수
		List<Map<String, Object>> list = locationMapper.getReservationHistoryList(param);  // 마이페이지 예약내역 리스트
		
		// 예약내역 list에 숙소 사진정보 넣어주는 반복문
		for(Map<String, Object> data : list) {  // 예약내역 리스트 list에서 1개의 예약내역 data를 뽑음	
			// 예약내역 1개에서 partner_idx값만 뽑음
			Map<String, Object> partner_idx = new HashMap<>();
			partner_idx.put("partner_idx", data.get("partner_idx")); // data.get("partner_idx") : MAP형태로 된 data에서 get 메서드를 사용하여 "partner_idx"키에 대응하는 값을 가져옴
			
			System.out.println("Map<String, Object> partner_idx 값은? " + partner_idx);

			// 예약내역 리스트에 띄울 숙소 사진 1장 조회 (partner_idx를 넘겨줌)
			Map<String, Object> img = locationMapper.getReservImg(partner_idx);
			System.out.println("img 값은? " + img);
			
			// 뽑은 숙소 이미지를 data에 넣어줌. (Map으로 된 1개의 예약내역 data에 img를 넣어주는 것)
			data.put("img", img);
			
			// data에서 "reservation_idx" 키로 된 값을 가져와서 reservation_idx변수에 넣어줌
			Map<String, Object> reservation_idx = Map.of("reservation_idx", data.get("reservation_idx"));
			
			// 예약내역 상세정보에 객실타입정보 넣어주기
			Object roomtype = locationMapper.getReservRoomtype(reservation_idx);
			System.out.println("roomtype 값은? " + roomtype);
			
			// 위에서 뽑은 객실타입정보를 data에 넣어줌. 
			data.put("roomtype", roomtype);
						
		}

		result.put("ReservationList", list);
		result.put("ReservationListCount", count);
		
		System.out.println("result 값은? " + result);  // ReservationList, ReservationListCount 정보가 들어있어야 함
		return result;
	}
	


}

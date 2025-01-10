package kr.co.mtl.partner.reservation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

@Service
public class PartnerReservationServiceImpl implements PartnerReservationService {

	@Autowired
	private PartnerReservationMapper reservationMapper;
 

	/** 시온
	 * [판매자] 예약내역 리스트 조회 
	 * @param partner_idx, 및 필터들
	 * @return List, Count, Param
	 */
	@Override
	public Map<String, Object> getReservationList(Map<String, Object> param) {
		System.out.println("param 값은? " + param);
		
		Map<String, Object> result = new HashMap<>();
		
		int count = reservationMapper.getReservationListCount(param);  // 리스트 총 개수
		List<Map<String, Object>> list = reservationMapper.getReservationList(param);  // 리스트 내역
		
		result.put("Count", count);
		result.put("List", list);
		result.put("Param", param);  // 요청데이터를 응답에 포함
		
		
		return result;
  
		
	}
	
	/** 시온
	 * [판매자] 예약내역 상세조회
	 * @param reservation_idx(예약idx 값 받아서 조회)
	 * @return Detail, Param
	 */
	@Override
	public Map<String, Object> getReservationDetail(@RequestParam Map<String, Object> param) {
		System.out.println("param 값은? " + param);
		
		Map<String, Object> result = new HashMap<>();
		
		Map<String, Object> detail = reservationMapper.getReservationDetail(param);  // 상세정보 조회 
		
		result.put("Detail", detail);
		result.put("Param", param);  // 요청데이터를 응답에 포함
		
		return result;
		 
	}

	/** 시온
	 * [판매자] 숙소에 등록되어 있는 객실타입 조회
	 * @param partner_idx
	 * @return roomTypeList
	 */
	@Override
	public Map<String, Object> getRoomTypeList(Map<String, Object> param) {
		System.out.println("param 값은? " + param);
		
		Map<String, Object> result = new HashMap<>();
		
		List<Map<String, Object>> list = reservationMapper.getRoomTypeList(param);  // 숙소가 가지고 있는 객실타입 목록이 반환됨
		
		result.put("roomTypeList", list);
		
		return result;
	}


	
	

}

package kr.co.mtl.user.reservation;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationMapper reservationMapper;

	/**
	 * 예약 상세 정보
	 * @param param
	 * @return 예약 상세
	 */
	public Map<String, Object> getDetail(Map<String, Object> param, HttpServletRequest request) {
		
		Map<String, Object> result = new HashMap<>();
		
		HttpSession session = request.getSession();
		String userIdx = String.valueOf(session.getAttribute("login_user_idx"));
		param.put("user_idx", userIdx);
		
		Map<String, Object> data = reservationMapper.getDetail(param);
		result.put("data", data);
		
		return result;
	};

	/**
	 * 예약 취소
	 * @param param
	 * @return 
	 */
	public Map<String, Object> cancelReservation(Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		
		// TODO 아임포트 환불
		
		result.put("result", reservationMapper.cancelReservation(param));
		
		return result;
	};
	
}

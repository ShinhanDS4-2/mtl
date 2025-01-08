package kr.co.mtl.user.reservation;

import java.util.HashMap;
import java.util.List;
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
	 * 회원 별 예약 리스트
	 * @param param
	 * @return 예약 리스트
	 */
	public Map<String, Object> getList(Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		
		List<Map<String, Object>> list = reservationMapper.getList(param);
		result.put("list", list);
		result.put("totalCnt", reservationMapper.getListCnt(param));
		
		return result;
	};

}

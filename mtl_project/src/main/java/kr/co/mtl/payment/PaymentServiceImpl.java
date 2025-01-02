package kr.co.mtl.payment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.siot.IamportRestClient.IamportClient;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private PaymentMapper paymentMapper;
	
	@Value("${imp.api.key}")
	private String API_KEY;
	
	@Value("${imp.secret.key}")
	private String SECRET_KEY;

	private IamportClient iamportClient = new IamportClient(API_KEY, SECRET_KEY);
	
	/**
	 * 숙소 예약 결제
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public Map<String, Object> reservationComplete(Map<String, Object> param, HttpServletRequest request) throws Exception {
		
		Map<String, Object> result = new HashMap<>();
		
		HttpSession session = request.getSession();
		param.put("user_idx", session.getAttribute("login_user_idx"));
		
		if (paymentMapper.reservationComplete(param) > 0) {
			paymentMapper.totalReservationUpdate(param);
			result.put("result", true);
			result.put("reservation_idx", param.get("reservation_idx"));
		} else {
			result.put("result", false);
		};
		
		return result;
	}
	
}

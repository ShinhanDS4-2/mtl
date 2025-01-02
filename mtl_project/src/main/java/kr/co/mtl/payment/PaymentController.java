package kr.co.mtl.payment;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/payment")
public class PaymentController {

	@Autowired
	private PaymentService paymentService;
	
	/**
	 * 숙소 예약 결제
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/reservation")
	public Map<String, Object> reservationComplete(@RequestBody Map<String, Object> param, HttpServletRequest request) throws Exception {
		
		Map<String, Object> result = paymentService.reservationComplete(param, request);
		
		return result;
  	}
}

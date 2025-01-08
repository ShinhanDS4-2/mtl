package kr.co.mtl.payment;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.siot.IamportRestClient.IamportClient;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
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
	
	/**
	 * 예약 취소
	 * @param param
	 * @return 
	 */
	public Map<String, Object> cancelReservation(Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		
		// TODO 아임포트 환불
		// 토큰 발급
		String token = getToken();
		if (token == null || "".equals(token)) {
			result.put("result", false);
			return result;
		};

		// 결제 코드 조회
		String reservationCode = paymentMapper.getReservationCode(param);
		
		// 환불 API 호출
		try {
			URL url = new URL("https://api.iamport.kr/payments/cancel");
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Content-Type", "application/json");
	        conn.setRequestProperty("Accept", "application/json");
	        conn.setRequestProperty("Authorization", token);
	        
	        conn.setDoOutput(true);
	        
	        JSONObject jsonData = new JSONObject();
	        jsonData.put("merchant_uid", reservationCode);
	        jsonData.put("reason", "고객 요청으로 환불 처리");
	        
	        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	        bw.write(jsonData.toString());
	        bw.flush();
	        bw.close();
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        br.close();
	        
	        conn.disconnect();
	        
	        log.info("[결제 취소 완료] : 예약 코드 ===============> " + reservationCode);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", false);
			return result;
		}
		
		if (paymentMapper.cancelReservation(param) > 0) {
			result.put("result", true);
		} else {
			result.put("result", false);
		}
		
		return result;
	};
	
	/**
	 * 토큰 발급
	 * @return 토큰
	 */
	private String getToken() {
		String token = "";
		
		try {
			URL url = new URL("https://api.iamport.kr/users/getToken");
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Content-Type", "application/json");
	        conn.setRequestProperty("Accept", "application/json");
	        conn.setDoOutput(true);
	        
	        JSONObject jsonData = new JSONObject();
	        jsonData.put("imp_key", API_KEY);
	        jsonData.put("imp_secret", SECRET_KEY);
	        
	        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	        bw.write(jsonData.toString());
	        bw.flush();
	        bw.close();
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        Gson gson = new Gson(); 
	        String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();
	        String accessToken = gson.fromJson(response, Map.class).get("access_token").toString();
	        br.close();
	        
	        conn.disconnect();
	        
	        log.info("[ACCESS TOKEN] ===============> " + accessToken);
	        token = accessToken;
	        
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return token;
	}
	
}

package kr.co.mtl.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {

	// home
	@GetMapping({"/"})
	public String home() {
		return "user/home";
	}
	
	// 숙소 리스트
	@GetMapping("partnerList")
	public String partnerList() {
		return "user/partnerList";
	}
	
	// 숙소 상세
	@GetMapping("partnerDetail")
	public String partnerDetail() {
		return "user/partnerDetail";
	}
	
	// 예약
	@GetMapping("reservation")
	public String reservation() {
		return "user/reservation";
	}
	
	// 예약 완료
	@GetMapping("reservationConfirm")
	public String reservationConfirm() {
		return "user/reservationConfirm";
	}
	
	// 여행지 상세
	@GetMapping("locationDetail")
	public String locationDetail() {
		return "user/locationDetail";
	}
	
	// 지역 리스트
	@GetMapping("areaList")
	public String areaList() {
		return "user/areaList";
	}
	
	// 마이페이지
	@GetMapping("mypage")
	public String mypage() {
		return "user/mypage";
	}
}

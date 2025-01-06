package kr.co.mtl.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/partner")
public class PartnerPageController {
	// 예약 리스트
	@GetMapping("/bookingdetail")
	public String bookingdetail() {
		return "partner/booking/bookingdetail";
	}
	
	// 예약 상세
	@GetMapping("/bookinglist")
	public String bookinglist() {
		return "partner/booking/bookinglist";
	}
	
	// 1:1 문의
	@GetMapping("/question")
	public String question() {
		return "partner/customer/question";
	}
	
	// 1:1 문의 답변
	@GetMapping("/questionreply")
	public String questionreply() {
		return "partner/customer/questionreply";
	}
	
	// 후기
	@GetMapping("/reviews")
	public String reviews() {
		return "partner/customer/reviews";
	}
	
	// home
	@GetMapping("/dashboard")
	public String dashboard() {
		return "partner/home/dashboard";
	}
	
	// 숙소 등록
	@GetMapping("/regist")
	public String hotelregist() {
		return "partner/hotel/regist";
	}
	
	// 객실 등록
	@GetMapping("/roomregist")
	public String roomregist() {
		return "partner/hotel/roomregist";
	}
	
	@GetMapping("/mypage")
	public String mypage() {
		return "partner/mypage";
	}
	
	@GetMapping("/notice")
	public String notice() {
		return "partner/otherPages/notice";
	}
	
	// 로그인
	@GetMapping("/login")
	public String login() {
		return "partner/login";
	}
	
	// 회원가입
	@GetMapping("/join")
	public String join() {
		return "partner/join";
	}
	
	// payout
	@GetMapping("/payoutlist")
	public String payoutlist() {
		return "partner/payout/payoutlist";
	}
}


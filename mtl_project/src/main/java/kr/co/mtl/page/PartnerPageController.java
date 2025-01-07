package kr.co.mtl.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/partner")
public class PartnerPageController {
	
	// 예약 리스트
	@GetMapping("/reservation/detail")
	public String reservationDetail() {
		return "partner/reservation/reservationDetail";
	}
	
	// 예약 상세
	@GetMapping("/reservation/list")
	public String reservationList() {
		return "partner/reservation/reservationList";
	}
	
	// 1:1 문의
	@GetMapping("/question")
	public String question() {
		return "partner/customer/question";
	}
	
	// 1:1 문의 답변
	@GetMapping("/question/reply")
	public String questionReply() {
		return "partner/customer/questionReply";
	}
	
	// 후기
	@GetMapping("/review")
	public String review() {
		return "partner/customer/review";
	}
	
	// home
	@GetMapping("/dashboard")
	public String dashboard() {
		return "partner/home/dashboard";
	}
	
	// 숙소 등록
	@GetMapping("/accomodation")
	public String hotelregist() {
		return "partner/accomodation/regist";
	}
	
	// 객실 등록
	@GetMapping("/accomodation/room")
	public String room() {
		return "partner/accomodation/room";
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
	@GetMapping("/payout/list")
	public String payoutlist() {
		return "partner/payout/payoutList";
	}
}


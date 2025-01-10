package kr.co.mtl.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminPageController {

	// 대시보드
	@GetMapping("/dashboard")
	public String dashboard() {
		return "admin/home/dashboard";
	}

	// 숙소 관리 - 예약 관리
	@GetMapping("/accomodation/reservation/list")
	public String reservationList() {
		return "admin/accomodation/reservationList";
	}

	// 숙소 관리 - 상세
	@GetMapping("/accomodation/detail")
	public String accomodationDetail() {
		return "admin/accomodation/partnerDetail";
	}

	// 숙소 관리 - 리스트
	@GetMapping("/accomodation/list")
	public String accomodationList() {
		return "admin/accomodation/partnerList";
	}

	// 숙소 관리 - 숙소 문의 관리
	@GetMapping("/accomodation/question")
	public String accomodationQuestion() {
		return "admin/accomodation/question";
	}

	// 여행지 관리 - 여행지 상세
	@GetMapping("/location/detail")
	public String locationDetail() {
		return "admin/location/locationDetail";
	}

	// 여행지 관리 - 여행지 리스트
	@GetMapping("/location/list")
	public String locationList() {
		return "admin/location/locationList";
	}

	// 정산 관리
	@GetMapping("/payout")
	public String payoutList() {
		return "admin/payout/payoutList";
	}

	// 고객 문의 - 공지사항
	@GetMapping("/notice")
	public String notice() {
		return "admin/support/notice";
	}

	// 고객 문의 - 자주 묻는 질문
	@GetMapping("/faq")
	public String faq() {
		return "admin/support/faq";
	}

	// 고객 문의 - 1:1 문의
	@GetMapping("/question")
	public String question() {
		return "admin/support/question";
	}

	// 고객 문의 - 1:1 문의 답변
	@GetMapping("/question/reply")
	public String questionReply() {
		return "admin/support/questionReply";
	}

	// 회원 관리 - 판매자 상세
	@GetMapping("/partner/detail")
	public String partnerDetail() {
		return "admin/user/partnerDetail";
	}

	// 회원 관리 - 판매자 리스트
	@GetMapping("/partner/list")
	public String partnerList() {
		return "admin/user/partnerList";
	}

	// 회원 관리 - 사용자 상세
	@GetMapping("/user/detail")
	public String userDetail() {
		return "admin/user/userDetail";
	}

	// 회원 관리 - 사용자 리스트
	@GetMapping("/user/list")
	public String userList() {
		return "admin/user/userList";
	}

	// 내 정보 수정
	@GetMapping("/mypage")
	public String mypage() {
		return "admin/otherPages/mypage";
	}

	// 로그인
	@GetMapping("/login")
	public String login() {
		return "admin/otherPages/login";
	}
	
}

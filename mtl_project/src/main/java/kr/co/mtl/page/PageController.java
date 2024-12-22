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
	@GetMapping("partner/list")
	public String partnerList() {
		return "user/partnerList";
	}
	
	// 숙소 상세
	@GetMapping("partner/detail")
	public String partnerDetail() {
		return "user/partnerDetail";
	}
	
	// 예약
	@GetMapping("reservation")
	public String reservation() {
		return "user/reservation";
	}
	
	// 예약 완료
	@GetMapping("reservation/confirm")
	public String reservationConfirm() {
		return "user/reservationConfirm";
	}
	
	// 여행지 상세
	@GetMapping("location/detail")
	public String locationDetail() {
		return "user/locationDetail";
	}
	
	// 지역 리스트
	@GetMapping("area/list")
	public String areaList() {
		return "user/areaList";
	}
	
	// 마이페이지 내 정보 관리
	@GetMapping("mypage/info")
	public String mypageInfo() {
		return "user/mypage/info";
	}
	
	// 마이페이지 예약내역
	@GetMapping("mypage/reservation")
	public String mypageReservation() {
		return "user/mypage/reservation";
	}
	
	// 마이페이지 1:1 문의
	@GetMapping("mypage/question")
	public String mypageQuestion() {
		return "user/mypage/question";
	}

	// 마이페이지 리뷰
	@GetMapping("mypage/review")
	public String mypageReview() {
		return "user/mypage/review";
	}
	
	// 고객센터 자주 묻는 질문
	@GetMapping("service/qna")
	public String serviceQnA() {
		return "user/service/qna";
	}

	// 고객센터 공지사항
	@GetMapping("service/notice")
	public String serviceNotice() {
		return "user/service/notice";
	}
}

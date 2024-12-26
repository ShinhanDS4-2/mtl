package kr.co.mtl.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminPageController {

	// home
	@GetMapping("/dashboard")
	public String dashboard() {
		return "admin/home/dashboard";
	}

	// hotel
	@GetMapping("/bookinglist")
	public String bookinglist() {
		return "admin/hotel/bookinglist";
	}

	@GetMapping("/hotedetail")
	public String hotedetail() {
		return "admin/hotel/hotedetail";
	}

	@GetMapping("/hotellist")
	public String hotellist() {
		return "admin/hotel/hotellist";
	}

	@GetMapping("/question")
	public String question() {
		return "admin/hotel/question";
	}

	// location
	@GetMapping("/locationdetail")
	public String locationdetail() {
		return "admin/location/locationdetail";
	}

	@GetMapping("/locationlist")
	public String locationlist() {
		return "admin/location/locationlist";
	}

	// payout
	@GetMapping("/payoutlist")
	public String payoutlist() {
		return "admin/payout/payoutlist";
	}

	// support
	@GetMapping("/notice")
	public String notice() {
		return "admin/support/notice";
	}

	@GetMapping("/qna")
	public String qna() {
		return "admin/support/qna";
	}

	@GetMapping("/question2")
	public String question2() {
		return "admin/support/question";
	}

	@GetMapping("/questionreply")
	public String questionreply() {
		return "admin/support/questionreply";
	}

	// user
	@GetMapping("/partnerdetail")
	public String partnerdetail() {
		return "admin/user/partnerdetail";
	}

	@GetMapping("/partnerlist")
	public String partnerlist() {
		return "admin/user/partnerlist";
	}

	@GetMapping("/userdetail")
	public String userdetail() {
		return "admin/user/userdetail";
	}

	@GetMapping("/userlist")
	public String userlist() {
		return "admin/user/userlist";
	}

	// otherPages
	@GetMapping("/forgotpassword")
	public String forgotpassword() {
		return "admin/otherPages/forgotpassword";
	}

	@GetMapping("/mypage")
	public String mypage() {
		return "admin/otherPages/mypage";
	}

	@GetMapping("/signin")
	public String signin() {
		return "admin/otherPages/signin";
	}

	@GetMapping("/signup")
	public String signup() {
		return "admin/otherPages/signup";
	}
	

	
}

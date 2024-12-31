package kr.co.mtl.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/partner")
public class PartnerPageController {
	// booking
	@GetMapping("/bookingdetail")
	public String bookingdetail() {
		return "partner/booking/bookingdetail";
	}
	
	@GetMapping("/bookinglist")
	public String bookinglist() {
		return "partner/booking/bookinglist";
	}
	
	// customer	
	@GetMapping("/question")
	public String question() {
		return "partner/customer/question";
	}
	
	@GetMapping("/questionreply")
	public String questionreply() {
		return "partner/customer/questionreply";
	}
	
	@GetMapping("/reviews")
	public String reviews() {
		return "partner/customer/reviews";
	}
	
	@GetMapping("/reviews2")
	public String reviews2() {
		return "partner/customer/reviews2";
	}
	
	// home
	@GetMapping("/dashboard")
	public String dashboard() {
		return "partner/home/dashboard";
	}
	
	// hotel
	@GetMapping("/hotelregist")
	public String hotelregist() {
		return "partner/hotel/hotelregist";
	}
	
	@GetMapping("/roomregist")
	public String roomregist() {
		return "partner/hotel/roomregist";
	}
	
	// otherPages
	@GetMapping("/forgotpassword")
	public String forgotpassword() {
		return "partner/otherPages/forgotpassword";
	}
	@GetMapping("/mypage")
	public String mypage() {
		return "partner/otherPages/mypage";
	}
	@GetMapping("/notion")
	public String notion() {
		return "partner/otherPages/notion";
	}
	@GetMapping("/signin")
	public String signin() {
		return "partner/otherPages/signin";
	}
	@GetMapping("/signup")
	public String signup() {
		return "partner/otherPages/signup";
	}
	
	// payout
	@GetMapping("/payoutlist")
	public String payoutlist() {
		return "partner/payout/payoutlist";
	}
}


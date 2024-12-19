package kr.co.mtl.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class PageController {

	// home
	@GetMapping({"/"})
	public String home() {
		
		log.info("====================> HOME 페이지");
		
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
}

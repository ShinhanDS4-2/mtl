package kr.co.mtl.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/partner")
public class AdminPageController {

	// dashboard
	@GetMapping("/aa")
	public String dashboard() {
		return "partner/booking/detail";
	}
	

	
	

	
}

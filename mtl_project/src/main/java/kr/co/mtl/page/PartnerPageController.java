package kr.co.mtl.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/partner")

public class PartnerPageController {
	// home
	@GetMapping("/")
	public String dashboard() {
		return "partner/home/dashboard";
	}
}


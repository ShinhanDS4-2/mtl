package kr.co.mtl.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class PageController {

	@GetMapping({"/"})
	public String home() {
		
		log.info("====================> HOME 페이지");
		
		return "home";
	}
}

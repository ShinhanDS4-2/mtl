package kr.co.mtl.partner.accomodation;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/partner")
public class AccomodationController {
	
	@Autowired
	private AccomodationService accomodationService;
	
	@PostMapping("/hotelregist")
	@ResponseBody
	public Map<String,Object> hotelRegist(@RequestParam Map<String,Object> param) {
		
		accomodationService.accomodationRegister(param);
		return param;
		
	}
	
}

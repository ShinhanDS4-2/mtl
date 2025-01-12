package kr.co.mtl.admin.partner;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/accomodation")
public class AdminPartnerlistController {
	
	@Autowired
	private AdminPartnerlistService adminPartnerlistService;
	
	@PostMapping("/list")
	@ResponseBody
	public Map<String,Object> searchPartnerlist(@RequestBody Map<String,Object> param){
		
		System.out.println("숙소 관리 Controller 실행 = "+param);
		return adminPartnerlistService.searchPartnerlist(param);
	}
	
	@PostMapping("/detail")
	@ResponseBody
	public Map<String,Object> partnerDetail(@RequestParam int idx){
		
		System.out.println("partnerDetail Controller 실행 = "+idx);
		return adminPartnerlistService.partnerDetail(idx);
	}

}

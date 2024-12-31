package kr.co.mtl.partner.partnernotice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/partner")
public class PartnerNoticeController {

	@Autowired
	private PartnerNoticeService partnerNoticeService;
	
	//이용안내 등록
	@PostMapping("/noticeregist")
	@ResponseBody
	public Map<String,Object> noticeregist(@RequestParam Map<String,Object>param){
	
		partnerNoticeService.partnerNoticeRegister(param);
		return param;
	}
	
	//이용안내 수정
	@PostMapping("/noticeupdate")
	@ResponseBody
	public Map<String,Object> noticeupdate(@RequestParam Map<String,Object>param){
	
		partnerNoticeService.partnerNoticeUpdate(param);
		return param;
	}
	
	
	//이용안내 삭제
	@PostMapping("/noticedelete")
	@ResponseBody
	public String noticedelte(@RequestParam int idx){
	
		partnerNoticeService.partnerNoticeDelete(idx);
		return "success";
	}
	
	//이용안내 목록 조회
	@GetMapping("/noticelist")
	@ResponseBody
	public List<String> getNoticelist(){
		return partnerNoticeService.getPartnerNoticeContent();
	}
	
	
	
}

package kr.co.mtl.partner.room;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


@Controller
@RequestMapping("/partner")
public class RoomController {
	
	@Autowired
	private RoomService roomservice;
	
	
	//객실 조회
	@PostMapping("/roomlist")
	@ResponseBody
	public List<Map<String,Object>> getRoomList(HttpServletRequest request){
		
		HttpSession session = request.getSession();
		Integer loginPartnerIdx = (Integer) session.getAttribute("login_partner_idx");
		
		int partnerIdx = loginPartnerIdx;
		
		System.out.println("partner_idx = "+partnerIdx + "객실 조회 !!");
		
		return roomservice.getRoomList(partnerIdx);
	}
	
	//객실 등록
	@PostMapping("/roomregist")
	@ResponseBody
	public void roomRegist(@RequestParam Map<String,Object> param, @RequestParam(value="option") List<String> option, 
			@RequestParam("images") List<MultipartFile> images,HttpServletRequest request) throws IOException{
		
		HttpSession session = request.getSession();
		Integer loginPartnerIdx = (Integer) session.getAttribute("login_partner_idx");
		
		int partnerIdx = loginPartnerIdx;
		
		roomservice.roomRegister(partnerIdx,param, option,images);
		//return "redirect:/mtl/partner/roomregist";
	}
	
	//객실 상세
	@PostMapping("/roomdetail")
	@ResponseBody
	public Map<String,Object> getRoomdetail(@RequestParam int room_idx) {
		
		return roomservice.getRoomDetail(room_idx);
	}
	
	//객실 수정
	@PostMapping("/roomupdate")
	@ResponseBody
	public void roomUpdate(@RequestParam Map<String,Object> param, @RequestParam(value="option") List<String> option, 
			@RequestParam("images") List<MultipartFile> images) throws Exception{
		
		roomservice.roomUpdate(param, option,images);
		//return "redirect:/mtl/partner/roomregist";
	}
	
	//객실 삭제 (사실상 수정)
	@PostMapping("/roomdelete")
	@ResponseBody
	public void roomDelete(int room_idx) {
		
		System.out.println("삭제 컨트롤러 실행");
		roomservice.roomDelete(room_idx);
	}
}

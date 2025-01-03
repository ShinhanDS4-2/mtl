package kr.co.mtl.partner.room;

import java.io.IOException;
import java.util.List;
import java.util.Map;

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
	public List<Map<String,Object>> getRoomList(@RequestParam int partner_idx){
		System.out.println("partner_idx = "+ partner_idx);
		return roomservice.getRoomList(partner_idx);
	}
	
	//객실 등록
	@PostMapping("/roomregist")
	@ResponseBody
	public void roomRegist(@RequestParam Map<String,Object> param, @RequestParam(value="option") List<String> option, 
			@RequestParam("images") List<MultipartFile> images) throws IOException{
		
		roomservice.roomRegister(param, option,images);
		//return "redirect:/mtl/partner/roomregist";
	}
	
	//객실 상세
	@PostMapping("/roomdetail")
	@ResponseBody
	public Room getRoomdetail(@RequestParam int room_idx) {
		
		Room room=roomservice.getRoomDetail(room_idx);
		
		return room;
		
	}
	
	//객실 수정
	@PostMapping("/roomupdate")
	@ResponseBody
	public void roomUpdate(@RequestParam Map<String,Object> param, @RequestParam(value="option") List<String> option, 
			@RequestParam("images") List<MultipartFile> images) throws IOException{
		
		System.out.println("업데이트 실행하나요???");
		System.out.println("param = "+param);
		System.out.println("option = "+option);
		System.out.println("images = "+images);
		roomservice.roomUpdate(param, option,images);
		//return "redirect:/mtl/partner/roomregist";
	}
	

}

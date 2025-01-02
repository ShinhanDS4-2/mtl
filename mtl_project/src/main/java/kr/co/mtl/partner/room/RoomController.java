package kr.co.mtl.partner.room;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
		return roomservice.getRoomList(partner_idx);
	}
	
	//객실 등록
	@PostMapping("/roomregist")
	@ResponseBody
	public void roomRegist(@RequestParam Map<String,Object> param, @RequestParam(value="option") List<String> option, MultipartFile mfile){
		
		//param.put("option",option);
		//System.out.println(param);
		
		roomservice.roomRegister(param, option);
//		System.out.println("가져온 room_idx = "+room_idx);
		
//		roomservice.roomFacilitiesRegister(room_idx, option);
		
		
//		return param;
	}
	
	//객실 수정
	@PostMapping("/roomupdate")
	@ResponseBody
	public Map<String,Object> roomUpdate(@RequestParam Map<String,Object> param){
		roomservice.roomUpdate(param);
		return param;
	}
	
	
	//객실 삭제
	@PostMapping("/roomdelete")
	@ResponseBody
	public String roomDelete(@RequestParam("idx") int roomId) {
		roomservice.roomDelete(roomId);
		return "success";
	}
}

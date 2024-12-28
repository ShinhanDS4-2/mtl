package kr.co.mtl.partner.room;

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
public class RoomController {
	
	@Autowired
	private RoomService roomservice;
	
	//객실 등록
	@PostMapping("/roomregist")
	@ResponseBody
	public Map<String,Object> roomRegist(@RequestParam Map<String,Object> param){
		
		roomservice.roomRegister(param);
		return param;
		
	}
	

}

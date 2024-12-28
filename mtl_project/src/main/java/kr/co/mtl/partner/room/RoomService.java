package kr.co.mtl.partner.room;

import java.util.List;
import java.util.Map;

public interface RoomService {
	
	void roomRegister(Map<String,Object> param);
	List<Map<String,String>> getRoomList();

}

package kr.co.mtl.partner.room;

import java.util.List;
import java.util.Map;

public interface RoomService {
	
	void roomRegister(Map<String,Object> param, List<String> option);
//	void roomFacilitiesRegister(int room_idx,List<String>option);
	void roomUpdate(Map<String,Object> param);
	void roomDelete(int roomId);
	List<Map<String,Object>> getRoomList(int partner_idx);

}

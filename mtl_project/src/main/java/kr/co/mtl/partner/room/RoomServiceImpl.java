package kr.co.mtl.partner.room;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoomServiceImpl implements RoomService{

	@Autowired
	private RoomMapper roomMapper;
	
	@Override
	public void roomRegister(Map<String, Object> param, List<String> option) {
		
		roomMapper.roomRegister(param);
		int roomIdx = roomMapper.getIdx();
		
		for(String opt:option) {
			System.out.println("serviceImpl 시---작 : room_idx = "+roomIdx+" option = "+option + " opt = "+opt);
			roomMapper.roomFacilitiesRegister(roomIdx, opt);
		}
		
		
	}
	
//	@Override
//	public void roomFacilitiesRegister(int room_idx, List<String> option) {
//	
//		for(String opt:option) {
//			System.out.println("serviceImpl 시---작 : room_idx = "+room_idx+" option = "+option + " opt = "+opt);
//			roomMapper.roomFacilitiesRegister(room_idx, opt);
//		}
//	}

	@Override
	public void roomUpdate(Map<String, Object> param) {
		
		roomMapper.roomUpdate(param);
	}

	@Override
	public void roomDelete(int roomId) {
		
		roomMapper.roomDelete(roomId);
	}
	
	//조회
	@Override
	public List<Map<String, Object>> getRoomList(int partner_idx) {
		
		return roomMapper.getRoomList(partner_idx);
	}

	

}

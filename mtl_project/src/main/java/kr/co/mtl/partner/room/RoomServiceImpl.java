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
	public void roomRegister(Map<String, Object> param) {
		
		roomMapper.roomRegister(param);
		
	}

	@Override
	public List<Map<String, String>> getRoomList() {
		// TODO Auto-generated method stub
		return null;
	}

}

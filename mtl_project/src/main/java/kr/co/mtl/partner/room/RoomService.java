package kr.co.mtl.partner.room;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface RoomService {
	
	void roomRegister(Map<String,Object> param, List<String> option,List<MultipartFile> images) throws IOException;	    //객실 등록
	Room getRoomDetail(int room_idx);                                                                                   //객실 상세
	void roomUpdate(Map<String,Object> param, List<String> option,List<MultipartFile> images) throws IOException;
	void roomDelete(int roomId);
	List<Map<String,Object>> getRoomList(int partner_idx);

}

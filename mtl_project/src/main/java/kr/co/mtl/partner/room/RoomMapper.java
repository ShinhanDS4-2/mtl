package kr.co.mtl.partner.room;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface RoomMapper {
	
	void roomRegister(Map<String,Object>param);
	int getIdx();
	void roomFacilitiesRegister(@Param("room_idx") int room_idx,@Param("option") String option);
	void roomUpdate(Map<String,Object> param);
	int roomDelete(int roomId);
	List<Map<String,Object>> getRoomList(int partner_idx);
}

package kr.co.mtl.partner.room;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RoomMapper {
	
	void roomRegister(Map<String,Object>param);

}

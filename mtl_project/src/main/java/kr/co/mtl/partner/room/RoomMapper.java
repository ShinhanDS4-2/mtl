package kr.co.mtl.partner.room;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface RoomMapper {
	
	void roomRegister(Map<String,Object>param);                                                             //객실등록
 	int getIdx();                                                                                           //idx 가져오기
	void roomFacilitiesRegister(@Param("room_idx") int room_idx,@Param("option") String option);            //시설 정보 등록
	void saveImageInfo(@Param("room_idx") int room_idx,@Param("type") String type,@Param("url") String url,@Param("thumbnail_yn") String thumbnail_yn,@Param("filename") String filename); //이미지 등록
	
	Map<String,Object> getRoomDetail(int room_idx);                                                         //객실 상세
	List<Map<String,Object>> getRoomFacility(int room_idx);                                                       //객실 시설 옵션
	List<Map<String,Object>> getImageUrl(int room_idx);
	
	void roomUpdate(Map<String,Object> param);                                                              //객실 업데이트
	void roomFacilitiesDelete(@Param("room_idx") int room_idx);                                             //객실 시설 삭제
	List<Map<String,String>> getImagesByRoomIdx(@Param("room_idx") int room_idx);                           //이미지 url 가져오기                                   
	void deleteImage(@Param("room_idx")int room_idx);
	
	int roomDelete(int room_idx);                                                                           //객실 삭제
	
	List<Map<String,Object>> getRoomList(int partner_idx);                                                  //객실 리스트 전체 조회
	
	
	
	
}

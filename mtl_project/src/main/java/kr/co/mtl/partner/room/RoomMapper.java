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
	
	Room getRoomDetail(int room_idx);                                                                       //객실 상세
	
	void roomUpdate(Map<String,Object> param);                                                              //객실 업데이트
	void roomFacilitiesUpdate(@Param("room_idx") int room_idx, @Param("option") String option);                                                                    //객실 시설 업데이트
	void updateImageInfo(@Param("room_idx") int room_idx,@Param("type") String type,@Param("url") String url,@Param("thumbnail_yn") String thumbnail_yn,@Param("filename") String filename);     //객실 이미지 업데이트
	
	int roomDelete(int roomId);
	
	List<Map<String,Object>> getRoomList(int partner_idx);                                                  //객실 리스트 전체 조회
	
	
	
	
}

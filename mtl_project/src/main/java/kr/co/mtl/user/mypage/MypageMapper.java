package kr.co.mtl.user.mypage;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MypageMapper {
	
/* [사용자] 마이페이지 예약내역 조회 */
	int getReservationHistoryListCount(Map<String, Object> param);  // 마이페이지 예약내역 리스트 총 개수
	List<Map<String, Object>> getReservationHistoryList(Map<String, Object> param);  // 마이페이지 예약내역 리스트 조회
	Map<String, Object> getReservImg(Map<String, Object> param);  // 예약내역 리스트에 띄울 숙소 사진 1장 조회
	Object getReservRoomtype(Map<String, Object> param);  // 예약내역 상세정보에 객실타입정보만 추출하기 위함
	
	Map<String, Object> getReservationHistoryDetail(Map<String, Object> param);  // 예약내역 상세정보


	
}

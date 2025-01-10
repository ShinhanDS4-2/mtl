package kr.co.mtl.notice;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface NoticeMapper {

	// 이용안내 등록
	int insertNotice(Map<String, Object> param);
	
	// 이용안내 수정
	int updateNotice(Map<String, Object> param);
	
	// 이용안내 삭제
	int deleteNotice(Map<String, Object> param);

	// 이용안내 리스트
	List<Map<String, Object>> getNoticeList(Map<String, Object> param);
	
	//검색
	List<Map<String, Object>> searchNotices(Map<String, Object> param);
	
	//사용자
	List<Map<String, Object>> selectUserNotices(Map<String, Object> param);
    int selectUserNoticeCount();
    
    //파트너
    List<Map<String, Object>> selectPartnerNotices(Map<String, Object> param);
    int selectPartnerNoticeCount();

	Map<String, Object> findByIdx(Integer notice_idx);

}

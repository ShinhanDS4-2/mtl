package kr.co.mtl.notice;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
@Mapper
public interface NoticeMapper {

    // Notice 목록 가져오기
    List<Notice> selectNoticesWithPaging(@Param("limit") int limit, @Param("offset") int offset);

    // 전체 Notice 개수 가져오기
    int selectTotalNoticeCount();

    // 이용안내 등록
    void insertNotice(Map<String, Object> param);

    // 이용안내 수정
    void updateNotice(Map<String, Object> param);

    // 이용안내 삭제
    void deleteNotice(Map<String, Object> param);

    // 이용안내 리스트 가져오기
    Map<String, Object> getNoticeList(Map<String, Object> param);
}

package kr.co.mtl.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeMapper {

    // 페이지 처리된 Notice 목록 조회
    List<Notice> selectNoticesWithPaging(int limit, int offset);

    // 전체 Notice 개수 조회
    int selectTotalNoticeCount();
}
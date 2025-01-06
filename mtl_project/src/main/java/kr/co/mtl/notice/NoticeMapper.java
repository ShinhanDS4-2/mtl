package kr.co.mtl.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeMapper {

    List<Notice> selectAllNotices();

    Notice selectNoticeById(int idx);
}
 
package kr.co.mtl.notice;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class NoticeService {

    private final NoticeMapper noticeMapper;

    public NoticeService(NoticeMapper noticeMapper) {
        this.noticeMapper = noticeMapper;
    }

    // Notice 목록을 페이지 처리해서 가져오기
    public List<Notice> getNoticesWithPaging(int limit, int offset) {
        return noticeMapper.selectNoticesWithPaging(limit, offset);
    }

    // 전체 Notice 개수 가져오기
    public int getTotalNoticeCount() {
        return noticeMapper.selectTotalNoticeCount();
    }
}
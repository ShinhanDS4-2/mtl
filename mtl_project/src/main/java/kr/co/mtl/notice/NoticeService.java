package kr.co.mtl.notice;

import java.util.List;

import org.springframework.stereotype.Service;
 
@Service
public class NoticeService {

    private final NoticeMapper noticeMapper;

    public NoticeService(NoticeMapper noticeMapper) {
        this.noticeMapper = noticeMapper;
    }

    // 공지사항 목록 조회
    public List<Notice> getAllNotices() {
        return noticeMapper.selectAllNotices();
    }

    // 공지사항 상세 조회
    public Notice getNoticeById(int idx) {
        return noticeMapper.selectNoticeById(idx);
    }
}

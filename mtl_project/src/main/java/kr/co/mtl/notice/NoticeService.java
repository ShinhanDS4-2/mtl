package kr.co.mtl.notice;

import java.util.List;
import java.util.Map;

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

    // 이용안내 등록
    public Map<String, Object> insertNotice(Map<String, Object> param) {
        noticeMapper.insertNotice(param);
        return param;
    }

    // 이용안내 수정
    public Map<String, Object> updateNotice(Map<String, Object> param) {
        noticeMapper.updateNotice(param);
        return param;
    }

    // 이용안내 삭제
    public Map<String, Object> deleteNotice(Map<String, Object> param) {
        noticeMapper.deleteNotice(param);
        return param;
    }

    // 이용안내 리스트
    public Map<String, Object> getNoticeList(Map<String, Object> param) {
        return noticeMapper.getNoticeList(param);
    }
}

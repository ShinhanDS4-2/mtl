package kr.co.mtl.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeMapper noticeMapper;

	@Override
	public Map<String, Object> insertNotice(Map<String, Object> param) {
	    Map<String, Object> result = new HashMap<>();
	    try {
	        System.out.println("Service 레벨 파라미터: " + param); // 디버깅용 로그
	        if (noticeMapper.insertNotice(param) > 0) {
	            result.put("result", true);
	        } else {
	            result.put("result", false);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        throw new RuntimeException("공지사항 등록 중 오류 발생", e);
	    }
	    return result;
	}
	@Override
	 public Map<String, Object> getNoticeDetailByIdx(Integer notice_idx) {
		Map<String, Object> result = new HashMap<>();

		if (notice_idx == null || notice_idx <= 0) {
	        result.put("result", false);
	        result.put("message", "유효하지 않은 공지사항 ID입니다.");
	        return result;
	    }

        // 공지사항 데이터 조회
        Map<String, Object> notice = noticeMapper.findByIdx(notice_idx);

        if (notice != null) {
            result.put("result", true);
            result.put("data", notice);
        } else {
            result.put("result", false);
            result.put("message", "해당 제목의 공지사항이 존재하지 않습니다.");
        }
        return result;
    }
	
    @Override
    public Map<String, Object> updateNotice(Map<String, Object> param) {
        Map<String, Object> result = new HashMap<>();

        int rowsUpdated = noticeMapper.updateNotice(param);  // MyBatis 매퍼 호출
        
        if (rowsUpdated > 0) {
            result.put("result", true);
            result.put("message", "공지사항이 성공적으로 수정되었습니다.");
            result.put("updatedRows", rowsUpdated);  // 수정된 행의 개수 추가
        } else {
            result.put("result", false);
            result.put("message", "공지사항 수정에 실패했습니다.");
        }

        return result;
    }

	//삭제
	@Override
	public Map<String, Object> deleteNotice(Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		
		if (noticeMapper.deleteNotice(param) > 0) {
			result.put("result", true);
		} else {
			result.put("result", false);
		}
		
		return result;
	}
	//리스트
	@Override
	public Map<String, Object> getNoticeList(Map<String, Object> param) {
	    Map<String, Object> result = new HashMap<>();
	    try {
	        List<Map<String, Object>> list = noticeMapper.getNoticeList(param);
	        result.put("list", list);
	    } catch (Exception e) {
	        e.printStackTrace(); // 오류 메시지를 확인
	        throw new RuntimeException("공지사항 조회 중 오류 발생", e);
	    }
	    return result;
	}
	//검색
	@Override
    public Map<String, Object> searchNotices(Map<String, Object> param) {
        Map<String, Object> result = new HashMap<>();
        try {
            // Mapper 호출
            List<Map<String, Object>> list = noticeMapper.searchNotices(param);
            result.put("list", list);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("검색 중 오류 발생", e);
        }
        return result;
    }
	//사용자
	@Override
    public List<Map<String, Object>> getUserNotices(Map<String, Object> param) {
        return noticeMapper.selectUserNotices(param);
    }

    @Override
    public int getUserNoticeCount() {
        return noticeMapper.selectUserNoticeCount();
    }
    
    //파트너
    @Override
    public List<Map<String, Object>> getPartnerNotices(Map<String, Object> param) {
        return noticeMapper.selectPartnerNotices(param);
    }

    @Override
    public int getPartnerNoticeCount() {
        return noticeMapper.selectPartnerNoticeCount();
    }
    
}

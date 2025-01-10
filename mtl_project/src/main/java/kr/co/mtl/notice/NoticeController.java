package kr.co.mtl.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	

	@PostMapping("/regist")
	public Map<String,Object> registNotice(@RequestBody Map<String,Object>param, HttpServletRequest request) {
		
		Map<String, Object> result = new HashMap<>();

	        System.out.println("받은 파라미터: " + param);
			HttpSession session = request.getSession();
			
			result = noticeService.insertNotice(param);

		return result;
	}
	
	@PostMapping("/update")
	public Map<String, Object> updateNotice(@RequestBody Map<String, Object> param) {
	    Map<String, Object> result = new HashMap<>();

	    try {
	        // Service 호출
	        result = noticeService.updateNotice(param);
	    } catch (Exception e) {
	        result.put("success", false);
	        result.put("message", "공지사항 수정 중 오류가 발생했습니다.");
	        e.printStackTrace();
	    }

	    return result;
	}


	@PostMapping("/delete")
	public Map<String,Object> deleteNotice(@RequestBody Map<String,Object>param, HttpServletRequest request) {
	
		Map<String, Object> result = new HashMap<>();
		
		HttpSession session = request.getSession();

		result = noticeService.deleteNotice(param);

		return result;
	}
	
	@PostMapping("/list")
	public Map<String, Object> getNoticeList(@RequestBody Map<String, Object> param, HttpServletRequest request) {
	    Map<String, Object> result = new HashMap<>();
	    try {
	        result = noticeService.getNoticeList(param);
	    } catch (Exception e) {
	        e.printStackTrace();
	        result.put("error", "Internal Server Error");
	    }
	    return result;
	}
	
	@PostMapping("/search")
	public Map<String, Object> searchNotices(@RequestBody Map<String, Object> param) {
	    Map<String, Object> result = new HashMap<>();
	    try {
	        // NoticeService의 searchNotices 메서드 호출
	        result = noticeService.searchNotices(param);
	    } catch (Exception e) {
	        e.printStackTrace();
	        result.put("error", "검색 중 오류 발생");
	    }
	    return result;
	}
	@PostMapping("/detail")
	public Map<String, Object> getNoticeDetailByIdx(@RequestBody Map<String, Object> param) {
	    Map<String, Object> result = new HashMap<>();

	    // 요청으로 받은 공지사항 제목 확인
	    Integer notice_idx = (Integer) param.get("notice_idx");
	    if (notice_idx == null) {
	        result.put("result", false);
	        result.put("message", "공지사항 ID가 제공되지 않았습니다.");	
	        return result;
	    }

	    System.out.println("조회 요청 받은 공지사항 제목: " + notice_idx);

	    // 공지사항 서비스 호출
	    try {
	        result = noticeService.getNoticeDetailByIdx(notice_idx);
	    } catch (Exception e) {
	        result.put("result", false);
	        result.put("message", "공지사항 조회 중 오류가 발생했습니다.");
	        e.printStackTrace();
	    }

	    return result;
	}

	// 사용자용 공지사항 조회
    @PostMapping("/user/list")
    public Map<String, Object> getUserNotices(@RequestBody Map<String, Object> param) {
        Map<String, Object> result = new HashMap<>();

        try {
            List<Map<String, Object>> notices = noticeService.getUserNotices(param);
            int totalCnt = noticeService.getUserNoticeCount();

            result.put("list", notices);
            result.put("totalCnt", totalCnt);
            result.put("result", true);
        } catch (Exception e) {
            result.put("result", false);
            result.put("message", "공지사항 조회 중 오류가 발생했습니다.");
            e.printStackTrace();
        }

        return result;
    }
	// 판매자용 공지사항 조회
    @PostMapping("/partner/list")
    public Map<String, Object> getPartnerNotices(@RequestBody Map<String, Object> param) {
        Map<String, Object> result = new HashMap<>();

        try {
            List<Map<String, Object>> notices = noticeService.getPartnerNotices(param);
            int totalCnt = noticeService.getPartnerNoticeCount();

            result.put("list", notices);
            result.put("totalCnt", totalCnt);
            result.put("result", true);
        } catch (Exception e) {
            result.put("result", false);
            result.put("message", "공지사항 조회 중 오류가 발생했습니다.");
            e.printStackTrace();
        }

        return result;
    }
}

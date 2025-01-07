package kr.co.mtl.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    @GetMapping("/notice")
    public String getNoticeList(@RequestParam(defaultValue = "1") int page, Model model) {
        // 페이지 처리
        int limit = 10; // 한 페이지에 보여줄 게시글 수
        int offset = (page - 1) * limit; // offset 계산

        // 페이지 처리된 notice 목록 가져오기
        List<Notice> notices = noticeService.getNoticesWithPaging(limit, offset);
        int totalCount = noticeService.getTotalNoticeCount(); // 전체 게시글 수

        // 페이지 네이션 정보를 model에 추가
        model.addAttribute("notices", notices);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPage", page);
        model.addAttribute("limit", limit);

        return "/notice/noticeList"; // noticeList.jsp로 반환
    }
}

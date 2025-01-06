package kr.co.mtl.notice;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/notice")
public class NoticeController {

    private final NoticeService noticeService;

    public NoticeController(NoticeService noticeService) {
        this.noticeService = noticeService;
    }

    // 공지사항 목록 조회
    @GetMapping
    public String list(Model model) {
        model.addAttribute("notices", noticeService.getAllNotices());
        return "notice/list";  // notice/list.jsp
    }

    // 공지사항 상세 조회
    @GetMapping("/{idx}")
    public String detail(@PathVariable int idx, Model model) {
        Notice notice = noticeService.getNoticeById(idx);
        model.addAttribute("notice", notice);
        return "notice/detail";  // notice/detail.jsp
    }
}

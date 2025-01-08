package kr.co.mtl.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    @GetMapping("/notice")
    public String getNoticeList(@RequestParam(defaultValue = "1") int page, Model model) {
        int limit = 10; 
        int offset = (page - 1) * limit; 
        List<Notice> notices = noticeService.getNoticesWithPaging(limit, offset);
        int totalCount = noticeService.getTotalNoticeCount();
        int totalPages = (int) Math.ceil((double) totalCount / limit);

        model.addAttribute("notices", notices);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPage", page);
        model.addAttribute("limit", limit);
        model.addAttribute("totalPages", totalPages); // 전체 페이지

        return "/notice/noticeList";
    }


	@PostMapping("/notice/regist")
	public Map<String,Object> registPartnerNotice(@RequestBody Map<String,Object>param, HttpServletRequest request) {
		
		Map<String, Object> result = new HashMap<>();
		
		HttpSession session = request.getSession();
		
		result = noticeService.insertNotice(param);
		
		return result;
	}
	

	@PostMapping("/notice/update")
	public Map<String,Object> updatePartnerNotice(@RequestBody Map<String,Object>param, HttpServletRequest request) {
		
		Map<String, Object> result = new HashMap<>();
		
		HttpSession session = request.getSession();

		result = noticeService.updateNotice(param);
		
		return result;
	}
	
	
	@PostMapping("/notice/delete")
	public Map<String,Object> deletePartnerNotice(@RequestBody Map<String,Object>param, HttpServletRequest request) {
	
		Map<String, Object> result = new HashMap<>();
		
		HttpSession session = request.getSession();

		result = noticeService.deleteNotice(param);

		return result;
	}
	
}

package kr.co.mtl.user.review;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/api/user/review")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;

	/**
	 * 리뷰 등록
	 * @param param
	 * @return 
	 */
	@PostMapping("/regist")
	public Map<String, Object> registReview(@RequestParam Map<String, Object> param, HttpServletRequest request, 
											@RequestParam(required = false) List<MultipartFile> mfile) {
			
		HttpSession session = request.getSession();
		param.put("user_idx", session.getAttribute("login_user_idx"));
		
		Map<String, Object> result = reviewService.registReview(param, mfile);
		
		return result;
	}
	
	/**
	 * 숙소 리뷰 리스트
	 * @param param
	 * @return 
	 */
	@PostMapping("/list")
	public Map<String, Object> getReviewList(@RequestBody Map<String, Object> param) {
		
		Map<String, Object> result = reviewService.getReviewList(param);
		
		return result;
	}

	/**
	 * 내가 쓴 리뷰 리스트
	 * @param param
	 * @return 
	 */
	@PostMapping("/my/list")
	public Map<String, Object> getMyReviewList(@RequestBody Map<String, Object> param, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		param.put("user_idx", session.getAttribute("login_user_idx"));
		
		Map<String, Object> result = reviewService.getMyReviewList(param);
		
		return result;
	}
}

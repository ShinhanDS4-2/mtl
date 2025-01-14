package kr.co.mtl.user.question;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/user/question")
public class QuestionController {
	
	@Autowired
	private QuestionService questionService;
	
	/**
	 * 문의 등록
	 * @param param
	 * @param request
	 * @return
	 */

	@PostMapping("/regist1")
	public Map<String,Object> registQuestion1(@RequestBody Map<String,Object> param, HttpServletRequest request) {
		
		Map<String, Object> result = new HashMap<>();
		
		HttpSession session = request.getSession();
		param.put("user_idx", session.getAttribute("login_user_idx"));
		
		result = questionService.registQuestion1(param);

		return result;
	};
	
	/**
	 * 자주 묻는 질문 리스트
	 * @param param
	 * @param request
	 * @return
	 */
	@PostMapping("/list1")
	public Map<String, Object> getQuestionList1(@RequestBody Map<String, Object> param, HttpServletRequest request) {
	    HttpSession session = request.getSession();
	    Object userIdx = session.getAttribute("login_user_idx");

	    if (userIdx == null) {
	        throw new IllegalStateException("로그인된 사용자 정보가 없습니다.");
	    }

	    param.put("user_idx", userIdx);

	    Map<String, Object> result = new HashMap<>();
	    result.put("list", questionService.getQuestionList1(param)); // 리스트 데이터

	    return result;
	}

	
	@PostMapping("/detail1")
	public Map<String, Object> getQuestionDetail1(@RequestBody Map<String, Object> param) {
		  Map<String, Object> result = new HashMap<>();

		    // 요청으로 받은 공지사항 제목 확인
		    Integer idx = (Integer) param.get("idx");
		    if (idx == null) {
		        result.put("result", false);
		        result.put("message", "공지사항 ID가 제공되지 않았습니다.");	
		        return result;
		    }

		    System.out.println("조회 요청 받은 공지사항 제목: " + idx);

		    // 공지사항 서비스 호출
		    try {
		        result = questionService.getQuestionDetail1(idx);
		    } catch (Exception e) {
		        result.put("result", false);
		        result.put("message", "공지사항 조회 중 오류가 발생했습니다.");
		        e.printStackTrace();
		    }

	return result;
	}
	@PostMapping("/list")
	public Map<String, Object> getQuestionList(@RequestBody Map<String, Object> param, HttpServletRequest request) {
	    HttpSession session = request.getSession();
	    Object userIdx = session.getAttribute("login_user_idx");

	    if (userIdx == null) {
	        throw new IllegalStateException("로그인된 사용자 정보가 없습니다.");
	    }

	    param.put("user_idx", userIdx);

	    Map<String, Object> result = new HashMap<>();
	    result.put("list", questionService.getQuestionList(param)); // 리스트 데이터

	    return result;
	}
	@PostMapping("/regist")
	public Map<String,Object> registQuestion(@RequestBody Map<String,Object> param, HttpServletRequest request) {
		
		Map<String, Object> result = new HashMap<>();
		
		HttpSession session = request.getSession();
		param.put("user_idx", session.getAttribute("login_user_idx"));
		
		result = questionService.registQuestion(param);

		return result;
	};
	
	@PostMapping("/detail")
	public Map<String, Object> getQuestionDetail(@RequestBody Map<String, Object> param) {
		  Map<String, Object> result = new HashMap<>();

		    // 요청으로 받은 공지사항 제목 확인
		    Integer idx = (Integer) param.get("idx");
		    if (idx == null) {
		        result.put("result", false);
		        result.put("message", "공지사항 ID가 제공되지 않았습니다.");	
		        return result;
		    }

		    System.out.println("조회 요청 받은 공지사항 제목: " + idx);

		    // 공지사항 서비스 호출
		    try {
		        result = questionService.getQuestionDetail(idx);
		    } catch (Exception e) {
		        result.put("result", false);
		        result.put("message", "공지사항 조회 중 오류가 발생했습니다.");
		        e.printStackTrace();
		    }

	return result;
	}
	@PostMapping("/list2")
	public Map<String, Object> getPartnerQuestionList(@RequestBody Map<String, Object> param, HttpServletRequest request) {
	    HttpSession session = request.getSession();
	    Object userIdx = session.getAttribute("login_user_idx");

	    if (userIdx == null) {
	        throw new IllegalStateException("로그인된 사용자 정보가 없습니다.");
	    }

	    param.put("user_idx", userIdx);

	    Map<String, Object> result = new HashMap<>();
	    result.put("list", questionService.getPartnerQuestionList(param)); // 리스트 데이터

	    return result;
	}

	@PostMapping("/detail2")
	public Map<String, Object> getPartnerQuestionDetail(@RequestBody Map<String, Object> param) {
	    Map<String, Object> result = new HashMap<>();

	    Integer idx = (Integer) param.get("idx");
	    if (idx == null) {
	        result.put("result", false);
	        result.put("message", "문의 ID가 제공되지 않았습니다.");
	        return result;
	    }

	    System.out.println("숙소 문의 조회 요청: " + idx);

	    try {
	        result = questionService.getPartnerQuestionDetail(idx);
	    } catch (Exception e) {
	        result.put("result", false);
	        result.put("message", "숙소 문의 조회 중 오류가 발생했습니다.");
	        e.printStackTrace();
	    }

	    return result;
	}

}
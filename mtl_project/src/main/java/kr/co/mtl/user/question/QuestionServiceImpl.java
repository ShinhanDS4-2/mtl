package kr.co.mtl.user.question;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class QuestionServiceImpl implements QuestionService{
	
	@Autowired
	private QuestionMapper questionMapper;
	
	/**
	 * 숙소 정보 업데이트
	 * @param param
	 * @param request
	 * @return
	 */
	@Override
	public Map<String, Object> registQuestion(Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		
		if(questionMapper.registQuestion(param) <= 0) {
			result.put("result", false);
			return result;
		}

		result.put("result", true);
		
		return result;
	}
	@Override
	public Map<String, Object> registQuestion1(Map<String, Object> param) {
	    Map<String, Object> result = new HashMap<>();
	    System.out.println("등록 요청 데이터: " + param); // 디버깅용 로그

	    if (questionMapper.registQuestion1(param) <= 0) {
	        result.put("result", false);
	        System.out.println("문의 등록 실패");
	        return result;
	    }

	    result.put("result", true);
	    System.out.println("문의 등록 성공");
	    return result;
	}
	@Override
	public Map<String, Object> getQuestionList1(Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		
		// 리뷰
		List<Map<String, Object>> questionList = questionMapper.getQuestionList1(param);
	
		result.put("list", questionList);
		result.put("total", questionMapper.getQuestionCnt(param));
		
		return result;
	}
	@Override
	public Map<String, Object> getQuestionDetail(Integer idx) {
	    Map<String, Object> result = new HashMap<>();
	    try {
	        Map<String, Object> question = questionMapper.getQuestionDetail(idx);
	        if (question == null) {
	            throw new RuntimeException("데이터를 찾을 수 없습니다: idx=" + idx);
	        }
	        result.put("question", question);
	    } catch (Exception e) {
	        System.err.println("getQuestionDetail 오류: " + e.getMessage());
	        result.put("error", e.getMessage());
	    }
	    return result;
	}


	@Override
	public Map<String, Object> getQuestionList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return null;
	};

}

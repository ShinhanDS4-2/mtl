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

	public Map<String, Object> getQuestionList(Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		
		// 리뷰
		List<Map<String, Object>> questionList = questionMapper.getQuestionList(param);
	
		result.put("list", questionList);
		result.put("total", questionMapper.getQuestionCnt(param));
		
		return result;
	};

//	@Override
//    public Map<String, Object> registQuestion(Map<String, Object> param) {
//        Map<String, Object> result = new HashMap<>();
//        if (questionMapper.registQuestion(param) <= 0) {
//            result.put("result", false);
//        } else {
//            result.put("result", true);
//        }
//        return result;
//    }
//
//    @Override
//    public Map<String, Object> getQuestionList(Map<String, Object> param) {
//        Map<String, Object> result = new HashMap<>();
//        List<Map<String, Object>> questions = questionMapper.getQuestionList(param);
//        result.put("list", questions);
//        result.put("total", questionMapper.getQuestionCnt(param));
//        return result;
//    }
//
//    @Override
//    public Map<String, Object> getQuestionDetail(Map<String, Object> param) {
//        Map<String, Object> result = new HashMap<>();
//        result.put("question", questionMapper.getQuestionDetail(param));
//        return result;
//    }
	
}

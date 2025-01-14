package kr.co.mtl.question;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.mtl.admin.question.AdminQuestionMapper;
@Service
public class AQuestionServiceImpl implements AQuestionService {
    @Autowired
    private AQuestionMapper questionMapper;

    @Override
    public Map<String, Object> searchQuestions(Map<String, Object> param) {
        Map<String, Object> result = new HashMap<>();
        result.put("list", questionMapper.selectQuestions(param));
        result.put("totalCnt", questionMapper.getTotal(param));
        return result;
    }

    @Override
    public Map<String, Object> getQuestionDetail(Integer idx) {
        Map<String, Object> result = new HashMap<>();
        result.put("question", questionMapper.getQuestionDetail(idx));
        return result;
    }

	@Override
	public Map<String, Object> updateQuestion(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return null;
	}
}

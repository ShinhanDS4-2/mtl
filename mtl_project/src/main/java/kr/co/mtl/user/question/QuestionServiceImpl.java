package kr.co.mtl.user.question;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service
@Transactional
public class QuestionServiceImpl implements QuestionService {

    @Autowired
    private QuestionMapper questionMapper;

    /**
     * 문의 등록
     */
    @Override
    public Map<String, Object> registQuestion(Map<String, Object> param) {
        Map<String, Object> result = new HashMap<>();
        
        int insertResult = questionMapper.registQuestion(param);
        if (insertResult <= 0) {
            result.put("result", false);
            result.put("message", "문의 등록에 실패했습니다.");
        } else {
            result.put("result", true);
            result.put("message", "문의가 등록되었습니다.");
        }

        return result;
    }

    /**
     * 문의 목록 조회
     */
    @Override
    public Map<String, Object> getQuestionList(Map<String, Object> param) {
        Map<String, Object> result = new HashMap<>();
        
        List<Map<String, Object>> questionList = questionMapper.getQuestionList(param);
        int totalCount = questionMapper.getQuestionCnt(param);

        result.put("list", questionList);
        result.put("totalCnt", totalCount);

        return result;
    }

    /**
     * 문의 상세 조회
     */
    @Override
    public Map<String, Object> getQuestionDetail(Map<String, Object> param) {
        Map<String, Object> result = new HashMap<>();
        
        Map<String, Object> questionDetail = questionMapper.getQuestionDetail(param);
        result.put("data", questionDetail);

        return result;
    }
}

package kr.co.mtl.question;

import java.util.Map;

public interface AQuestionService {
	
	Map<String,Object> searchQuestions(Map<String,Object> param);
	
	Map<String, Object> updateQuestion(Map<String, Object> param);

	Map<String, Object> getQuestionDetail(Integer idx);
}

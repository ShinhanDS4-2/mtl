package kr.co.mtl.admin.aquestion;

import java.util.Map;

public interface AdminQuestionService {
	
	Map<String,Object> searchQuestions(Map<String,Object> param);

	Map<String, Object> updateQuestions(Map<String, Object> param);
	
}

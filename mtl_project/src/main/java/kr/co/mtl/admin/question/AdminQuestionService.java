package kr.co.mtl.admin.question;

import java.util.Map;

public interface AdminQuestionService {
	
	Map<String,Object> searchQuestions(Map<String,Object> param);
	
}

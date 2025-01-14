package kr.co.mtl.admin.question;

import java.util.Map;

public interface AdminQuestionService {
	
	Map<String,Object> searchQuestions(Map<String,Object> param);
	
	Map<String,Object> getList(Map<String,Object> param);

	Map<String,Object> getDetail(Map<String,Object> param);
	
	Map<String,Object> answer(Map<String,Object> param);
}

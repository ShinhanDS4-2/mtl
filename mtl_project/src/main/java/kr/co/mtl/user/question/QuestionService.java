package kr.co.mtl.user.question;

import java.util.Map;

public interface QuestionService {
	
	// 문의 등록
	Map<String, Object> registQuestion(Map<String,Object> param);

	Map<String, Object> registQuestion1(Map<String,Object> param);
	Map<String, Object> getQuestionList(Map<String, Object> param);
	Map<String, Object> getQuestionList1(Map<String, Object> param);

	Map<String, Object> getQuestionDetail(Integer idx);

	

}

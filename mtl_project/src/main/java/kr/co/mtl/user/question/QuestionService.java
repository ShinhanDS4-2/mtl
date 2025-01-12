	package kr.co.mtl.user.question;
	
	import java.util.Map;
	
	public interface QuestionService {
		
		// 문의 등록
		Map<String, Object> registQuestion(Map<String,Object> param);
	
		Map<String, Object> getQuestionList(Map<String, Object> param);

		/**
		 * 문의 상세 조회
		 */
		Map<String, Object> getQuestionDetail(Map<String, Object> param);
	
	//	Map<String, Object> getQuestionDetail(Map<String, Object> param);
	
	}

package kr.co.mtl.user.question;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface QuestionMapper {
	
	// 문의 등록
	int registQuestion(Map<String,Object> param);

	
	public List<Map<String, Object>> getQuestionList(Map<String, Object> param);
		
	
	public int getQuestionCnt(Map<String, Object> param);
}

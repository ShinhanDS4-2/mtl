package kr.co.mtl.question;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Qualifier;

@Mapper
public interface AQuestionMapper {
	
	List<Map<String,Object>> selectQuestions(Map<String, Object> param);

	int getTotal(Map<String, Object> param);
	
	int updateQuestion(Map<String, Object> param);

	int getQuestionDetail(Integer idx);
	
}

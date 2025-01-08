package kr.co.mtl.admin.question;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface AdminQuestionMapper {
	
	
	List<Map<String,Object>> selectQuestions(Map<String, Object> param);

	int getTotal(Map<String, Object> param);
	
}

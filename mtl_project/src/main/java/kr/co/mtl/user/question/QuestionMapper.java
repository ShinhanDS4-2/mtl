package kr.co.mtl.user.question;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface QuestionMapper {
	
	// 문의 등록
	int registQuestion(Map<String,Object> param);

}

package kr.co.mtl.faq;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FaqMapper {

	// 자주 묻는 질문 리스트 관리자
	List<Map<String, Object>> getList(Map<String, Object> param);
	
	// 자주 묻는 질문 리스트 개수 관리자
	int getListCnt(Map<String, Object> param);
}

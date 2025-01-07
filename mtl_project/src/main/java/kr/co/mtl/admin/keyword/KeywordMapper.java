package kr.co.mtl.admin.keyword;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface KeywordMapper {

	// 키워드 중복 확인
	int checkKeywordDuplicate(Map<String, Object> param); 
	
	// 키워드 등록
	void insertKeyword(Map<String,String> param);

	// 키워드 삭제
	void deleteKeyword(Map<String,String> param);

	// 키워드 삭제 - 여행지
	void deleteKeywordLocation(Map<String,String> param);
	
	// 키워드 삭제 - 숙소
	void deleteKeywordPartner(Map<String,String> param);

	// 키워드 리스트
	List<Map<String,String>> selectAllKeywords(Map<String,String> param);
}

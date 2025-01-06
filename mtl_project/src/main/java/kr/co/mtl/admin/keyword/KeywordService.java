package kr.co.mtl.admin.keyword;

import java.util.Map;

public interface KeywordService {
	
	// 키워드 중복 확인
	int checkKeywordDuplicate(Map<String, Object> param);
	
	// 키워드 등록
	void registerKeyword(Map<String,String> param);

	// 키워드 삭제
	void deleteKeyword(Map<String,String> param);
	
	// 키워드 리스트
	Map<String, Object> getKeywordList(Map<String,String> param);
}

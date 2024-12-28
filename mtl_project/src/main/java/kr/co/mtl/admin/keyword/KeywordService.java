package kr.co.mtl.admin.keyword;

import java.util.List;
import java.util.Map;

public interface KeywordService {
	
	void registerKeyword(Map<String,String> param);
	List<Map<String,String>> getKeywordList();
}

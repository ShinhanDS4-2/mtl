package kr.co.mtl.common;

import java.util.Map;

public interface CommonService {

	// 코드 리스트
	Map<String, Object> getCodeList(Map<String, Object> param);

	// 키워드 리스트
	Map<String, Object> getKeywordList(Map<String, Object> param);

	// 시설 리스트
	Map<String, Object> getFacilitiesList(Map<String, Object> param);
}

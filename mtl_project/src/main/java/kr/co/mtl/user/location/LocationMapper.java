package kr.co.mtl.user.location;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LocationMapper {

	// 지역 별 여행지 리스트
	List<Map<String, Object>> getLocationList(Map<String, Object> param);
	
	// 지역 별 여행지 썸네일 사진
	Map<String, Object> getLocationThumbnail(Map<String, Object> param);
	
	// 지역 별 여행지 키워드 리스트
	List<Map<String, Object>> getLocationKeywordList(Map<String, Object> param);
}

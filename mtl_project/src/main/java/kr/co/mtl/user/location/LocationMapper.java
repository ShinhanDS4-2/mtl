package kr.co.mtl.user.location;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LocationMapper {
	
/* [사용자] 지역 별 여행지 리스트 조회 */
	int getLocationListCount(Map<String, Object> param);  // 지역 별 여행지 리스트 총 개수
	List<Map<String, Object>> getLocationList(Map<String, Object> param);  // 지역 별 여행지 리스트
	Map<String, Object> getLocationImage(Map<String, Object> param);  // 지역 별 여행지 썸네일 사진
	List<Map<String, Object>> getLocationKeyword(Map<String, Object> param);  // 지역 별 여행지 키워드 리스트
	
	
/* [사용자] 여행지(관광지/맛집) 상세페이지 조회 */
	List<Map<String, Object>> getLocationDetailImage(Map<String, Object> param);  // 여행지(관광지/맛집) 상세페이지 사진
	Map<String, Object> getLocationDetailDescription(Map<String, Object> param);  // 여행지(관광지/맛집) 상세페이지 정보
	List<Map<String, Object>> getLocationDetailKeyword(Map<String, Object> param);  // 여행지(관광지/맛집) 상세페이지 키워드

	
	
}

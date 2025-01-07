package kr.co.mtl.admin.location;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface AdminLocationMapper {

/* 등록, 수정, 삭제 */		
	// 여행지 기본정보 등록
	int registLocationInfo(Map<String, Object> param);
	
	// 여행지 기본정보 수정
	int updateLocationInfo(Map<String, Object> param);
	
	// 여행지 기본정보 삭제
	int deleteLocationInfo(Map<String, Object> param);
	
	
	// 여행지 이미지 등록
	int registLocationImg(Map<String, Object> param);
		
	// 여행지 이미지 삭제
	int deleteLocationImg(Map<String, Object> param);
	
	
	// 여행지 키워드 등록
	int registLocationKeyword(Map<String, Object> param);
	
	// 여행지 키워드 삭제
	int deleteLocationKeyword(Map<String, Object> param);
	
	
/* 조회 */	
	// 여행지 리스트 총 개수
	int getLocationListCount(Map<String,Object> param);
	
	// 여행지 리스트 조회
	List<Map<String, Object>> getLocationList(Map<String,Object> param);
	
	
	// 여행지 상세정보(기본정보) 조회
	Map<String, Object> getLocationDetail(Map<String, Object> param);
	
	// 여행지 상세정보(이미지) 조회
	List<Map<String, Object>> getLocationDetailImg(Map<String, Object> param);
	
	// 여행지 상세정보(키워드) 조회 
	List<Map<String, Object>> getLocationDetailKeyword(Map<String, Object> param);
	
}

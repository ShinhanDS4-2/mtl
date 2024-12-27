package kr.co.mtl.user.partner;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PartnerMapper {

	// 인기 숙소 리스트
	public List<Map<String, Object>> getBestPartnerList(Map<String, Object> param);
	
	// 인기 숙소 사진
	public Map<String, Object> getBestPartnerImage(Map<String, Object> param);
	
	// 숙소 검색 리스트
	public List<Map<String, Object>> getPartnerList(Map<String, Object> param);
	
	// 숙소 검색 리스트 개수
	public int getPartnerCnt(Map<String, Object> param);
	 
	// 숙소 사진 리스트
	public List<Map<String, Object>> getPartnerImageList(Map<String, Object> param);

	// 숙소 시설 리스트
	public List<Map<String, Object>> getPartnerFacilities(Map<String, Object> param);
	
}

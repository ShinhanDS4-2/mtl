package kr.co.mtl.partner.accomodation;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AccomodationMapper {
	
	// 숙소 정보 업데이트
	int updateAccomodationInfo(Map<String,Object> param);
	
	// 숙소 상세
	Map<String, Object> getDetail(Map<String, Object> param);
	
	// 숙소 시설 리스트
	List<Map<String, Object>> getFacilitiesList(Map<String, Object> param);

	// 숙소 이미지 리스트
	List<Map<String, Object>> getImageList(Map<String, Object> param);

}

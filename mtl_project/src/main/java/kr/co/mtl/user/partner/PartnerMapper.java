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
}

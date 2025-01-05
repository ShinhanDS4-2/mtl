package kr.co.mtl.partner.accomodation;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AccomodationMapper {
	
	// 숙소 정보 업데이트
	int updateAccomodationInfo(Map<String,Object> param);

	// 숙소 시설 등록
	int insertPartnerFacilities(Map<String,Object> param);

	// 숙소 시설 삭제
	int deletePartnerFacilities(Map<String,Object> param);
	
	// 숙소 이미지 등록
	int insertPartnerImage(Map<String,Object> param);
	
	// 숙소 이미지 삭제
	int deletePartnerImage(Map<String,Object> param);
	
	// 숙소 키워드 등록
	int insertPartnerKeyword(Map<String,Object> param);
	
	// 숙소 키워드 삭제
	int deletePartnerKeyword(Map<String,Object> param);
	
	// 숙소 상세
	Map<String, Object> getDetail(Map<String, Object> param);
	
	// 숙소 시설 리스트
	List<Map<String, Object>> getFacilitiesList(Map<String, Object> param);

	// 숙소 이미지 리스트
	List<Map<String, Object>> getImageList(Map<String, Object> param);

	// 숙소 키워드 리스트
	List<Map<String, Object>> getKeywordList(Map<String, Object> param);
	
	// 이용안내 등록
	int insertPartnerNotice(Map<String, Object> param);
	
	// 이용안내 수정
	int updatePartnerNotice(Map<String, Object> param);
	
	// 이용안내 삭제
	int deletePartnerNotice(Map<String, Object> param);

	// 이용안내 리스트
	List<Map<String, Object>> getPartnerNoticeList(Map<String, Object> param);
}

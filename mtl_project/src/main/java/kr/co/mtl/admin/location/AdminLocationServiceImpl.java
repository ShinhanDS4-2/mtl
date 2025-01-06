package kr.co.mtl.admin.location;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mtl.map.MapService;
import kr.co.mtl.s3.S3Service;

@Service
public class AdminLocationServiceImpl implements AdminLocationService{
	@Autowired
	private AdminLocationMapper adminLocationMapper;
	
	@Autowired
	private MapService mapService;  // 여행지 등록 시 위도, 경도 설정하기 위함
	
	@Autowired
	private S3Service s3Service;  // 이미지 등록 위함

	
	/**
	 * 여행지 등록
	 * @param (기본정보)area, type, name, address, description / (사진정보 images 키값으로 배열저장)url, thumbnail_yn, origin_filename / (키워드 정보 keywords 키값으로 배열저장)keyword_idx
	 * @return result(true/false)
	 */
	@Override
	public Map<String, Object> registLocation(Map<String, Object> param) {
	    Map<String, Object> result = new HashMap<>();

	// 여행지 기본정보 등록  param : #{area}, #{type}, #{name}, #{address}, #{description}
		int registInfo = adminLocationMapper.registLocationInfo(param);
		
		// registLocationInfo 실행 후, param에 'location_idx'가 추가되어 있음 (매퍼에서 데이터 삽입 후 자동생성된 기본키를 가져오도록 설정해줬기 때문)
		Integer location_idx = (Integer) param.get("location_idx");
		 
	    if (location_idx == null) {
	        result.put("result", false);
	        result.put("message", "여행지 기본정보 등록 실패");
	        return result;
	    }
	    
		
	// 사진 등록  param : #{location_idx}, #{url}, #{thumbnail_yn}, #{origin_filename}
		List<Map<String, Object>> imgList = (List<Map<String, Object>>) param.get("images");
		
		if (imgList != null && !imgList.isEmpty()) {
	        for (Map<String, Object> img : imgList) {
	            img.put("location_idx", location_idx);
	            adminLocationMapper.registLocationImg(img);
	        }
	    }
		
	// 키워드 등록  param : #{location_idx}, #{keyword_idx})
	    List<Integer> keywordList = (List<Integer>) param.get("keywords");
	    if (keywordList != null && !keywordList.isEmpty()) {
	        for (Integer keywordIdx : keywordList) {
	            Map<String, Object> keywordParam = new HashMap<>();
	            keywordParam.put("location_idx", location_idx);
	            keywordParam.put("keyword_idx", keywordIdx);
	            adminLocationMapper.registLocationKeyword(keywordParam);
	        }
	    }
	    
	    result.put("result", true);
	    result.put("message", "여행지 등록 성공");
	    return result;
	}

	/**
	 * 여행지 수정
	 * @param param
	 * @param request
	 * @return
	 */
	@Override
	public Map<String, Object> updateLocation(Map<String, Object> param) {

		// 여행지 기본정보 수정
		
		// 사진 삭제 후 재등록
		
		// 키워드 삭제 후 재등록
		
		return null;
	}
	
	
	/** 완료
	 * 여행지 삭제
	 * @param location_idx (여행지idx)
	 * @return result(true/false)
	 * result값이 t인경우 프론트에서 삭제가 완료되었습니다 알림창 띄우고, f인경우 ? 삭제가 불가? . .
	 */
	@Override
	public Map<String, Object> deleteLocation(Map<String, Object> param) {
		Map<String, Object> result = new HashMap<>();
		int deleteImg = adminLocationMapper.deleteLocationImg(param); // 여행지 이미지 삭제
		int deleteKeyword = adminLocationMapper.deleteLocationKeyword(param); // 여행지 키워드 삭제
		int deleteInfo = adminLocationMapper.deleteLocationInfo(param); // 여행지 기본정보 삭제  =>  location_idx로 이미지랑 키워드가 매핑되어있어서 위에서 먼저삭제해줘야함

		if(deleteImg > 0 && deleteKeyword > 0 && deleteInfo > 0) {  // 여행지 기본정보, 이미지, 키워드 모두 삭제되었으면
			result.put("result", true);
		} else {
			result.put("result", false);
		}

		return result;
	}
	
	
	
	/** 완료
	 * 여행지 리스트 조회
	 * @param X
	 * @return locationList
	 */
	@Override
	public Map<String, Object> getLocationList() {
		Map<String, Object> result = new HashMap<>();
		List<Map<String, Object>> list = adminLocationMapper.getLocationList(); // 여행지 리스트 조회(파라미터 없이 호출)
		
		result.put("locationList", list);
		return result;
	}
	
	
	/** 완료
	 * 여행지 상세정보 조회
	 * @param location_idx (여행지 리스트에서 상세정보 클릭했을 때, 해당 여행지의 idx를 받아와야 함 => location_idx)
	 * @return info, img, keyword
	 */
	@Override
	public Map<String, Object> getLocationDetail(Map<String, Object> param) {
		Map<String, Object> result = new HashMap<>();
		
		Map<String, Object> info = adminLocationMapper.getLocationDetail(param); // 여행지 상세정보(기본정보) 조회
		List<Map<String, Object>> img = adminLocationMapper.getLocationDetailImg(param); // 여행지 상세정보(이미지) 조회
		List<Map<String, Object>> keyword = adminLocationMapper.getLocationDetailKeyword(param); // 여행지 상세정보(키워드) 조회 
		
		result.put("info", info);  // 기본정보는 필수이므로 무조건 넣고
				
		// 서버에서 데이터가 없는 경우에 해당 데이터를 아예 포함하지 않도록 처리하는 방법
		if (!img.isEmpty()) {
			result.put("img", img);  // 이미지는 있을 때만 결과에 넣어줌
		};
		if (!keyword.isEmpty()) {
			result.put("keyword", keyword);  // 키워드도 있을 때만 결과에 넣어줌
		};

		return result;
	}
	
	
	

}

package kr.co.mtl.admin.location;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
	 * @param (기본정보)area, type, name, address, description / (사진정보 images 키값으로 배열저장)url, thumbnail_yn, origin_filename / (키워드 정보 keywordList 키값으로 배열저장)keyword_idx
	 * @return result(true/false)
	 */
	@Override
	public Map<String, Object> registLocation(Map<String,Object> param, List<MultipartFile> images) {
	    Map<String, Object> result = new HashMap<>();
	    try {
	    
	    // 여행지 기본정보 등록  param : #{area}, #{type}, #{name}, #{address}, #{description}
	    	int registInfo = adminLocationMapper.registLocationInfo(param);
	    	
	    	// registLocationInfo 실행 후, param에 'location_idx'가 추가되어 있음 (매퍼에서 데이터 삽입 후 자동생성된 기본키를 가져오도록 설정해줬기 때문)
	    	Integer location_idx = (Integer) param.get("location_idx");
	    	
	    	if (location_idx == null) {
	    		result.put("result", false);
	    		result.put("message", "여행지 기본정보 등록 실패");
	    		return result;
	    	}
	    	
	    	
	    // 사진 등록
	    	//  ㄴ images에 배열로 저장되어 있음.  매퍼로 넘겨줘야 하는 값 => #{location_idx}, #{url}, #{thumbnail_yn}, #{origin_filename})
	    	
	    	Map<String, Object> imageParam = new HashMap<>();
	    	imageParam.put("location_idx", param.get("location_idx"));  // imageParam에는 location_idx가 있음
	    	
	    	String thumbnailYN = "Y";  // 첫번째 이미지만 썸네일로 설정
	    	for(MultipartFile img : images) {
	    		// 파일 s3 업로드
	    		String url = "location/" + param.get("location_idx") + "/" + img.getOriginalFilename();
	    		String s3Url = s3Service.uploadFile(img, url);
	    		
	    		// db 업로드
	    		imageParam.put("origin_filename", img.getOriginalFilename());
	    		imageParam.put("url", s3Url);
	    		imageParam.put("thumbnail_yn", thumbnailYN);
	    		
	    		thumbnailYN = "N";
	    		
	    		adminLocationMapper.registLocationImg(imageParam);
	    	}
	    	
	    	
	    // 키워드 등록  
	    	//  ㄴ param에 keywordList라는 이름으로 배열로 저장되어 있음.  매퍼로 넘겨줘야 하는 값 => #{location_idx}, #{keyword_idx})
	    	String keywordString = String.valueOf(param.get("keywordList"));
	    	List<Integer> keywordList = Arrays.stream(keywordString.split(",")) 
	    			.map(Integer::parseInt)
	    			.collect(Collectors.toList());
	    	param.put("keywordList", keywordList);  // param에 location_idx도 있고, keywordList도 있음
	    	
	    	if (keywordList != null && !keywordList.isEmpty()) { 
	    		for (Integer keywordIdx : keywordList) {  // keywordList 배열 요소를 하나하나 반복문 돌림
	    			Map<String, Object> keywordParam = new HashMap<>();  // 키워드 등록 매퍼로 넘길 param값 저장할 변수 선언
	    			keywordParam.put("location_idx", location_idx);
	    			keywordParam.put("keyword_idx", keywordIdx);
	    			adminLocationMapper.registLocationKeyword(keywordParam);  // 키워드 등록 (param값으로 location_idx, keyword_idx 넘겨줌)
	    		}
	    	}
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", false);
			return result;
		}
		    result.put("result", true);
		    result.put("message", "여행지 등록 성공");
		    return result;
	}

	/**
	 * 여행지 수정
	 * @param (기본정보수정)location_idx, area, type, name, address, description / (이미지,키워드 삭제)location_idx / 
	 * 		(사진등록 images 키값으로 배열저장)url, thumbnail_yn, origin_filename / (키워드등록 keywords 키값으로 배열저장)keyword_idx
	 * @return result(true/false)
	 */
	@Override
	public Map<String, Object> updateLocation(Map<String, Object> param, List<MultipartFile> images) {
	    Map<String, Object> result = new HashMap<>();
		try {
		// 여행지 기본정보 수정 param : #{location_idx}, #{area}, #{type}, #{name}, #{address}, #{description}
			int updateInfo = adminLocationMapper.updateLocationInfo(param);
			
			
		// 사진 삭제 param : #{location_idx}
			int deleteImg = adminLocationMapper.deleteLocationImg(param);
			
		// 사진 등록 param : #{location_idx}, images: #{url}, #{thumbnail_yn}, #{origin_filename}
			Map<String, Object> imageParam = new HashMap<>();
			imageParam.put("location_idx", param.get("location_idx"));  // imageParam에는 location_idx가 있음
			
			String thumbnailYN = "Y";  // 첫번째 이미지만 썸네일로 설정
			for(MultipartFile img : images) {
				// 파일 s3 업로드
				String url = "location/" + param.get("location_idx") + "/" + img.getOriginalFilename();
				String s3Url = s3Service.uploadFile(img, url);
				
				// db 업로드
				imageParam.put("origin_filename", img.getOriginalFilename());
				imageParam.put("url", s3Url);
				imageParam.put("thumbnail_yn", thumbnailYN);
				
				thumbnailYN = "N";
				
				adminLocationMapper.registLocationImg(imageParam);
			}
			
		// 키워드 삭제 param : #{location_idx}
			int deleteKeyword = adminLocationMapper.deleteLocationKeyword(param);
			
		// 키워드 등록 param : #{location_idx}, #{keyword_idx})
	    	String keywordString = String.valueOf(param.get("keywordList"));
	    	List<Integer> keywordList = Arrays.stream(keywordString.split(",")) 
	    			.map(Integer::parseInt)
	    			.collect(Collectors.toList());
	    	param.put("keywordList", keywordList);  // param에 location_idx도 있고, keywordList도 있음
	    	
	    	if (keywordList != null && !keywordList.isEmpty()) { 
	    		for (Integer keywordIdx : keywordList) {  // keywordList 배열 요소를 하나하나 반복문 돌림
	    			Map<String, Object> keywordParam = new HashMap<>();  // 키워드 등록 매퍼로 넘길 param값 저장할 변수 선언
	    			keywordParam.put("location_idx", param.get("location_idx"));
	    			keywordParam.put("keyword_idx", keywordIdx);
	    			adminLocationMapper.registLocationKeyword(keywordParam);  // 키워드 등록 (param값으로 location_idx, keyword_idx 넘겨줌)
	    		}
	    	}
			
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", false);
			return result;
		}
		    result.put("result", true);
		    result.put("message", "여행지 수정 성공");
		    return result;
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
			result.put("img", img);  
		};
		if (!keyword.isEmpty()) {
			result.put("keyword", keyword); 
		};

		return result;
	}
	
	
	

}

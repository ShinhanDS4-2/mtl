package kr.co.mtl.partner.accomodation;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.mtl.map.MapService;
import kr.co.mtl.s3.S3Service;

@Service
@Transactional
public class AccomodationServiceImpl implements AccomodationService{
	
	@Autowired
	private AccomodationMapper accomodationMapper;
	
	@Autowired
	private MapService mapService;
	
	@Autowired
	private S3Service s3Service;
	
	/**
	 * 숙소 정보 업데이트
	 * @param param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@Override
	public Map<String, Object> updateAccomodationInfo(Map<String, Object> param, List<MultipartFile> mfile) {
		
		Map<String, Object> result = new HashMap<>();
		
		try {
			// param에 위도 경도 추가
			mapService.getGeoInfo(param);
	
			// 정보 업데이트
			accomodationMapper.updateAccomodationInfo(param);
			
			/**
			 * 키워드와 시설은 매핑테이블을 삭제 후 재등록
			 */
			
			// 키워드 리스트 
			String keywordString = String.valueOf(param.get("keywordList"));
			List<Integer> keywordList = Arrays.stream(keywordString.split(","))
	                .map(Integer::parseInt)
	                .collect(Collectors.toList());
			param.put("keywordIdxList", keywordList);
			
			accomodationMapper.deletePartnerKeyword(param);	// 삭제
			accomodationMapper.insertPartnerKeyword(param);	// 등록
			
			// 시설 리스트
			String facilitiesString = String.valueOf(param.get("facilitiesList"));
			List<Integer> facilitiesList = Arrays.stream(facilitiesString.split(","))
	                .map(Integer::parseInt)
	                .collect(Collectors.toList());
			param.put("facilitiesIdxList", facilitiesList);
			
			accomodationMapper.deletePartnerFacilities(param);	// 삭제
			accomodationMapper.insertPartnerFacilities(param);	// 등록
			
			// 이미지
			if (mfile.size() > 0) {
				
				// 기존 파일 삭제
				List<Map<String, Object>> preImageList = accomodationMapper.getImageList(param);
				if (preImageList.size() > 0) {
					for (Map<String, Object> image : preImageList) {
						s3Service.deleteFile((String) image.get("url"));
					}
					accomodationMapper.deletePartnerImage(param);
				}
				
				Map<String, Object> imageParam = new HashMap<>();
				imageParam.put("partner_idx", param.get("partner_idx"));
				
				String thumbnailYN = "Y";
				for(MultipartFile file : mfile) {
					// 파일 s3 업로드
					String url = "partner/" + param.get("partner_idx") + "/" + file.getOriginalFilename();
					String s3Url = s3Service.uploadFile(file, url);
					
					// db 업로드
					imageParam.put("origin_filename", file.getOriginalFilename());
					imageParam.put("url", s3Url);
					imageParam.put("thumbnail_yn", thumbnailYN);
					
					thumbnailYN = "N";
					
					accomodationMapper.insertPartnerImage(imageParam);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", false);
			
			return result;
		}
		
		result.put("result", true);
		
		return result;
	}
	
	/**
	 * 숙소 상세
	 * @param param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@Override
	public Map<String, Object> getDetail(Map<String, Object> param) throws Exception {
		
		Map<String, Object> result = new HashMap<>();
		
		Map<String, Object> info = accomodationMapper.getDetail(param);
		List<Map<String, Object>> facilitiesList = accomodationMapper.getFacilitiesList(param);
		List<Map<String, Object>> imageList = accomodationMapper.getImageList(param);
		List<Map<String, Object>> keywordList = accomodationMapper.getKeywordList(param);
		
		result.put("info", info);
		
		if (!facilitiesList.isEmpty()) {
			result.put("facilitiesList", facilitiesList);
		};
		
		if (!imageList.isEmpty()) {
			result.put("imageList", imageList);
		};

		if (!keywordList.isEmpty()) {
			result.put("keywordList", keywordList);
		};
		
		return result;
	}
	
	

}

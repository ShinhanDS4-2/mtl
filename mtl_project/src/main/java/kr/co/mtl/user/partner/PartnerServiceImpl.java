package kr.co.mtl.user.partner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PartnerServiceImpl implements PartnerService {

	@Autowired
	private PartnerMapper partnerMapper;

	/**
	 * 인기 숙소 리스트
	 * @param param
	 * @return 숙소 리스트
	 */
	public Map<String, Object> getBestPartnerList(Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		
		List<Map<String, Object>> list = partnerMapper.getBestPartnerList(param);
		
		for (Map<String, Object> data : list) {
			// 인기 숙소 사진 (썸네일만)
			Map<String, Object> imageData = partnerMapper.getBestPartnerImage(data);
			data.put("image", imageData);
		}
		
		result.put("list", list);

		return result;
	};
	
	
	/**
	 * 숙소 검색 리스트
	 * @param param
	 * @return 숙소 검색 리스트
	 */
	public Map<String, Object> getPartnerSearchList(Map<String, Object> param) {
		
		System.out.println(param);
		Map<String, Object> result = new HashMap<>();
		
		List<Map<String, Object>> list = partnerMapper.getPartnerList(param);
		
		for (Map<String, Object> data : list) {
			// 숙소 사진 리스트
			List<Map<String, Object>> imageList = partnerMapper.getPartnerImageList(data);
			data.put("imageList", imageList);
			
			// 숙소 시설 리스트
			List<Map<String, Object>> facilitiesList = partnerMapper.getPartnerFacilities(data);
			data.put("facilitiesList", facilitiesList);
		}
		
		result.put("list", list);
		result.put("totalCnt", partnerMapper.getPartnerCnt(param));

		return result;
	};
	
}

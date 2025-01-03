package kr.co.mtl.partner.accomodation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccomodationServiceImpl implements AccomodationService{
	
	@Autowired
	private AccomodationMapper accomodationMapper;

	/**
	 * 숙소 정보 업데이트
	 * @param param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@Override
	public Map<String, Object> updateAccomodationInfo(Map<String, Object> param) throws Exception {
		
		Map<String, Object> result = new HashMap<>();
		
		if (accomodationMapper.updateAccomodationInfo(param) > 0) {
			result.put("result", true);
		} else {
			result.put("result", false);
		};
		
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
		
		result.put("info", info);
		
		if (!facilitiesList.isEmpty()) {
			result.put("facilitiesList", facilitiesList);
		};
		
		if (!imageList.isEmpty()) {
			result.put("imageList", imageList);
		};
		
		return result;
	}
	
	

}

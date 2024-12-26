package kr.co.mtl.user.location;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mtl.vo.ResponseMap;

@Service
public class LocationServiceImpl implements LocationService {

	@Autowired
	private LocationMapper locationMapper;

	/**
	 * 지역 별 여행지 리스트
	 * @param param
	 * @return 여행지 리스트
	 */
	public Map<String, Object> getLocationList(Map<String, Object> param) {
		
		ResponseMap respMap = new ResponseMap();
		
		List<Map<String, Object>> list = locationMapper.getLocationList(param);
		for (Map<String, Object> data : list) {
			param.put("location_idx", data.get("location_idx"));
			
			Map<String, Object> imageData = locationMapper.getLocationThumbnail(param);
			data.put("image", imageData);
			
			List<Map<String, Object>> keywordList = locationMapper.getLocationKeywordList(param);
			data.put("keywordList", keywordList);
		}

		return respMap.getResponse();
	};
	
}

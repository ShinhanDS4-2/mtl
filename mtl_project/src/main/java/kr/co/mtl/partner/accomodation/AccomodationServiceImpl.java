package kr.co.mtl.partner.accomodation;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
	public Map<String, Object> updateAccomodationInfo(Map<String, Object> param, List<MultipartFile> mfile) throws Exception {
		
		Map<String, Object> result = new HashMap<>();
		
		String facilitiesString = String.valueOf(param.get("facilitiesList"));
		
		List<Integer> facilitiesList = Arrays.stream(facilitiesString.split(","))
                .map(Integer::parseInt)
                .collect(Collectors.toList());
		
//		if (accomodationMapper.updateAccomodationInfo(param) > 0) {
//			result.put("result", true);
//		} else {
//			result.put("result", false);
//		};
		
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

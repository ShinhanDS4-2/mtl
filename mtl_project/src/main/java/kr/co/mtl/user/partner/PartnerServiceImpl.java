package kr.co.mtl.user.partner;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mtl.vo.ResponseMap;

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
		
		ResponseMap respMap = new ResponseMap();
		
		List<Map<String, Object>> list = partnerMapper.getBestPartnerList(param);
		
		for (Map<String, Object> data : list) {
			// 인기 숙소 사진 (썸네일만)
			Map<String, Object> imageData = partnerMapper.getBestPartnerImage(data);
			data.put("image", imageData);
		}
		
		respMap.setBody("list", list);

		return respMap.getResponse();
	};
	
}

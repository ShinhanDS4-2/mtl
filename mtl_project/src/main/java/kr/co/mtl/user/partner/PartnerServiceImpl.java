package kr.co.mtl.user.partner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mtl.user.review.ReviewMapper;

@Service
public class PartnerServiceImpl implements PartnerService {

	@Autowired
	private PartnerMapper partnerMapper;
	
	@Autowired
	private ReviewMapper reviewMapper;

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
	
	/**
	 * 숙소 상세
	 * @param param
	 * @return 숙소 상세 정보
	 */
	public Map<String, Object> getPartnerDetail(Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		
		Map<String, Object> data = partnerMapper.getPartnerDetail(param);
		
		// 공통 정보
		data.put("imageList", partnerMapper.getPartnerImageList(param));				// 이미지
		data.put("commonFacilitiesList", partnerMapper.getPartnerFacilities(param));	// 공통시설
		data.put("roomFacilitiesList", partnerMapper.getPartnerRoomFacilities(param));	// 객실시설
		data.put("noticeList", partnerMapper.getPartnerNoticeList(param));				// 이용안내
		
		// 평점
		data.put("score", reviewMapper.getReviewScore(param));
		
		result.put("data", data);
		
		return result;
	};
	
	/**
	 * 객실 리스트
	 * @param param
	 * @return 객실 리스트
	 */
	public Map<String, Object> getRoomList(Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		
		// 객실 정보
		List<Map<String, Object>> list = partnerMapper.getRoomList(param);
		for (Map<String, Object> room : list) {
			room.put("imageList", partnerMapper.getRoomImage(room));
			room.put("facilitiesList", partnerMapper.getRoomFacilities(room));
		};
		
		result.put("list", list);
		
		return result;
	};
	
	/**
	 * 객실 상세
	 * @param param
	 * @return 객실 상세 정보
	 */
	public Map<String, Object> getRoomDetail(Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		
		Map<String, Object> data = partnerMapper.getRoomDetail(param);
		data.put("facilitiesList", partnerMapper.getRoomFacilities(param));
		data.put("imageList", partnerMapper.getRoomImage(param));
		
		result.put("data", data);
		
		return result;
	};
	
}

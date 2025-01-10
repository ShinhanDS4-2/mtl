package kr.co.mtl.partner.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.mtl.user.review.ReviewMapper;

@Service
@Transactional
public class PartnerReviewServiceImpl implements PartnerReviewService {

	@Autowired
	private PartnerReviewMapper partnerReviewMapper;
	
	@Autowired
	private ReviewMapper reviewMapper;

	/**
	 * 리뷰 리스트
	 * @param param
	 * @param request
	 * @return
	 */
	@Override
	public Map<String, Object> getReviewList(Map<String, Object> param) {

		Map<String, Object> result = new HashMap<>();
		
		List<Map<String, Object>> list = partnerReviewMapper.getReviewList(param);
		for (Map<String, Object> data : list) {
			data.put("imageList", partnerReviewMapper.getReviewImageList(data));
		}
		
		result.put("list", list);
		result.put("total", partnerReviewMapper.getReviewCnt(param));
		
		return result;
	}

	/**
	 * 답변 등록
	 * @param param
	 * @param request
	 * @return
	 */
	@Override
	public Map<String, Object> registReviewReply(Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		
		if (partnerReviewMapper.registReviewReply(param) <= 0) {
			result.put("result", false);
			return result;
		}
		
		result.put("result", true);
		
		return result;
	}
	
	/**
	 * 후기 상태 업데이트
	 * @param param
	 * @param request
	 * @return
	 */
	@Override
	public Map<String, Object> updateReviewReply(Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		
		if (partnerReviewMapper.updateReviewReply(param) <= 0) {
			result.put("result", false);
			return result;
		}
		
		// 숙소 평균 별점 업데이트 
		if (reviewMapper.updateScore(param) <= 0) {
			result.put("result", false);
			return result;
		}
		
		result.put("result", true);
		
		return result;
	}

}

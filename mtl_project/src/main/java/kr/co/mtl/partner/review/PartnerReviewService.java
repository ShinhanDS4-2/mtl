package kr.co.mtl.partner.review;

import java.util.Map;

public interface PartnerReviewService {

	// 리뷰 리스트
	Map<String, Object> getReviewList(Map<String,Object> param);

	// 답변 등록
	Map<String, Object> registReviewReply(Map<String,Object> param);

	// 후기 상태 업데이트
	Map<String, Object> updateReviewReply(Map<String,Object> param);
}


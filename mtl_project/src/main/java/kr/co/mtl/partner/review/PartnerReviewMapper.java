package kr.co.mtl.partner.review;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PartnerReviewMapper {

	// 리뷰 리스트
	public List<Map<String, Object>> getReviewList(Map<String, Object> param);

	// 리뷰 개수
	public int getReviewCnt(Map<String, Object> param);

	// 리뷰 이미지 리스트
	public List<Map<String, Object>> getReviewImageList(Map<String, Object> param);
	
	// 답변 달기
	public int registReviewReply(Map<String, Object> param);

	// 후기 상태 업데이트
	public int updateReviewReply(Map<String, Object> param);
}

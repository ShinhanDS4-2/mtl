package kr.co.mtl.user.review;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewMapper {

	// 리뷰 등록
	public int registReview(Map<String, Object> param);

	// 리뷰 이미지 등록
	public int registReviewImage(Map<String, Object> param);
	
	// 평점 업데이트
	public int updateScore(Map<String, Object> param);
	
	// 숙소 idx
	public int getPartnerIdx(Map<String, Object> param);
	
	// 숙소 별 리뷰 리스트
	public List<Map<String, Object>> getReviewList(Map<String, Object> param);

	// 숙소 별 리뷰 리스트
	public int getReviewCnt(Map<String, Object> param);
	
	// 숙소 별 리뷰 이미지 리스트
	public List<Map<String, Object>> getReviewImageList(Map<String, Object> param);
	
	// 숙소 전체 평균 평점
	public Map<String, Object> getReviewScore(Map<String, Object> param);
}

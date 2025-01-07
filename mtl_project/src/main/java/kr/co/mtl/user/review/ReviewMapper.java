package kr.co.mtl.user.review;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewMapper {

	// 리뷰 등록
	public int registReview(Map<String, Object> param);

	// 리뷰 이미지 등록
	public int registReviewImage(Map<String, Object> param);
	
}

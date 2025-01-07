package kr.co.mtl.user.review;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface ReviewService {

	// 리뷰 등록
	Map<String, Object> registReview(Map<String, Object> param, List<MultipartFile> mfile);

	// 숙소 리뷰 리스트
	Map<String, Object> getReviewList(Map<String, Object> param);

}


package kr.co.mtl.user.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.mtl.s3.S3Service;

@Service
@Transactional
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewMapper reviewMapper;

	@Autowired
	private S3Service s3Service;
	
	/**
	 * 리뷰 등록
	 * @param param
	 * @return 
	 */
	public Map<String, Object> registReview(Map<String, Object> param, List<MultipartFile> mfile) {
		
		Map<String, Object> result = new HashMap<>();
		
		// 리뷰 등록
		if (reviewMapper.registReview(param) <= 0) {
			result.put("result", false);
			return result;
		};
		
		// 이미지
		try {
			if (mfile.size() > 0) {
				Map<String, Object> imageParam = new HashMap<>();
				imageParam.put("review_idx", param.get("review_idx"));
				
				String thumbnailYN = "Y";
				for(MultipartFile file : mfile) {
					// 파일 s3 업로드
					String url = "review/" + param.get("review_idx") + "/" + file.getOriginalFilename();
					String s3Url = s3Service.uploadFile(file, url);
					
					// db 업로드
					imageParam.put("origin_filename", file.getOriginalFilename());
					imageParam.put("url", s3Url);
					imageParam.put("thumbnail_yn", thumbnailYN);
					
					thumbnailYN = "N";
					
					reviewMapper.registReviewImage(imageParam);
				}
			};
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", false);
			return result;
		}
		
		result.put("result", true);
		
		return result;
	};

}

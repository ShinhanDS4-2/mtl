package kr.co.mtl.user.partner;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.ListObjectsV2Request;
import software.amazon.awssdk.services.s3.model.ListObjectsV2Response;
import software.amazon.awssdk.services.s3.model.S3Object;

@RestController
@RequestMapping("/api/user/partner")
public class PartnerController {

	@Autowired
	private PartnerService partnerService;

	/**
	 * 인기 숙소 리스트
	 * @param param
	 * @return 숙소 리스트
	 */
	@PostMapping("/best/list")
	public Map<String, Object> getBestPartnerList(@RequestBody Map<String, Object> param) throws Exception {
		
		Map<String, Object> result = partnerService.getBestPartnerList(param);
		
		return result;
	}
	
	/**
	 * 숙소 검색
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/search/list")
	public Map<String, Object> getPartnerSearchList(@RequestBody Map<String, Object> param) throws Exception {

		Map<String, Object> result = partnerService.getPartnerSearchList(param);
		
		return result;
	}

	/**
	 * 숙소 상세
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/detail")
	public Map<String, Object> getPartnerDetail(@RequestBody Map<String, Object> param) throws Exception {
		
		Map<String, Object> result = partnerService.getPartnerDetail(param);
		
		return result;
	}
	
	/**
	 * 객실 리스트
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/room/list")
	public Map<String, Object> getRoomList(@RequestBody Map<String, Object> param) throws Exception {
		
		Map<String, Object> result = partnerService.getRoomList(param);
		
		return result;
	}
	
	/**
	 * 객실 상세
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/room/detail")
	public Map<String, Object> getRoomDetail(@RequestBody Map<String, Object> param) throws Exception {
		
		Map<String, Object> result = partnerService.getRoomDetail(param);
		
		return result;
	}
	
	@Autowired
	private PartnerMapper mapper;
	
	@Autowired
    private S3Client s3Client;

	@Value("${aws.s3.bucket}")
	private String BUCKET;
	
	@Value("${aws.s3.region}")
	private String region;
	
	@PostMapping("/img")
	public Map<String, Object> img() throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		List<Map<String, Object>> list = mapper.getInfo();
	
	    for (Map<String, Object> item : list) {
	        // partner_idx와 room_idx를 얻기
	        int partnerIdx = (int) item.get("partner_idx");
	        int roomIdx = (int) item.get("room_idx");

	        // S3 경로 구성
	        String prefix = String.format("partner/%d/room/%d/", partnerIdx, roomIdx);

	        // S3에서 해당 경로의 파일 목록 가져오기
	        ListObjectsV2Request request = ListObjectsV2Request.builder()
	            .bucket(BUCKET)
	            .prefix(prefix)
	            .build();

	        ListObjectsV2Response response = s3Client.listObjectsV2(request);

	        // 가져온 파일 목록에서 URL 생성
	        List<String> imageUrls = new ArrayList<>();
	        for (S3Object object : response.contents()) {
	        	String key = object.key();
	            String url = String.format("https://mtl-s3-bucket.s3.ap-northeast-2.amazonaws.com/%s", key);
	            
	            // 원본 파일명 추출
	            String originFilename = key.substring(key.lastIndexOf('/') + 1);
	            
	            // 데이터베이스에 업데이트
	            Map<String, Object> param = new HashMap<>();
	            param.put("room_idx", roomIdx);
	            param.put("url", url);
	            param.put("origin_filename", originFilename);
	            param.put("thumbnail_yn", imageUrls.isEmpty() ? "Y" : "N");

	            System.out.println(param);
	            mapper.updateImage(param);

	            imageUrls.add(url);
	        }
	    }
	    
		data.put("list", list);
		
		return data;
	}
}

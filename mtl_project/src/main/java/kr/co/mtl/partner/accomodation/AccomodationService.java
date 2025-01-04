package kr.co.mtl.partner.accomodation;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface AccomodationService {
	
	// 숙소 정보 업데이트
	Map<String, Object> updateAccomodationInfo(Map<String,Object> param, List<MultipartFile> mfile);

	// 숙소 상세
	Map<String, Object> getDetail(Map<String,Object> param) throws Exception;

}

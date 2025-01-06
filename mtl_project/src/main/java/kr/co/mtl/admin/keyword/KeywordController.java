package kr.co.mtl.admin.keyword;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/admin/location/keyword")
public class KeywordController {
	
	@Autowired
	private KeywordService keywordService;
	
	/**
	 * 키워드 중복확인
	 * @param keyword
	 * @return
	 */
	@PostMapping("/duplication")
	public int checkKeywordDuplicate(@RequestParam Map<String, Object> param) {
		return keywordService.checkKeywordDuplicate(param);
	}
	
	/**
	 * 키워드 등록
	 * @param param
	 * @return
	 */
	@PostMapping("/regist") 
	public void registerKeyword(@RequestParam Map<String,String> param) {
		
		keywordService.registerKeyword(param);
	}

	/**
	 * 키워드 삭제
	 * @param param
	 * @return
	 */
	@PostMapping("/delete") 
	public void deleteKeyword(@RequestParam Map<String,String> param) {
		
		keywordService.deleteKeyword(param);
	}
	
	//조회
	@PostMapping("/list")
	public Map<String, Object> getAllKeywords(@RequestParam Map<String,String> param) {
	    return keywordService.getKeywordList(param);
	}
	
}

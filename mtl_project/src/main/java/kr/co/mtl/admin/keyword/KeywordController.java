package kr.co.mtl.admin.keyword;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/locationlist")
public class KeywordController {
	
	@Autowired
	private KeywordService keywordService;
	
	@Autowired
	private KeywordMapper keywordMapper;
	
	//중복확인
	@PostMapping("/dupleKeyword")
	@ResponseBody
	public int checkKeywordDuplicate(String keyword) {
		int count=keywordMapper.countKeywordByKeyword(keyword);
		return count > 0 ? 1 : 0; //1이면 중복
	}
	
	//등록
	@PostMapping("/registerKeyword") 
	@ResponseBody
	public Map<String,String> registerKeyword(@RequestParam Map<String,String> param){
		
		keywordService.registerKeyword(param);
		return param;
	}
	
	//조회
	@GetMapping("/getAllKeywords")
	@ResponseBody
	public List<Map<String, String>> getAllKeywords() {
	    return keywordService.getKeywordList();
	}
	
}

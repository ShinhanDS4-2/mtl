package kr.co.mtl.admin.keyword;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class KeywordServiceImpl implements KeywordService{
	
	@Autowired
	private KeywordMapper keywordMapper;
	
	@Override
	public int checkKeywordDuplicate(Map<String, Object> param) {
		return keywordMapper.checkKeywordDuplicate(param);
	}
	
	@Override
	public void registerKeyword(Map<String,String>param) {
			
		keywordMapper.insertKeyword(param);
	}

	@Override
	public void deleteKeyword(Map<String,String>param) {
		
		String type = param.get("type");
		
		if ("PARTNER".equals(type)) {
			keywordMapper.deleteKeywordPartner(param);
		} else if ("LOCATION".equals(type)) { 
			keywordMapper.deleteKeywordLocation(param);
		}
		
		keywordMapper.deleteKeyword(param);
	}

	@Override
	public Map<String, Object> getKeywordList(Map<String,String> param) {
		
		Map<String, Object> result = new HashMap<>();
			
		result.put("list", keywordMapper.selectAllKeywords(param));
		return result;
	}

}

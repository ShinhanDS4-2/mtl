package kr.co.mtl.admin.keyword;

import java.util.List;
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
	public List<Map<String, String>> getKeywordList(Map<String,String> param) {
		System.out.println(param);
		return keywordMapper.selectAllKeywords(param);
	}

}

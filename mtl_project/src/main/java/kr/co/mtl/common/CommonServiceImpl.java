package kr.co.mtl.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommonServiceImpl implements CommonService {

	@Autowired
	private CommonMapper commonMapper;

	/**
	 * 코드 리스트
	 * @param param
	 * @return 코드 리스트
	 */
	public Map<String, Object> getCodeList(Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		
		List<Map<String, Object>> list = commonMapper.getCodeList(param);
		result.put("list", list);

		return result;
	}

	/**
	 * 키워드 리스트
	 * @param param
	 * @return 키워드 리스트
	 */
	public Map<String, Object> getKeywordList(Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		
		List<Map<String, Object>> list = commonMapper.getKeywordList(param);
		result.put("list", list);
		
		return result;
	}

	/**
	 * 시설 리스트
	 * @param param
	 * @return 시설 리스트
	 */
	public Map<String, Object> getFacilitiesList(Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		
		List<Map<String, Object>> list = commonMapper.getFacilitiesList(param);
		result.put("list", list);
		
		return result;
	}
	
}

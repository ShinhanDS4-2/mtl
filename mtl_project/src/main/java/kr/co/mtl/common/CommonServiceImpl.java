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
	
}

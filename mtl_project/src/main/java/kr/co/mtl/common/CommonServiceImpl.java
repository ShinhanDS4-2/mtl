package kr.co.mtl.common;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mtl.vo.ResponseMap;

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
		
		ResponseMap respMap = new ResponseMap();
		
		List<Map<String, Object>> list = commonMapper.getCodeList(param);
		respMap.setBody("list", list);

		return respMap.getResponse();
	}
	
}

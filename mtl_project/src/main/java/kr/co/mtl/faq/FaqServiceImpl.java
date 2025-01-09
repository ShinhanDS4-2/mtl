package kr.co.mtl.faq;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class FaqServiceImpl implements FaqService {

	@Autowired
	private FaqMapper faqMapper;
	
	/**
	 * 자주 묻는 질문 리스트 관리자
	 * @param param
	 * @return 
	 */
	public Map<String, Object> getList(Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		
		result.put("list", faqMapper.getList(param));
		result.put("totalCnt", faqMapper.getListCnt(param));
		
		return result;
	};

	/**
	 * 상태 업데이트
	 * @param param
	 * @return 
	 */
	public Map<String, Object> updateStatus(Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		
		result.put("result", faqMapper.updateStatus(param));
		
		return result;
	};

	/**
	 * 자주 묻는 질문 등록
	 * @param param
	 * @return 
	 */
	public Map<String, Object> registFaq(Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		
		result.put("result", faqMapper.registFaq(param));
		
		return result;
	};
	
	/**
	 * 자주 묻는 질문 리스트 사용자
	 * @param param
	 * @return 
	 */
	public Map<String, Object> getListWithUser(Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		
		result.put("list", faqMapper.getListWithUser(param));
		
		return result;
	};
}

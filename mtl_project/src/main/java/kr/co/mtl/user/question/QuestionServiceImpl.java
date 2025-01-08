package kr.co.mtl.user.question;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class QuestionServiceImpl implements QuestionService{
	
	@Autowired
	private QuestionMapper questionMapper;
	
	/**
	 * 숙소 정보 업데이트
	 * @param param
	 * @param request
	 * @return
	 */
	@Override
	public Map<String, Object> registQuestion(Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		
		if(questionMapper.registQuestion(param) <= 0) {
			result.put("result", false);
			return result;
		}

		result.put("result", true);
		
		return result;
	}
	

}

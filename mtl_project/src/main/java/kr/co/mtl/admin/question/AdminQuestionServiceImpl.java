package kr.co.mtl.admin.question;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminQuestionServiceImpl implements AdminQuestionService{

	@Autowired
	private AdminQuestionMapper adminQuestionMapper;
	
	@Override
	public Map<String, Object> searchQuestions(Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		
		System.out.println("검색 Service 실행 = "+param);
		
		result.put("list", adminQuestionMapper.selectQuestions(param));
		result.put("totalCnt", adminQuestionMapper.getTotal(param));
		
		return result;
	}
}

package kr.co.mtl.partner.question;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.mtl.user.review.ReviewMapper;

@Service
@Transactional
public class PartnerQuestionServiceImpl implements PartnerQuestionService {

	@Autowired
	private PartnerQuestionMapper partnerQuestionMapper;
	
	/**
	 * 문의 리스트
	 * @param param
	 * @param request
	 * @return
	 */
	@Override
	public Map<String, Object> getList(Map<String, Object> param) {

		Map<String, Object> result = new HashMap<>();
		
		result.put("list", partnerQuestionMapper.getList(param));
		result.put("totalCnt", partnerQuestionMapper.getListCnt(param));
		
		return result;
	}

	/**
	 * 답변 등록
	 * @param param
	 * @return
	 */
	@Override
	public Map<String, Object> answer(Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		
		if (partnerQuestionMapper.answer(param) <= 0) {
			result.put("result", false);
			return result;
		}
		
		result.put("result", true);
		
		return result;
	}
	
	/**
	 * 문의 상세
	 * @param param
	 * @return
	 */
	@Override
	public Map<String, Object> getDetail(Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		
		result.put("data", partnerQuestionMapper.getDetail(param));
		
		return result;
	}
	
}

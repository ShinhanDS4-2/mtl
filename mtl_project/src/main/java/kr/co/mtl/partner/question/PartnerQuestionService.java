package kr.co.mtl.partner.question;

import java.util.Map;

public interface PartnerQuestionService {

	// 문의 리스트
	Map<String, Object> getList(Map<String,Object> param);

	// 답변 등록
	Map<String, Object> answer(Map<String,Object> param);

	// 문의 상세
	Map<String, Object> getDetail(Map<String,Object> param);

}


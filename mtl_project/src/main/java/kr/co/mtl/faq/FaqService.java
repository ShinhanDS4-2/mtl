package kr.co.mtl.faq;

import java.util.Map;

public interface FaqService {

	// 자주 묻는 질문 리스트 관리자
	Map<String, Object> getList(Map<String, Object> param);

	// 상태 업데이트
	Map<String, Object> updateStatus(Map<String, Object> param);
	
	// 자주 묻는 질문 등록
	Map<String, Object> registFaq(Map<String, Object> param);

}


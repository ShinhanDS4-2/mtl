package kr.co.mtl.faq;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface FaqService {

	// 자주 묻는 질문 리스트 관리자
	Map<String, Object> getList(Map<String, Object> param);

}


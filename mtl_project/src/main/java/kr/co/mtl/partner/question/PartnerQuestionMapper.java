package kr.co.mtl.partner.question;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PartnerQuestionMapper {

	// 문의 리스트
	public List<Map<String, Object>> getList(Map<String, Object> param);

	// 리뷰 개수
	public int getListCnt(Map<String, Object> param);

	// 답변 달기
	public int answer(Map<String, Object> param);

	// 문의 상세
	public Map<String, Object> getDetail(Map<String, Object> param);
}

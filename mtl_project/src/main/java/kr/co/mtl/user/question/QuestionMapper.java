package kr.co.mtl.user.question;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
@Mapper
public interface QuestionMapper {

    // 문의 등록
    int registQuestion(Map<String, Object> param);

    // 문의 목록 조회
    List<Map<String, Object>> getQuestionList(Map<String, Object> param);

    // 문의 개수 조회
    int getQuestionCnt(Map<String, Object> param);

    // 문의 상세 조회
    Map<String, Object> getQuestionDetail(Map<String, Object> param); // 상세 조회 추가
}


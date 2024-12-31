package kr.co.mtl.admin.keyword;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface KeywordMapper {
	
	void insertKeyword(Map<String,String> param);     //키워드 등록
	int countKeywordByKeyword(@Param("keyword") String keyword);                             //중복확인
	List<Map<String,String>> selectAllKeywords();
}

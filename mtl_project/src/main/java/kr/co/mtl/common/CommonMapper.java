package kr.co.mtl.common;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommonMapper {

	// 코드 리스트
	public List<Map<String, Object>> getCodeList(Map<String, Object> param);

}

package kr.co.mtl.login;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginMapper {

	// 사용자 정보 가져오기
	public Map<String, Object> getUserInfo(Map<String, Object> param);
}

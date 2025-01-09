package kr.co.mtl.email;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmailMapper {

	// 사용자 유무 체크
	public int checkUser(Map<String, Object> param);
	
	// 판매자 유무 체크
	public int checkPartner(Map<String, Object> param);
	
	// 관리자 유무 체크
	public int checkAdmin(Map<String, Object> param);

	// 비밀번호 업데이트
	public int updateTempPassword(Map<String, Object> param);
	
	// 비밀번호 업데이트 - 판매자
	public int updateTempPasswordPartner(Map<String, Object> param);
	
	// 비밀번호 업데이트 - 관리자
	public int updateTempPasswordAdmin(Map<String, Object> param);
}

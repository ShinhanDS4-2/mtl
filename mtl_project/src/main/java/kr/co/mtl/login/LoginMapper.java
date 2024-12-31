package kr.co.mtl.login;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginMapper {

	// 사용자 정보 가져오기
	public Map<String, Object> getUserInfo(Map<String, Object> param);
	
	// 사용자 인증 정보 확인  //이거 추가
	public Map<String, Object> getUserCheck(Map<String, Object> param);
	
	// 사용자 정보 저장 (회원가입)
    public void insertUser(Map<String, Object> param);
    
    // 마이페이지 수정
    int updateUser(Map<String, Object> param);
    
    // 마이페이지 비밀번호 변경
    int updatePassword(Map<String, Object> param);
    
    // 마이페이지 현재 비밀번호 비교 확인
    Map<String, Object> getPasswordCheck(Map<String, Object> param);

}
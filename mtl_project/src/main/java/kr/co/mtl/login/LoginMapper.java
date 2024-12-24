//package kr.co.mtl.login;
//
//import java.util.Map;
//
//import org.apache.ibatis.annotations.Mapper;
//
//@Mapper
//public interface LoginMapper {
//
//	// 사용자 정보 가져오기
//	public Map<String, Object> getUserInfo(Map<String, Object> param);
//}


package kr.co.mtl.login;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginMapper {

    // 이메일 중복 체크
    int checkEmailExist(Map<String, Object> param);

    // 사용자 정보 삽입
    void insertUser(Map<String, Object> param);
    
    // 사용자 정보 가져오기
    Map<String, Object> getUserInfo(Map<String, Object> param);
}

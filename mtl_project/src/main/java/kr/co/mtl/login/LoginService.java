//package kr.co.mtl.login;
//
//import java.util.Map;
//
//public interface LoginService {
//
//	// 사용자 정보 가져오기
//	Map<String, Object> getUserInfo(Map<String, Object> param);
//}

package kr.co.mtl.login;

import java.util.Map;

public interface LoginService {

    // 사용자 정보 가져오기 (로그인 시 사용)
    Map<String, Object> getUserInfo(Map<String, Object> param);

    // 회원가입 처리
    Map<String, Object> registerUserInfo(Map<String, Object> param) throws Exception;
}

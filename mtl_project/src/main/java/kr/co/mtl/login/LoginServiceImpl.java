//package kr.co.mtl.login;
//
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import kr.co.mtl.vo.Code;
//import kr.co.mtl.vo.ResponseMap;
//
//@Service
//public class LoginServiceImpl implements LoginService {
//
//	@Autowired
//	private LoginMapper loginMapper;
//
//	/**
//	 * 사용자 정보 가져오기
//	 * @param param
//	 * @return 사용자 정보
//	 */
//	public Map<String, Object> getUserInfo(Map<String, Object> param) {
//		
//		// header, body 형태의 커스텀 응답 map 객체
//		ResponseMap respMap = new ResponseMap();
//	
//		/**
//		 * 1. Map 형태의 param을 매개변수로 넘긴다.
//		 * 2. 매핑된 sql에서 ${userIdx}를 받아 해당 idx를 가진 사용자의 정보를 가져와 자신을 호출한 곳으로 return 한다.
//		 * 3. 추가 로직이 필요한 경우 service 클래스인 이곳에 작성 
//		 */
//		Map<String, Object> data = loginMapper.getUserInfo(param);
//		
//		// 결과가 없을 경우 (해당 idx를 가진 데이터가 없을 경우) 에러 코드 리턴
//		if (data == null) {
//			return respMap.getResponse(Code.NOT_EXIST_DATA);
//		}
//		
//		// 결과가 있으면 응답 객체 body에 가져온 데이터를 넣고 리턴
//		respMap.setBody("data", data);
//		
//		return respMap.getResponse();
//	};
//}



package kr.co.mtl.login;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mtl.vo.Code;
import kr.co.mtl.vo.ResponseMap;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginMapper loginMapper;

    /**
     * 사용자 정보 가져오기
     * @param param
     * @return 사용자 정보
     */
    @Override
    public Map<String, Object> getUserInfo(Map<String, Object> param) {
        ResponseMap respMap = new ResponseMap();
        
        // 사용자 정보를 가져오기 위한 로직
        Map<String, Object> data = loginMapper.getUserInfo(param);
        
        if (data == null) {
            return respMap.getResponse(Code.NOT_EXIST_DATA);
        }

        respMap.setBody("data", data);
        return respMap.getResponse(Code.SUCCESS);
    }

    /**
     * 회원가입 처리
     * @param param
     * @return 회원가입 결과
     */
    @Override
    public Map<String, Object> registerUserInfo(Map<String, Object> param) throws Exception {
        ResponseMap respMap = new ResponseMap();

        // 이메일 중복 체크
        int count = loginMapper.checkEmailExist(param);
        if (count > 0) {
            return respMap.getResponse(Code.EMAIL_ALREADY_EXIST);  // 이메일 중복인 경우
        }

        // 비밀번호 MD5 암호화
        String password = (String) param.get("password");
        String encodedPassword = md5Encode(password);  // MD5로 비밀번호 암호화
        param.put("password", encodedPassword);  // 암호화된 비밀번호로 변경

        // 사용자 정보 삽입
        try {
            loginMapper.insertUser(param);
        } catch (Exception e) {
            return respMap.getResponse(Code.DB_INSERT_ERROR);  // DB 삽입 오류
        }

        return respMap.getResponse(Code.SUCCESS);  // 회원가입 성공
    }

    /**
     * MD5 방식으로 비밀번호 암호화
     * @param password 비밀번호
     * @return 암호화된 비밀번호
     */
    private String md5Encode(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(password.getBytes());
            byte[] bytes = md.digest();
            
            StringBuilder sb = new StringBuilder();
            for (byte b : bytes) {
                sb.append(String.format("%02x", b));  // 16진수로 변환
            }
            
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("MD5 algorithm not found", e);
        }
    }
}

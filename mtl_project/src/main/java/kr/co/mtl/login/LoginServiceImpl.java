package kr.co.mtl.login;

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
	public Map<String, Object> getUserInfo(Map<String, Object> param) {
		
		// header, body 형태의 커스텀 응답 map 객체
		ResponseMap respMap = new ResponseMap();

		/**
		 * 1. Map 형태의 param을 매개변수로 넘긴다.
		 * 2. 매핑된 sql에서 ${userIdx}를 받아 해당 idx를 가진 사용자의 정보를 가져와 자신을 호출한 곳으로 return 한다.
		 * 3. 추가 로직이 필요한 경우 service 클래스인 이곳에 작성 
		 */
		Map<String, Object> data = loginMapper.getUserInfo(param);
		
		// 결과가 없을 경우 (해당 idx를 가진 데이터가 없을 경우) 에러 코드 리턴
		if (data == null) {
			return respMap.getResponse(Code.NOT_EXIST_DATA);
		}
		
		// 결과가 있으면 응답 객체 body에 가져온 데이터를 넣고 리턴
		respMap.setBody("data", data);
		
		return respMap.getResponse();
	};
}

package kr.co.mtl.util;

import java.util.Map;

/**
 * 공통으로 쓰이는 함수
 * @author 문경미
 *
 */
public class CommonUtil {

	/**
	 * 필수 파라미터 Null 체크
	 * @param param
	 * @param key
	 * @throws Exception
	 */
	public static void checkIsNull(Map<String, Object> param, String key) throws Exception {
		if (!param.containsKey(key)) {
			throw new Exception(key + " IS NULL");
		}

		Object value = param.get(key);
		
		if (value == null || value.equals("")) {
			throw new Exception("PARAMETER " +  key + " ======> VALUE IS NULL");
		}
	}
	
	/**
	 * 랜덤 문자열 생성
	 * @param len
	 * @return 랜덤 문자열
	 * @throws Exception
	 */
	public static String makeRandStr(int len) throws Exception {
		if (len > 0) {
			StringBuffer sb = new StringBuffer(len);
			
			for (int i=0; i<len; i++) {
				int type = (int) (Math.random() * 3);
				
				double random = Math.random();
				
				switch (type) {
				case 0:
					sb.append((int) (random * 9 + 1));
					break;
				case 1:
					sb.append((char) (random * 26 + 'A'));
					break;
				default: 
					sb.append((char) (random * 26 + 'a'));
					break;
				}
			}
			
			return sb.toString();
		} else {
			return "";
		}
	}
}

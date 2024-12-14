package kr.co.mtl.util;

import java.util.Map;

public class CommonUtil {

	/**
	 * Null 체크 (Map)
	 * @param param
	 * @return
	 */
	public static boolean checkIsNull(Map<String, Object> param) {
		if (param == null || param.isEmpty()) {
			return true;
		}
		
		return false;
	}
	
	/**
	 * Null 체크 (Map객체 내 key)
	 * @param param
	 * @param key
	 * @return
	 */
	public static boolean checkIsNull(Map<String, Object> param, String key) {
		if (param == null || key == null || (param.get(key) == null) || param.get(key).equals("")) {
			return true;
		}

		return false;
	}
	
	/**
	 * 랜덤 문자열 생성
	 * @param len
	 * @return
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

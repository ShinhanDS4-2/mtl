package kr.co.mtl.vo;

import java.util.HashMap;
import java.util.Map;

public class ResponseMap {

	// 공통 결과 Header
	protected Map<String, Object> header;
	
	 // 공통 결과 Body
	protected Map<String, Object> body;
	
	public ResponseMap() {
		this.header = new HashMap<String, Object>();
		this.body = new HashMap<String, Object>();
	}

	public Map<String, Object> getBody() {
		return body;
	}

	public void setBody(Map<String, Object> data) {
		this.body.putAll(data);
	}

	public void setBody(String key, Object data) {
		this.body.put(key, data);
	}
	
	/**
	 * 성공 응답
	 * @return responseMap
	 */
	public Map<String, Object> getResponse() {
		return getResponse(null);
	}
	
	/**
	 * 성공 응답
	 * @param code
	 * @return map
	 */
	public Map<String, Object> getResponse(Code code) {
		Map<String, Object> result = new HashMap<>();
		
		// 기본 성공 코드
		header.put("code", Code.OK.code);
		header.put("msg", Code.OK.msg);
		
		// 커스텀 코드
		if (code == null) {
			body.put("code", Code.OK.code);
			body.put("msg", Code.OK.msg);
		} else {
			body.put("code", code.code);
			body.put("msg", code.msg);
		}
		
		result.put("header", header);
		result.put("body", body);
		
		return result;
	}
	
	/**
	 * 실패 응답
	 * @return
	 */
	public Map<String, Object> getErrResponse() {
		return getErrResponse(null);
	}
	
	/**
	 * 실패 응답 
	 * @param code
	 * @return
	 */
	public Map<String, Object> getErrResponse(Code code) {
		Map<String, Object> result = new HashMap<>();
		
		// 기본 에러 코드
		header.put("code", Code.ERROR.code);
		header.put("msg", Code.ERROR.msg);
		
		// 커스텀 코드
		if (code == null) {
			body.put("code", Code.ERROR.code);
			body.put("msg", Code.ERROR.msg);
		} else {
			body.put("code", code.code);
			body.put("msg", code.msg);
		}
		
		result.put("header", header);
		result.put("body", body);
		
		return result;
	}
}

package kr.co.mtl.vo;

public enum Code {
	// 정상
	OK(200, "code.ok"),
	
	// 데이터 없음
	NOT_EXIST_DATA(404, "code.not.exist.data"),
	
	// 에러
	ERROR(500, "code.error"),
	ERROR_SQL(501, "code.error.sql"),
	
	
	
	;
	
	public final int code;
	public final String msg;
	
	Code(int code, String msg) {
		this.code = code;
		this.msg = msg;
	}
}

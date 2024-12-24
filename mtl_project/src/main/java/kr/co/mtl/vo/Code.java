//package kr.co.mtl.vo;
//
//public enum Code {
//	// 정상
//	OK(200, "code.ok"),
//	
//	// 데이터 없음
//	NOT_EXIST_DATA(404, "code.not.exist.data"),
//	
//	// 에러
//	ERROR(500, "code.error"),
//	ERROR_SQL(501, "code.error.sql"),
//	
//	
//	
//	;
//	
//	public final int code;
//	public final String msg;
//	
//	Code(int code, String msg) {
//		this.code = code;
//		this.msg = msg;
//	}
//}


package kr.co.mtl.vo;

public class Code {
    
    // 회원가입 처리 결과 코드
    public static final String SUCCESS = "SUCCESS";  // 성공
    public static final String EMAIL_ALREADY_EXIST = "EMAIL_ALREADY_EXIST";  // 이메일 중복
    public static final String DB_INSERT_ERROR = "DB_INSERT_ERROR";  // DB 삽입 오류
    public static final String NOT_EXIST_DATA = "NOT_EXIST_DATA";  // 데이터 없음
}
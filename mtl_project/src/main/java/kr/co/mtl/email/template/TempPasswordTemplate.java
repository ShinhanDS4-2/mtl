package kr.co.mtl.email.template;

public class TempPasswordTemplate extends BasicTemplate {
	
	private String name;
	private String email;
	private String tempPassword;
	
	public TempPasswordTemplate() {
		setTitle("[떠날지도] 임시 비밀번호가 생성되었습니다.");
	}
	
	public String getContent() {
		StringBuilder content = new StringBuilder();
		
	 	return content.toString();
	}
}

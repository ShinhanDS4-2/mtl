package kr.co.mtl.email.template;

import lombok.Data;

@Data
@SuppressWarnings("unused")
public class FindPasswordTemplate {

	private String name;
	private String email;
	private String password;
	private String content;
	
	public String getContent() {
		StringBuilder content = new StringBuilder();
		
		content.append("<html lang='ko'>");
			content.append("<body style='background-color:#fff; width:100%; height:100%;'>");
				content.append("<div style='width:800px; background: #fff; margin: 0 auto; padding-top: 50px;'>");
					content.append("<div style='flex-direction: column; align-items: center; width: 800px;'>");
						content.append("<div style='margin-top: 40px; font-size: 18px;'>");
							content.append("<div style='padding:60px; line-height:30px; border: 1px solid #adadad; border-radius: 25px;'>");
								content.append("<div style='margin-bottom: 1em;'>");
									content.append("<p style='margin-bottom: 0; line-height: 40px;'>");
										content.append("안녕하세요. <span style='font-weight: bold; color:#5143d9;'>" + name + "</span>님<br>");
										content.append("비밀번호 찾기 요청에 따라 임시 비밀번호를 발급해 드렸습니다.");
									content.append("</p>");
								content.append("</div>");
								content.append("<div style='width:680px; height:140px; background:#dcd9f7; display:flex; flex-direction:column; justify-content:center; line-height:30px; padding-left:20px; border-radius: 25px;'>");
									content.append("<p style='font-weight: bold;'>");
										content.append("로그인 이메일: " + email + "<br>");
										content.append("임시 비밀번호: " + password);
									content.append("</p>");
								content.append("</div>");
								content.append("<div style='margin-top: 30px; line-height: 30px;'>");
									content.append("<p style='line-height: 40px;'>");
										content.append("로그인 하신 후 새로운 비밀번호로 변경해 주시기 바랍니다.<br>");
										content.append("감사합니다.");
									content.append("</p>");
								content.append("</div>");
							content.append("</div>");
						content.append("</div>");
					content.append("</div>");
				content.append("</div>");
			content.append("</body>");
		content.append("</html>");
		
	 	return content.toString();
	}
}

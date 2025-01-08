package kr.co.mtl.email;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.mtl.email.template.EmailAuthTemplate;
import kr.co.mtl.email.template.FindPasswordTemplate;
import kr.co.mtl.util.CommonUtil;

@Service
@Transactional
public class EmailServiceImpl implements EmailService {

	@Autowired
	private EmailMapper emailMapper;
	
	@Autowired
	private MailService mailService;

	/**
	 * 비밀번호 찾기
	 * @param param
	 * @return 
	 */
	public Map<String, Object> findPassword(Map<String, Object> param) throws Exception {
		
		Map<String, Object> result = new HashMap<>();
		
		String tempPw = CommonUtil.makeRandStr(8);
		String encPw = CommonUtil.encryptMD5(tempPw);
		param.put("password", encPw);

		if ("USER".equals((String) param.get("target"))) {
			if (emailMapper.checkUser(param) > 0) {
				emailMapper.updateTempPassword(param);
			} else {
				result.put("result", false);
				return result;
			}
		} else if ("PARTNER".equals((String) param.get("target"))) {
			if (emailMapper.checkPartner(param) > 0) {
				emailMapper.updateTempPasswordPartner(param);
			} else {
				result.put("result", false);
				return result;
			}
		} else if ("ADMIN".equals((String) param.get("target"))) {
			if (emailMapper.checkAdmin(param) > 0) {
				emailMapper.updateTempPasswordAdmin(param);
			} else {
				result.put("result", false);
				return result;
			}
		}
		
		FindPasswordTemplate template = new FindPasswordTemplate();
		template.setEmail((String) param.get("email"));
		template.setName((String) param.get("name"));
		template.setPassword(tempPw);
		
		MailVO vo = new MailVO();
		vo.setTitle("[떠날지도] 비밀번호 찾기 안내");
		vo.setEmail((String) param.get("email"));
		vo.setContent(template.getContent());
		
		if(mailService.sendMail(vo)) {
			result.put("result", true);
		} else {
			throw new Exception();
		}
		
		return result;
	};
	
	/**
	 * 이메일 인증
	 * @param param
	 * @return 
	 */
	public Map<String, Object> emailAuth(Map<String, Object> param, HttpServletRequest request) throws Exception {
		
		Map<String, Object> result = new HashMap<>();
		
		String authCode = CommonUtil.makeRandStr(8);
		
		EmailAuthTemplate template = new EmailAuthTemplate();
		template.setEmail((String) param.get("email"));
		template.setAuthCode(authCode);
		
		MailVO vo = new MailVO();
		vo.setTitle("[떠날지도] 이메일 인증 안내");
		vo.setEmail((String) param.get("email"));
		vo.setContent(template.getContent());
		
		if(mailService.sendMail(vo)) {
			result.put("result", true);
		} else {
			throw new Exception();
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("auth_email", (String) param.get("email"));
		session.setAttribute("auth_code", authCode);
		
		return result;
	};
	
	/**
	 * 이메일 인증 확인
	 * @param param
	 * @return 
	 */
	public Map<String, Object> emailAuthCheck(Map<String, Object> param, HttpServletRequest request) throws Exception {
		
		Map<String, Object> result = new HashMap<>();
		
		HttpSession session = request.getSession();
		String sessionEmail = (String) session.getAttribute("auth_email"); 
		String sessionAuthCode = (String) session.getAttribute("auth_code"); 
		
		String inputEmail = (String) param.get("email");
		String inputAuthCode = (String) param.get("authcode");
		
		if (sessionEmail.equals(inputEmail) && sessionAuthCode.equals(inputAuthCode)) {
			result.put("result", true);
		} else {
			result.put("result", false);
		}
		
		session.removeAttribute("auth_email");
		session.removeAttribute("auth_code");
		
		return result;
	};

}

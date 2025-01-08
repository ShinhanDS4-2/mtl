package kr.co.mtl.email;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

}

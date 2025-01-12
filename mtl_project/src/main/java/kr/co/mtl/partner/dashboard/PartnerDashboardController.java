package kr.co.mtl.partner.dashboard;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/partner/dashboard")
public class PartnerDashboardController {

	@Autowired
	private PartnerDashboardService dashboardService;

	/**
	 * 대시보드
	 * @param param
	 * @return 
	 */
	@PostMapping("/info")
	public Map<String, Object> getDashboard(@RequestBody Map<String, Object> param, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		param.put("partner_idx", session.getAttribute("login_partner_idx"));
		
		Map<String, Object> result = dashboardService.getDashboard(param);
		
		return result;
	}
}

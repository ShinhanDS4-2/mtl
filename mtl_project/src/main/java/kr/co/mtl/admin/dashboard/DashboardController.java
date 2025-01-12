package kr.co.mtl.admin.dashboard;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/dashboard")
public class DashboardController {

	@Autowired
	private DashboardService dashboardService;

	/**
	 * 대시보드
	 * @param param
	 * @return 
	 */
	@PostMapping("/info")
	public Map<String, Object> getDashboard(@RequestBody Map<String, Object> param) throws Exception {
		
		Map<String, Object> result = dashboardService.getDashboard(param);
		
		return result;
	}
}

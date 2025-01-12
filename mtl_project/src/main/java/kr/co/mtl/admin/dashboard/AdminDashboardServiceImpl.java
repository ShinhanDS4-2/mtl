package kr.co.mtl.admin.dashboard;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AdminDashboardServiceImpl implements AdminDashboardService {

	@Autowired
	private AdminDashboardMapper dashboardMapper;

	/**
	 * 대시보드
	 * @param param
	 * @return 
	 */
	public Map<String, Object> getDashboard(Map<String, Object> param) throws Exception {
		
		Map<String, Object> result = new HashMap<>();
		
		result.put("user", dashboardMapper.getUser(param));
		result.put("partner", dashboardMapper.getPartner(param));
		result.put("question", dashboardMapper.getQeustion(param));
		result.put("reservation", dashboardMapper.getReservation(param));
		result.put("partnerArea", dashboardMapper.getPartnerWithArea(param));
		result.put("locationArea", dashboardMapper.getLocationWithArea(param));
		result.put("recentPartner", dashboardMapper.getResentPartnerList(param));
		
		return result;
	};

}

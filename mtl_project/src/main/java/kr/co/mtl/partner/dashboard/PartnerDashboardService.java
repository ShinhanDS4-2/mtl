package kr.co.mtl.partner.dashboard;

import java.util.Map;

public interface PartnerDashboardService {

	// 대시보드
	Map<String, Object> getDashboard(Map<String, Object> param) throws Exception;
}


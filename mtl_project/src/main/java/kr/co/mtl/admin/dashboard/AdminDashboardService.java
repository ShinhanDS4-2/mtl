package kr.co.mtl.admin.dashboard;

import java.util.Map;

public interface AdminDashboardService {

	// 대시보드
	Map<String, Object> getDashboard(Map<String, Object> param) throws Exception;
}


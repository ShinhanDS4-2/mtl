package kr.co.mtl.partner.dashboard;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class PartnerDashboardServiceImpl implements PartnerDashboardService {

	@Autowired
	private PartnerDashboardMapper dashboardMapper;

	/**
	 * 대시보드
	 * @param param
	 * @return 
	 */
	public Map<String, Object> getDashboard(Map<String, Object> param) throws Exception {
		
		Map<String, Object> result = new HashMap<>();
		
		result.put("room", dashboardMapper.getRoomReservation(param));
		result.put("payout", dashboardMapper.getPayout(param));
		result.put("notice", dashboardMapper.getNotice(param));
		result.put("score", dashboardMapper.getScore(param));
		result.put("review", dashboardMapper.getReview(param));
		result.put("no_review", dashboardMapper.getReviewNoReply(param));
		
		return result;
	};

}

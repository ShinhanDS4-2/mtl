package kr.co.mtl.notice;

import java.util.List;
import java.util.Map;


public interface NoticeService {


	
		Map<String, Object> insertNotice(Map<String,Object> param);


		Map<String, Object> updateNotice(Map<String,Object> param);
		

		Map<String, Object> deleteNotice(Map<String,Object> param);


		Map<String, Object> getNoticeList(Map<String,Object> param);
		
		Map<String, Object> searchNotices(Map<String, Object> param);

		List<Map<String, Object>> getUserNotices(Map<String, Object> param);
	    int getUserNoticeCount();

		List<Map<String, Object>> getPartnerNotices(Map<String, Object> param);
		int getPartnerNoticeCount();

		Map<String, Object> getNoticeDetailByIdx(Integer notice_idx);
}

package kr.co.mtl.partner.partnernotice;

import java.util.List;
import java.util.Map;

public interface PartnerNoticeService {
	
	void partnerNoticeRegister(Map<String,Object> param);
	void partnerNoticeUpdate(Map<String,Object>param);
	void partnerNoticeDelete(int idx);
	List<String> getPartnerNoticeContent();

}

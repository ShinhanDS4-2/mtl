package kr.co.mtl.admin.partnerlist;

import java.util.Map;

public interface AdminPartnerlistService {
	
	Map<String,Object> searchPartnerlist(Map<String,Object>param);
	Map<String,Object> partnerDetail(int idx);
	

}

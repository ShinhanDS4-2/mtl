package kr.co.mtl.admin.partnerlist;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminPartnerlistServiceImpl implements AdminPartnerlistService{

	@Autowired
	private AdminPartnerlistMapper adminPartnerlistMapper;
	
	@Override
	public Map<String, Object> searchPartnerlist(Map<String, Object> param) {
	
		
		Map<String,Object> result=new HashMap<>();
		
	    System.out.println("숙소 관리 ServiceImpl 실행 = "+param);
	    
		result.put("list", adminPartnerlistMapper.selectPartnerlist(param));
		result.put("totalCnt",adminPartnerlistMapper.getTotal(param));
		
		System.out.println("result 반환 성공!!"+ result);
		
		return result;
	}

	@Override
	public Map<String, Object> partnerDetail(Map<String,Object> param) {
		
		return adminPartnerlistMapper.getPartnerDetail(param);
	}

}

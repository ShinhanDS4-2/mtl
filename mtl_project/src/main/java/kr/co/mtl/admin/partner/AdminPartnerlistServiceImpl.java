package kr.co.mtl.admin.partner;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.xml.transform.Result;

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
	public Map<String, Object> partnerDetail(int idx) {
		
		Map<String,Object> result=new HashMap<>();
		
		result.put("list",adminPartnerlistMapper.getPartnerDetail(idx));
		result.put("images",adminPartnerlistMapper.getPartnerUrl(idx));
		System.out.println("반환한 result 값 : "+result);
		
		return result;
	}

}

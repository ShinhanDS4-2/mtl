package kr.co.mtl.admin.partner;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminPartnerlistMapper {
	
	List<Map<String,Object>> selectPartnerlist(Map<String,Object> param);
	int getTotal(Map<String,Object>param);
	
	List<Map<String,Object>> getPartnerDetail(int idx);
	List<String> getPartnerUrl(int idx);
}

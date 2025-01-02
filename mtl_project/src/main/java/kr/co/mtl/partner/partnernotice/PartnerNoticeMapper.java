package kr.co.mtl.partner.partnernotice;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PartnerNoticeMapper {
	
	void registerPartnerNotice(Map<String,Object> param);
	void updatePartnerNotice(Map<String,Object>param);
	int deletePartnerNotice(int idx);
	List<String> getPartnerNoticeContent();
}

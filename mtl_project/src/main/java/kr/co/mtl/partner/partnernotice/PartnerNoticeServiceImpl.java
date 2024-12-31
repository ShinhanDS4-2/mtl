package kr.co.mtl.partner.partnernotice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PartnerNoticeServiceImpl implements PartnerNoticeService{

	@Autowired
	private PartnerNoticeMapper partnerNoticeMapper;

	@Override
	public void partnerNoticeRegister(Map<String, Object> param) {
		partnerNoticeMapper.registerPartnerNotice(param);
		
	}

	@Override
	public void partnerNoticeUpdate(Map<String, Object> param) {
		partnerNoticeMapper.updatePartnerNotice(param);
		
	}

	@Override
	public void partnerNoticeDelete(int idx) {
		partnerNoticeMapper.deletePartnerNotice(idx);
		
	}

	@Override
	public List<String> getPartnerNoticeContent() {
		
		return partnerNoticeMapper.getPartnerNoticeContent();
	}


}

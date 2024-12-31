package kr.co.mtl.partner.accomodation;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccomodationServiceImpl implements AccomodationService{
	
	@Autowired
	private AccomodationMapper accomodationMapper;

	@Override
	public void accomodationRegister(Map<String, Object> param) {
		
		accomodationMapper.registerAccomodation(param);
		
	}
	
	

}

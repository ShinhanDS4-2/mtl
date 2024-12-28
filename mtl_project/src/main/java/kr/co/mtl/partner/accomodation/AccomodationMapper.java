package kr.co.mtl.partner.accomodation;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AccomodationMapper {
	
	
	void registerAccomodation(Map<String,Object> param);
	

}

package kr.co.mtl.user.location;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mtl.user.partner.PartnerMapper;

@Service
public class LocationServiceImpl implements LocationService {

	@Autowired
	private LocationMapper locationMapper;

	@Autowired
	private PartnerMapper partnrMapper;

	/** 시온
	 * [사용자] 지역 별 여행지 리스트 조회
	 * @param LOCATION테이블에서 쓰일 area지역, type타입
	 * @return 여행지 리스트 페이지에 조회 될 여행지 목록들을 Map 형태로 저장하여 반환
	 */
	public Map<String, Object> getLocationList(Map<String, Object> param) {

		Map<String, Object> result = new HashMap<>();
		System.out.println("param 값은 멀까요" + param);
		List<Map<String, Object>> list = locationMapper.getLocationList(param);
		int count = locationMapper.getLocationListCount(param);
		
		for(Map<String, Object> data : list) {  // 반복문 돌면서 data에는 여행지 정보, 사진, 키워드 데이터가 합쳐짐
			param.put("location_idx", data.get("location_idx")); // param으로 location_idx를 넘겨줌
			
			Map<String, Object> img = locationMapper.getLocationImage(param);
			System.out.println("img: " + img);
			data.put("image", img);
			
			List<Map<String, Object>> keyword = locationMapper.getLocationKeyword(param); // param으로 location_idx를 넘겨줌
			System.out.println("keyword: " + keyword);
			data.put("keyword", keyword); 
		}
		
		
		result.put("LocationList", list);  // 지역 별 여행지 리스트
		
		// 페이징 처리를 위한 list의 total 총 개수를 함께 result로 넘겨줘야함
		result.put("LocationListCount", count);  // 지역 별 여행지 리스트 총 개수
		
		return result;
	};

	/** 시온
	 * [사용자] 여행지(관광지/맛집) 상세페이지 조회 => (상세페이지 사진, 상세페이지 정보, 상세페이지 키워드 3가지 mapper를 사용)
	 * @param location_idx
	 * @return 여행지 상세페이지에 들어갈 내용들을 Map 형태로 저장하여 반환
	 */
	public Map<String, Object> getLocationDetail(Map<String, Object> param) {
		// 여기는 처음부터 param 값에 location_idx가 들어옴. 리스트에서 클릭해서 location_idx값에 대한 상세정보를 조회하는 것이기 때문.

		Map<String, Object> result = new HashMap<>();

		List<Map<String, Object>> img = locationMapper.getLocationDetailImage(param); // 여행지(관광지/맛집) 상세페이지 사진
		Map<String, Object> description = locationMapper.getLocationDetailDescription(param); // 여행지(관광지/맛집) 상세페이지 정보
		List<Map<String, Object>> keyword = locationMapper.getLocationDetailKeyword(param); // 여행지(관광지/맛집) 상세페이지 키워드

		// 위에서 받은 사진/정보/키워드 정보들을 Key:value 형태로 result에 넣어준다.
		result.put("Image", img);
		result.put("Description", description);
		result.put("Keyword", keyword);

		return result;
	};
	
	/**
	 * 랜덤 여행지 리스트
	 * @param param
	 * @return
	 */
	public Map<String, Object> getRandomLocationList(Map<String, Object> param) {

		Map<String, Object> result = new HashMap<>();

		result.put("list", locationMapper.getRandomLocationList(param));

		return result;
	};

	/**
	 * 여행지 정보
	 * @param param
	 * @return
	 */
	public Map<String, Object> getLocationMinDetail(Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		
		result.put("data", locationMapper.getLocationMinDetail(param));
		
		return result;
	};
	
	/**
	 * 여행지 추천 저장
	 * @param param
	 * @return
	 */
	public Map<String, Object> insertCustomLocation(Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		
		if (locationMapper.insertCustomLocation(param) <= 0) {
			result.put("result", false);
			return result;
		}
		
		result.put("result", true);

		return result;
	};
	
	/**
	 * 여행지 추천 리스트
	 * @param param
	 * @return
	 */
	public Map<String, Object> getCustomList(Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		
		Map<String, Object> geoParam = new HashMap<>();

		// 숙소 위도, 경도 확인
		Map<String, Object> geo = partnrMapper.getPartnerGeo(param);
		param.put("area", geo.get("area"));
		geoParam.put("partnerLat", geo.get("latitude"));
		geoParam.put("partnerLon", geo.get("longitude"));

		List<Map<String, Object>> nearLocationList= new ArrayList<>();
		
		// 같은 지역 여행지 위도, 경도
		List<Map<String, Object>> locationList = locationMapper.getLocationListWithCustom(param);
		for (Map<String, Object> location : locationList) {
			geoParam.put("locationLat", location.get("latitude"));
			geoParam.put("locationLon", location.get("longitude"));

			// 숙소와 여행지 간의 최단 거리
			double distance = calculateDistance(geoParam);
			
			// 반경 5km 이내 여행지
			if(distance <= 5) {
				nearLocationList.add(location);
			}
		}
		
		result.put("list", nearLocationList);
		
		return result;
	};
	
	/**
	 * 여행지 추천 유무 확인
	 * @param param
	 * @return
	 */
	public Map<String, Object> checkCustomLocation(Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		
		result.put("result", locationMapper.checkCustomLocation(param));
		
		return result;
	};

	/**
	 * 저장된 여행지 추천 리스트
	 * @param param
	 * @return
	 */
	public Map<String, Object> getSavedCustomList(Map<String, Object> param) {
		
		Map<String, Object> result = new HashMap<>();
		
		result.put("list", locationMapper.getSavedCustomList(param));
		
		return result;
	};
	
	
	/**
	 * 하버사인 공식
	 * @return 두 지점 간의 최단 거리
	 */
	private double calculateDistance(Map<String, Object> geo) {
		
		// 지구 반지름
		final double EARTH_RADIUS = 6371.0;
		
		// 위도, 경도
		double partnerLat = Double.parseDouble((String) geo.get("partnerLat"));
		double partnerLon = Double.parseDouble((String) geo.get("partnerLon"));
		double locationLat = Double.parseDouble((String) geo.get("locationLat"));
		double locationLon = Double.parseDouble((String) geo.get("locationLon"));
		
		double dLat = Math.toRadians(locationLat - partnerLat);
        double dLon = Math.toRadians(locationLon - partnerLon);

        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2)
                + Math.cos(Math.toRadians(partnerLat)) * Math.cos(Math.toRadians(locationLat))
                * Math.sin(dLon / 2) * Math.sin(dLon / 2);

        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
		
		return EARTH_RADIUS * c;
	};
}

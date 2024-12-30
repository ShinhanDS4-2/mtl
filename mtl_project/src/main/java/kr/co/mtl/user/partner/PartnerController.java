package kr.co.mtl.user.partner;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/user/partner")
public class PartnerController {

	@Autowired
	private PartnerService partnerService;

	/**
	 * 인기 숙소 리스트
	 * @param param
	 * @return 숙소 리스트
	 */
	@PostMapping("/best/list")
	public Map<String, Object> getBestPartnerList(@RequestBody Map<String, Object> param) throws Exception {
		
		Map<String, Object> result = partnerService.getBestPartnerList(param);
		
		return result;
	}
	
	/**
	 * 숙소 검색
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/search/list")
	public Map<String, Object> getPartnerSearchList(@RequestBody Map<String, Object> param) throws Exception {

		Map<String, Object> result = partnerService.getPartnerSearchList(param);
		
		return result;
	}

	/**
	 * 숙소 상세
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/detail")
	public Map<String, Object> getPartnerDetail(@RequestBody Map<String, Object> param) throws Exception {
		
		Map<String, Object> result = partnerService.getPartnerDetail(param);
		
		return result;
	}
	
	
	@Autowired
	private PartnerMapper mapper;
	
	@PostMapping("/make/room")
	public void makeRoom() throws Exception {
		
		List<Map<String, Object>> list =  mapper.getPartnerInfo();
		Random random = new Random();
		
		for (Map<String, Object> data : list) {
			// room_type 설정
			String[] roomTypes = {"스탠다드", "디럭스", "패밀리"};
			String roomType1 = roomTypes[random.nextInt(roomTypes.length)];
			String roomType2 = roomTypes[random.nextInt(roomTypes.length)];
			while (roomType2.equals(roomType1)) {
				roomType2 = roomTypes[random.nextInt(roomTypes.length)];
			}
			List<String> roomTypeList = Arrays.asList(roomType1, roomType2);

			for(String roomType : roomTypeList) {
				data.put("room_type", roomType);
				
				// description 설정
				Map<String, String> descriptions = Map.of(
						"스탠다드", "아늑하고 기본적인 편안함을 제공합니다.",
						"디럭스", "넓고 고급스러운 객실을 제공합니다.",
						"패밀리", "가족을 위한 넉넉한 공간을 제공합니다."
						);
				data.put("description", descriptions.get(roomType));
				
				// count 설정
				int count = random.nextInt(4) + 1; // 1~4
				data.put("count", count);
				
				// standard 설정
				int standard = 2;
				if ("디럭스".equals(roomType)) {
					standard = random.nextInt(2) + 2; // 2 또는 3
				} else if ("패밀리".equals(roomType)) {
					standard = 3;
				}
				data.put("standard", standard);
				
				// maximum 설정
				int maximum = 2;
				if ("스탠다드".equals(roomType)) {
					maximum = random.nextInt(2) + 2; // 2 또는 3
				} else if ("디럭스".equals(roomType)) {
					maximum = random.nextInt(2) + 2; // 2 또는 3
				} else if ("패밀리".equals(roomType)) {
					maximum = 4;
				}
				data.put("maximum", maximum);
				
				// basic_price 설정
				int basicPrice = 0;
				if ("스탠다드".equals(roomType)) {
					basicPrice = (random.nextInt(3) + 2) * 50000; // 100000~250000
				} else if ("디럭스".equals(roomType)) {
					basicPrice = (random.nextInt(3) + 4) * 50000; // 150000~350000
				} else if ("패밀리".equals(roomType)) {
					basicPrice = (random.nextInt(3) + 6) * 50000; // 200000~400000
				}
				data.put("basic_price", basicPrice);
				
				// weekend_price 설정
				int weekendPrice = basicPrice + 50000;
				data.put("weekend_price", weekendPrice);
				
				// 데이터 추가
				mapper.addRoom(data);
			}
			
		}
	}
}

package kr.co.mtl.partner.room;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.mtl.s3.S3Service;

@Service
public class RoomServiceImpl implements RoomService{

	@Autowired
	private RoomMapper roomMapper;
	
	@Autowired
	private S3Service s3service;
	
	//조회
	@Override
	public List<Map<String, Object>> getRoomList(int partner_idx) {
			
		return roomMapper.getRoomList(partner_idx);
	}
	
	//객실 등록
	@Override
	public void roomRegister(int partner_idx,Map<String, Object> param, List<String> option, List<MultipartFile> images) throws IOException {
		
		param.put("partner_idx",partner_idx);
		roomMapper.roomRegister(param);
		int roomIdx = roomMapper.getIdx();
		
		for(String opt:option) {
			System.out.println("serviceImpl 시---작 : room_idx = "+roomIdx+" option = "+option + " opt = "+opt);
			roomMapper.roomFacilitiesRegister(roomIdx, opt);
		}
		
		boolean isThumbnail=true;
		
		for(MultipartFile image:images) {
			if(!image.isEmpty()) {
				
				String fileName=image.getOriginalFilename();
				String filePath="partner/"+roomIdx+"/"+fileName;
				String imageUrl=s3service.uploadFile(image, filePath);
						
				roomMapper.saveImageInfo(roomIdx,"R",imageUrl,isThumbnail ? "Y":"N",fileName);
				isThumbnail=false;
			}
		}
	}
	
	//객실 상세
	@Override
	public Map<String,Object> getRoomDetail(int room_idx) {
		
		System.out.println("객실 상세 = "+room_idx);
		Map<String,Object> result=new HashMap<>();
		
		Map<String,Object> roomInfo=roomMapper.getRoomDetail(room_idx);
		System.out.println("roomInfo = "+roomInfo);
		
		List<Map<String,Object>> roomFacilitiesInfo=roomMapper.getRoomFacility(room_idx);
		System.out.println("roomFacilitiesInfo = "+roomFacilitiesInfo);
		
		List<Map<String,Object>> imageUrl=roomMapper.getImageUrl(room_idx);
		System.out.println("imageUrl = "+imageUrl);
		
		result.put("roomInfo", roomInfo);
		result.put("roomFacilitiesInfo", roomFacilitiesInfo);
		result.put("imageUrl",imageUrl);
		
		System.out.println("result = "+result);
		return result;
	}
	
	
	//객실 수정
	@Override
	public void roomUpdate(Map<String, Object> param, List<String> option, List<MultipartFile> images) throws Exception {

		
		roomMapper.roomUpdate(param);
		
		int room_idx = Integer.parseInt((String)param.get("room_idx")) ;
		System.out.println("업데이트에서 room_idx 가져오니? = "+room_idx);
		
		roomMapper.roomFacilitiesDelete(room_idx);
		
		for(String opt:option) {
			System.out.println("serviceImpl 시---작 : room_idx = "+room_idx+" option = "+option + " opt = "+opt);
			roomMapper.roomFacilitiesRegister(room_idx, opt);
		}
		
		//추가된 이미지가 있을 떄
		if(images!=null && !images.isEmpty()) {
			
			List<Map<String,String>>existImages=roomMapper.getImagesByRoomIdx(room_idx);
			
			for(Map<String,String> imageInfo:existImages) {
				String url=imageInfo.get("url");
				String filePath = s3service.extractFilePathFromUrl(url);
				
				System.out.println("filePath = "+filePath);
				s3service.deleteFile(filePath);
				System.out.println("기존 이미지 삭제 됨");
			}
			
			roomMapper.deleteImage(room_idx);
			
			// 새로운 이미지 업로드 및 등록
	        boolean isThumbnail = true; // 첫 번째 이미지를 썸네일로 설정
	        for (MultipartFile image : images) {
	            if (!image.isEmpty()) {
	                String fileName = image.getOriginalFilename();
	                String filePath = "partner/" + room_idx + "/" + fileName;
	                String imageUrl = s3service.uploadFile(image, filePath);

	                // DB에 이미지 정보 저장
	                roomMapper.saveImageInfo(room_idx, "R", imageUrl, isThumbnail ? "Y" : "N", fileName);
	                isThumbnail = false;
	            }
	        }
	        
	        System.out.println("새로운 이미지 저장 완료");
			
		}
		
		
	}

	

	@Override
	public void roomDelete(int room_idx) {
		
		System.out.println("삭제 서비스 실행");
		roomMapper.roomDelete(room_idx);
	}


	

	

}
